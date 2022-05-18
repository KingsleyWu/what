package com.kingsley.base.config


import cn.hutool.core.collection.CollectionUtil
import com.github.xiaoymin.knife4j.core.extend.OpenApiExtendSetting
import com.github.xiaoymin.knife4j.spring.annotations.EnableKnife4j
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMap
import com.kingsley.base.exception.ErrorCode
import com.kingsley.base.exception.scan.ErrorCodeBeanRegistrar
import com.kingsley.base.exception.scan.ErrorCodeScanner
import com.kingsley.base.service.GlobalRequestParameterCustomer
import com.kingsley.base.utils.JSONUtils
import com.kingsley.base.utils.MarkdownUtils
import com.kingsley.base.utils.ResourceUtils
import com.kingsley.base.utils.SpringContextUtils
import io.swagger.annotations.ApiOperation
import org.apache.commons.lang3.ObjectUtils
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Import
import org.springframework.context.annotation.Profile
import org.springframework.core.annotation.AnnotationUtils
import org.springframework.core.env.Environment
import org.springframework.http.ResponseEntity
import org.springframework.lang.NonNull
import org.springframework.util.CollectionUtils
import org.springframework.web.servlet.HandlerInterceptor
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.InterceptorRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import springfox.documentation.builders.*
import springfox.documentation.service.*
import springfox.documentation.spi.DocumentationType
import springfox.documentation.spi.service.contexts.SecurityContext
import springfox.documentation.spring.web.json.Json
import springfox.documentation.spring.web.plugins.Docket
import springfox.documentation.swagger2.annotations.EnableSwagger2
import springfox.documentation.swagger2.web.Swagger2ControllerWebMvc
import java.io.IOException
import java.util.*
import java.util.stream.Collectors
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


@Configuration
@EnableSwagger2
@EnableKnife4j
@EnableWebMvc
@Import(ErrorCodeBeanRegistrar::class)
@Profile("local", "beta", "devel", "testing")
class Knife4jConfiguration : WebMvcConfigurer {

    private val log = LoggerFactory.getLogger(Knife4jConfiguration::class.java)

    init {
        log.info("????????????????????")
    }

    @Autowired(required = false)
    var globalRequestParameterCustomer: GlobalRequestParameterCustomer? = null

    @Autowired
    var applicationInfo: ApplicationInfo? = null

    @Autowired
    var environment: Environment? = null

    @Value("\${knife4j.basePackage}")
    private val basePackage: String? = null

    @Value("\${knife4j.authorization:Authorization}")
    private val authorizationKey: String? = null

    @Value("\${springfox.documentation.swagger.v2.path:/v2/api-docs}")
    private val apiUrl: String? = null

    @Bean(value = ["defaultApi2"])
    fun defaultApi2(environment: Environment): Docket {
        val docket: Docket = Docket(DocumentationType.SWAGGER_2)
            .apiInfo(
                ApiInfoBuilder()
                    .title(environment.getProperty("spring.application.name") + " APIs")
                    .description("# " + environment.getProperty("spring.application.name") + " restful APIs ")
                    .termsOfServiceUrl("https://www.kingsley.com")
                    .contact(Contact("kingsley", "https://www.kingsley.com", "contact@kingsley.com"))
                    .version("1.0")
                    .build()
            ) //                .enable(!environment.getActiveProfiles()[0].toLowerCase(Locale.ROOT).startsWith("prod"))
            //分组名称
            .groupName("1.0版本")
            .select() //这里指定Controller扫描包路径
            .apis(RequestHandlerSelectors.basePackage(basePackage))
            .paths(PathSelectors.any())
            .build()
            .globalRequestParameters(buildGlobalRequestParameters())
        val property = environment.getProperty("config.auth.enable")
        val authType = environment.getProperty("config.auth.type")
        if ("true".equals(property, ignoreCase = true) && "only" != authType) {
            docket.securitySchemes(unifiedAuth())
                .securityContexts(securityContexts())
        } else if ("only" == authType) {
            log.warn("由於配置權限類型為部分地址:type={},跳過swagger權限配置.", authType)
        } else {
            log.warn("由於沒有配置權限,跳過swagger權限配置.")
        }
        log.info("swagger init success ")
        return docket
    }

    private fun securityContexts(): List<SecurityContext> {
        return listOf(SecurityContext.builder()
            .securityReferences(defaultAuth())
            .operationSelector { true }
            .build()
        )
    }

    private fun defaultAuth(): List<SecurityReference> {
        val authorizationScope = AuthorizationScope("global", "accessEverything")
        val authorizationScopes = arrayOfNulls<AuthorizationScope>(1)
        authorizationScopes[0] = authorizationScope
        return listOf(SecurityReference(authorizationKey, authorizationScopes))
    }

    private fun buildGlobalRequestParameters(): List<RequestParameter> {
        return if (globalRequestParameterCustomer != null) {
            log.info("檢測到全局自定義參數配置,這將覆蓋默認的全局頭信息")
            val parameters: List<RequestParameter> = globalRequestParameterCustomer!!.globalRequestParameters()
            for (parameter in parameters) {
                log.info("添加全局請求參數:{}", parameter)
            }
            parameters
        } else {
            val parameters: MutableList<RequestParameter> = ArrayList<RequestParameter>()
            val parameterBuilder = RequestParameterBuilder()
            val localeHead = environment!!.getProperty("config.i18ns.head", "x-locale")
            parameterBuilder.name(localeHead)
                .description("本地語言code")
                .`in`(ParameterType.HEADER)
                .required(false)
            parameters.add(parameterBuilder.build())
            parameters
        }
    }

    private fun unifiedAuth(): List<SecurityScheme> {
        val result: MutableList<SecurityScheme> = ArrayList()
        val e = ApiKey(authorizationKey, authorizationKey, "header")
        result.add(e)
        return result
    }

    override fun addInterceptors(registry: InterceptorRegistry) {
        registry.addInterceptor(object : HandlerInterceptor {
            @Suppress("UNCHECKED_CAST")
            override fun preHandle(
                @NonNull httpServletRequest: HttpServletRequest,
                @NonNull httpServletResponse: HttpServletResponse,
                @NonNull o: Any
            ): Boolean {
                try {
                    if (API_JSON_CACHE == null) {
                        val bean: Swagger2ControllerWebMvc = SpringContextUtils.applicationContext.getBean(
                            Swagger2ControllerWebMvc::class.java
                        )
                        val group: ResponseEntity<Json> =
                            bean.getDocumentation(httpServletRequest.getParameter("group"), httpServletRequest)
                        val result: MutableMap<Any, Any> =
                            JSONUtils.parseToBean(
                                JSONUtils.toJsonString(group.body),
                                MutableMap::class.java
                            ) as MutableMap<Any, Any>
                        log.info("SWAGGER RESULT:\n{}", JSONUtils.toJsonString(group.body))
                        var tags = result["tags"] as MutableList<Any>?
                        if (CollectionUtils.isEmpty(tags)) {
                            log.error("在swagger 文檔中 沒有找到 [tags]節點,這可能是因為配置信息 [knife4j.basePackage] 的值配置錯誤,建議配置為 [com.xxx]")
                            tags = ArrayList<Any>()
                            result["tags"] = tags
                        }
                        val totalErrorCode: ImmutableMap<Int, ErrorCode>? = ErrorCodeScanner.totalErrorCode

                        var paths = result["paths"] as MutableMap<String, Map<*, *>>?
                        if (CollectionUtils.isEmpty(paths)) {
                            paths = HashMap()
                            result["paths"] = paths
                        }
                        var openapiInfo = result["x-openapi"] as MutableMap<Any, Any>?
                        if (openapiInfo == null) {
                            openapiInfo = HashMap<Any, Any>()
                            result["x-openapi"] = openapiInfo
                            openapiInfo["x-setting"] = OpenApiExtendSetting()
                        }
                        var docs = openapiInfo["x-markdownFiles"] as MutableList<Any>?
                        if (CollectionUtils.isEmpty(docs)) {
                            docs = ArrayList()
                            openapiInfo["x-markdownFiles"] = docs
                        }
                        val docsDir = "docs"
                        val docsPath = "classpath:$docsDir/**/*.md"
                        var resourceInfos: List<ResourceUtils.ResourceInfo>? = null
                        try {
                            resourceInfos = ResourceUtils.listFile(docsPath)
                        } catch (e: IOException) {
                            log.debug("嘗試獲取文檔目錄({})失敗,發生錯誤:{}", docsPath, e.message)
                        }
                        if (CollectionUtil.isNotEmpty(resourceInfos)) {
                            val docsMap: MutableMap<String, MutableList<Any>> = HashMap()
                            for (resourceInfo in resourceInfos!!) {
                                var title: String? = ""
                                var category = docsDir
                                if (docsDir != resourceInfo.file?.parentFile?.name) {
                                    category = docsDir + "-" + resourceInfo.file?.parentFile?.name
                                }
                                val content: String? = resourceInfo.content
                                val trim = content?.replace("[toc]", "")
                                    ?.replace("[TOC]", "")?.trim { it <= ' ' }
                                if (trim != null) {
                                    if (trim.startsWith("#")) {
                                        val split = trim.split("[\r\n]".toRegex(), limit = 2).toTypedArray()
                                        title = StringUtils.strip(split[0], " #")
                                    }
                                }
                                if (StringUtils.isBlank(title)) {
                                    title = resourceInfo.fileName
                                }
                                var subDocs = docsMap[category]
                                if (subDocs == null) {
                                    subDocs = ArrayList()
                                    docsMap[category] = subDocs
                                    val otherDoc: MutableMap<String, Any> = HashMap()
                                    otherDoc["name"] = category
                                    otherDoc["children"] = subDocs
                                    docs!!.add(otherDoc)
                                }
                                subDocs.add(
                                    buildHashMap(
                                        "title",
                                        title!!,
                                        "content",
                                        MarkdownUtils.toHtml(content ?: "")
                                    )
                                )
                            }
                        }
                        if (totalErrorCode != null && !totalErrorCode.isEmpty()) {
                            val errorCodeDoc: MutableMap<String, Any> = HashMap()
                            errorCodeDoc["name"] = "錯誤碼"
                            val subDocs: MutableList<Any> = ArrayList()
                            errorCodeDoc["children"] = subDocs
                            docs!!.add(errorCodeDoc)
                            val collect: Map<out Class<out ErrorCode?>, List<ErrorCode>> =
                                totalErrorCode.values.stream().collect(
                                    Collectors.groupingBy { obj: ErrorCode -> obj.javaClass })
                            for (aClass in collect.keys) {
                                val name = aClass.name
                                var summary = aClass.simpleName
                                val description = StringBuilder()
                                val annotation: ApiOperation? =
                                    AnnotationUtils.findAnnotation(aClass, ApiOperation::class.java)
                                if (annotation != null && StringUtils.isNotBlank(annotation.value)) {
                                    summary = annotation.value
                                    description.append(annotation.notes).append("\n\n")
                                }
                                val errorCodes = collect[aClass]!!.toMutableList()
                                errorCodes.sortWith(Comparator.comparing(ErrorCode::code))
                                description.append("## 錯誤碼類: `").append(name).append("`\n\n")
                                description.append("|Code|錯誤碼|中文錯誤信息|默認錯誤信息| \n")
                                description.append("|:---|:---|:---|:---| \n")
                                for (errorCode in errorCodes) {
                                    description.append(errorCode.toString()).append("|").append(errorCode.code)
                                        .append("|").append(errorCode.message).append("|").append(errorCode.enMessage)
                                        .append("\n")
                                }
                                description.append("\n\n")
                                subDocs.add(
                                    buildHashMap(
                                        "title",
                                        summary,
                                        "content",
                                        MarkdownUtils.toHtml(description.toString())
                                    )
                                )
                            }
                        }
                        if (!CollectionUtils.isEmpty(paths)) {
                            for (value in paths!!.values) {
                                for (obj in value.values) {
                                    if (obj is Map<*, *>) {
                                        val item = obj as MutableMap<Any, Any>
                                        if (item.containsKey("description") && ObjectUtils.isNotEmpty(
                                                item["description"]
                                            )
                                        ) {
                                            item["description"] = MarkdownUtils.toHtml(item["description"].toString(), true)
                                        }
                                    }
                                }
                            }
                        }
                        API_JSON_CACHE = JSONUtils.toJsonString(result)
                        log.info("UPDATE RESULT:\n{}", API_JSON_CACHE)
                    }
                    httpServletResponse.characterEncoding = "utf-8"
                    httpServletResponse.addHeader("Content-Type", "application/json;charset=utf-8")
                    httpServletResponse.status = 200
                    //httpServletResponse.getWriter().println(JSONUtils.toJsonString(group.getBody()));
                    httpServletResponse.writer.println(API_JSON_CACHE)
                    httpServletResponse.flushBuffer()
                    return false
                } catch (ex: Exception) {
                    log.error(ex.message, ex)
                    //發生問題 回退到原始方法
                }
                return true
            }

            private fun buildHashMap(vararg objects: Any): Map<*, *> {
                val map: MutableMap<Any, Any> = LinkedHashMap()
                var i = 1
                while (i < objects.size) {
                    map[objects[i - 1]] = objects[i]
                    i += 2
                }
                return map
            }
        }).addPathPatterns(apiUrl)
        registry.addInterceptor(object : HandlerInterceptor {
            @Throws(Exception::class)
            override fun preHandle(
                @NonNull request: HttpServletRequest,
                @NonNull response: HttpServletResponse,
                @NonNull handler: Any
            ): Boolean {
                if (API_INDEX_CACHE == null) {
                    val content: String? = ResourceUtils.readResourceAsString("/META-INF/resources/doc.html")
                    val applyContent = """
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.0.0/github-markdown.min.css" integrity="sha512-nxv6uny69e6SeGW/aOEW0iC2+ruQMKvFDbjav6sVu1dr89ioo5wBm3F0IbBGsNyAt6nuBR/x2HUSx0a7wLEegA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>.ant-layout-sider{min-width: 400px !important;}</style>
</head>"""
                    API_INDEX_CACHE = content?.replace("</head>", applyContent)
                }
                response.characterEncoding = "utf-8"
                response.addHeader("Content-Type", "text/html")
                response.status = 200
                //                    httpServletResponse.getWriter().println(JSONUtils.toJsonString(group.getBody()));
                response.writer.println(API_INDEX_CACHE)
                response.flushBuffer()
                return false
            }
        }).addPathPatterns("/doc.html")
    }

    companion object {
        private val IGNORE_METHOD_NAMES: List<String> =
            ImmutableList.copyOf(arrayOf("wait", "equals", "toString", "hashCode", "getClass", "notify", "notifyAll"))
        private val IGNORE_PARENT_CLASS: List<String> =
            ImmutableList.copyOf(arrayOf("com.baomidou.mybatisplus.extension.service.impl.ServiceImpl"))
        private var API_JSON_CACHE: String? = null
        private var API_INDEX_CACHE: String? = null
    }
}