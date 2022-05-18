package com.kingsley.base.config

import cn.hutool.core.collection.CollectionUtil
import com.google.common.collect.ImmutableList
import com.kingsley.base.utils.I18nUtils
import com.kingsley.base.utils.I18nUtils.getLocaleByCode
import org.apache.commons.lang3.ObjectUtils
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.beans.factory.annotation.Value
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.i18n.LocaleContext
import org.springframework.context.i18n.TimeZoneAwareLocaleContext
import org.springframework.core.Ordered
import org.springframework.lang.NonNull
import org.springframework.lang.Nullable
import org.springframework.web.servlet.HandlerInterceptor
import org.springframework.web.servlet.LocaleResolver
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
import org.springframework.web.servlet.i18n.AbstractLocaleContextResolver
import java.util.*
import java.util.stream.Collectors
import java.util.stream.Stream
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Configuration
class I18nConfiguration : WebMvcConfigurer {
    private val log = LoggerFactory.getLogger(I18nConfiguration::class.java)

    @Autowired(required = false)
    var localeCustomerList: List<I18nsLocaleCustomer?>? = null

    //language = props.getProperty("user.language", "en");
    @Value("\${config.i18ns.default-locale:en}")
    lateinit var defaultLocale: String

    @Value("\${config.i18ns.head:x-locale}")
    var localeHead: String? = null

    /**
     * 默认解析器
     */
    @Bean
    fun localeResolver(): LocaleResolver {
        val localeResolver: AbstractLocaleContextResolver = object : AbstractLocaleContextResolver() {
            @NonNull
            override fun resolveLocaleContext(@NonNull request: HttpServletRequest): LocaleContext {
                return object : TimeZoneAwareLocaleContext {
                    override fun getLocale(): Locale? {
                        val currentLocale = request.getAttribute(CURRENT_LOCALE)
                        if (ObjectUtils.isNotEmpty(currentLocale)) {
                            return getLocaleByCode(currentLocale.toString())
                        }
                        var localeInHead: String
                        val langHeaders = Stream.of(
                            request.getHeader(localeHead), request.getHeader(
                                LANGUAGE_CUSTOM_HEAD
                            )
                        ).collect(Collectors.toList())
                        for (langHeader in langHeaders) {
                            localeInHead = langHeader
                            if (StringUtils.isNotBlank(localeInHead)) {
                                if (CollectionUtil.isNotEmpty(localeCustomerList)) {
                                    for (i18nsLocaleCustomer in localeCustomerList!!) {
                                        localeInHead = i18nsLocaleCustomer!!.customer(localeInHead)
                                    }
                                }
                                return getLocaleByCode(localeInHead)
                            }
                        }
                        val langHead = request.getHeader(LANGUAGE_HEAD)
                        log.debug("獲取到瀏覽器語言信息:{}", langHead)
                        if (StringUtils.isNotBlank(langHead)) {
                            //Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6,zh-TW;q=0.5
                            //嘗試獲取瀏覽器的語言
                            val langs = langHead.replace(";q=.*?,".toRegex(), ",").replace("-".toRegex(), "_")
                            val split = StringUtils.split(langs, ',')
                            //這裡只處理第一個
                            localeInHead = split[0]
                            log.debug("第一個語言:{},完整列表:{}", localeInHead, java.util.List.of(langs))
                            if (CollectionUtil.isNotEmpty(localeCustomerList)) {
                                for (i18nsLocaleCustomer in localeCustomerList!!) {
                                    localeInHead = i18nsLocaleCustomer!!.customer(localeInHead)
                                }
                            }
                            return getLocaleByCode(localeInHead)
                        }
                        return Locale(this@I18nConfiguration.defaultLocale)
                    }

                    @Nullable
                    override fun getTimeZone(): TimeZone? {
                        return TimeZone.getDefault()
                    }
                }
            }

            override fun setLocaleContext(
                @NonNull request: HttpServletRequest,
                @Nullable response: HttpServletResponse?,
                @Nullable localeContext: LocaleContext?
            ) {
                if (localeContext == null || localeContext.locale == null) {
                    request.removeAttribute(CURRENT_LOCALE)
                } else {
                    request.setAttribute(CURRENT_LOCALE, localeContext.locale.toString())
                }
            }
        }
        val defaultLocale = getLocaleByCode(defaultLocale)
        Locale.setDefault(defaultLocale)
        localeResolver.setDefaultLocale(defaultLocale)
        return localeResolver
    }

    //    @Override
    //    public void addInterceptors(InterceptorRegistry registry) {
    //        registry.addInterceptor(new I18nInterceptor());
    //    }
    private class I18nInterceptor : HandlerInterceptor {
        @Throws(Exception::class)
        override fun preHandle(
            @NonNull request: HttpServletRequest,
            @NonNull response: HttpServletResponse, @NonNull handler: Any
        ): Boolean {

//            request.getParameter("")
            return super.preHandle(request, response, handler)
        }
    }

    /**
     * 通過實現這個bean來滿足對多語言code的自定義處理
     */
    interface I18nsLocaleCustomer : Ordered {
        /**
         *
         * @param locale 本地code
         * @return 返回新的本地code
         */
        fun customer(locale: String): String
    }

    /**
     * 簡單實現. 滿足App對多語言的基本處理方案.
     */
    class SimpleI18nsLocaleCustomer : I18nsLocaleCustomer {
        private val allowLocal: ImmutableList<String>?

        constructor() {
            allowLocal = null
        }

        /**
         * 允許的語言列表.如果不存在則返回第一個.
         * @param countries 允許的語言列表
         */
        constructor(vararg countries: String) {
            allowLocal = ImmutableList.copyOf(countries)
        }

        override fun customer(s: String): String {
            var s = s
            s = s.replace('-', '_')
            if (allowLocal != null && allowLocal.size > 0) {
                //如果存在允許列表.則直接返回
                for (s1 in allowLocal) {
                    if (s1.equals(s, ignoreCase = true)) {
                        return s
                    }
                }
            }
            if ("zh_CN".equals(s, ignoreCase = true)) {
                return "zh_CN"
            }

            //繁體語係統一為 zh_HK
            for (traditionalChineseLocale in I18nUtils.TRADITIONAL_CHINESE_LOCALES) {
                if (traditionalChineseLocale.equals(s, ignoreCase = true)) {
                    return "zh_HK"
                }
            }

            //其他中文語係統一為簡體中文
            if (s.startsWith("zh")) {
                return "zh_CN"
            }

            //其他所有語係只保留語言部分.忽視國家部分
            val index = s.indexOf("_")
            var local = s
            if (index > 0) {
                local = s.substring(0, index)
            }
            return if (allowLocal != null && allowLocal.size > 0 && !allowLocal.contains(local)) {
                //如果允許列表不存在,則返回第一個
                allowLocal[0]
            } else local
        }

        override fun getOrder(): Int {
            return -1
        }
    }

    companion object {
        const val LANGUAGE_CHANGE_PARAM = "x-locale"
        const val LANGUAGE_HEAD = "Accept-Language"
        const val LANGUAGE_CUSTOM_HEAD = "x-accept-language"
        private const val CURRENT_LOCALE = "currentLocale"
    }
}