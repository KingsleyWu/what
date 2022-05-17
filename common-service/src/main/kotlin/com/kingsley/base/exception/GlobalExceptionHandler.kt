package com.kingsley.base.exception

import com.kingsley.base.config.property.SlackWebHookProperties
import com.kingsley.base.dto.RR
import com.kingsley.base.exception.scan.ErrorCodeBeanRegistrar
import com.kingsley.base.utils.ExceptionUtils
import com.kingsley.base.utils.SpringContextUtils
import com.kingsley.base.utils.message.SlackUtils
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.web.servlet.error.ErrorController
import org.springframework.http.HttpStatus
import org.springframework.http.converter.HttpMessageNotReadableException
import org.springframework.security.access.AccessDeniedException
import org.springframework.stereotype.Controller
import org.springframework.util.CollectionUtils
import org.springframework.validation.BindException
import org.springframework.validation.ObjectError
import org.springframework.web.HttpMediaTypeNotSupportedException
import org.springframework.web.HttpRequestMethodNotSupportedException
import org.springframework.web.bind.MethodArgumentNotValidException
import org.springframework.web.bind.MissingServletRequestParameterException
import org.springframework.web.bind.ServletRequestBindingException
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseStatus
import org.springframework.web.bind.annotation.RestControllerAdvice
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException
import org.springframework.web.multipart.MaxUploadSizeExceededException
import org.springframework.web.servlet.NoHandlerFoundException
import springfox.documentation.annotations.ApiIgnore
import java.util.stream.Collectors
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.validation.ConstraintViolation
import javax.validation.ConstraintViolationException

@Controller
@RestControllerAdvice
class GlobalExceptionHandler : ErrorController {
    private val log = LoggerFactory.getLogger(GlobalExceptionHandler::class.java)

    @Autowired
    var slackWebHookProperties: SlackWebHookProperties? = null

    /**
     * 400 - Bad Request
     * 这里列出的都是参数读取错误一类的异常
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(
        HttpMessageNotReadableException::class,  //请求参数解析失败的异常
        MissingServletRequestParameterException::class,  //缺少必要的参数
        BindException::class,  //对象绑定出现错误,一般是对象中某些属性不合规
        ServletRequestBindingException::class,  //无法将参数转换为目标对象,出现在过滤器或其他致命的异常情况
        MethodArgumentNotValidException::class,  //参数校验(@Valid)失败时引发,此异常继承自 BindException
        MethodArgumentTypeMismatchException::class,  //参数类型错误时引发
        ConstraintViolationException::class //违法约束(javax.validation)时引发
    )
    fun handleHttpMessageNotReadableException(e: Exception): RR<*> {
        log.error("参数解析失败", e)
        sendSlackError(e)
        if (e is MissingServletRequestParameterException) {
            return RR.error(e.message, CommErrorCode.E0000000400.code, e)
        }
        if (e is BindException) {
            return RR.error(
                e.allErrors
                    .stream()
                    .map { obj: ObjectError -> obj.defaultMessage }
                    .collect(Collectors.joining(";\n")), CommErrorCode.E0000000400.code, e
            )
        }
        if (e is ConstraintViolationException) {
            return RR.error(
                e.constraintViolations
                    .stream()
                    .map { obj: ConstraintViolation<*> -> obj.message }
                    .collect(
                        Collectors.joining(";\n")
                    ), CommErrorCode.E0000000400.code, e
            )
        }
        if (e is MethodArgumentTypeMismatchException) {
            return RR.error(
                ExceptionUtils.getFormatMessage(
                    CommErrorCode.E0000000490,
                    e.name,
                    e.parameter.parameterType.simpleName
                ), CommErrorCode.E0000000400.code, e
            )
        }

        //其他例外情况.为了安全,隐藏错误信息
        return RR.error(CommErrorCode.E0000000400.enMessage, CommErrorCode.E0000000400.code, e)
    }

    /**
     * 405 - Method Not Allowed
     * 带有@ResponseStatus注解的异常类会被ResponseStatusExceptionResolver 解析
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(
        HttpRequestMethodNotSupportedException::class
    )
    fun handleHttpRequestMethodNotSupportedException(e: HttpRequestMethodNotSupportedException): RR<*> {
        log.error("不支持当前请求方法", e)
        sendSlackError(e)
        return RR.error(
            ExceptionUtils.getFormatMessage(CommErrorCode.E0000000405, e.method),
            CommErrorCode.E0000000405.code
        )
    }

    /**
     * 600 - 文件尺寸過大
     *
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(
        MaxUploadSizeExceededException::class
    )
    fun uploadSizeExceededException(e: MaxUploadSizeExceededException): RR<*> {
        var sizeLimit: String? = SpringContextUtils.getEnvironment("spring.servlet.multipart.max-file-size")
        if (StringUtils.isBlank(sizeLimit)) {
            //SpringBoot2 默認的大小限制為1M
            sizeLimit = "1MB"
        }
        log.error("文件尺寸過大,Max:{}", sizeLimit, e)
        sendSlackError(e)
        return RR.error(
            ExceptionUtils.getFormatMessage(CommErrorCode.E0000000600, sizeLimit),
            CommErrorCode.E0000000600.code
        )
    }

    /**
     * 406 - Unsupported MediaType
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(
        HttpMediaTypeNotSupportedException::class
    )
    fun httpMediaTypeNotSupportedException(e: HttpMediaTypeNotSupportedException): RR<*> {
        log.error("不支持的媒體格式[{}]", e.contentType, e)
        sendSlackError(e)
        return RR.error(
            ExceptionUtils.getFormatMessage(CommErrorCode.E0000000406, e.contentType),
            CommErrorCode.E0000000406.code
        )
    }

    /**
     * 403 - ACCESS DENIED 无权访问
     * 带有@ResponseStatus注解的异常类会被ResponseStatusExceptionResolver 解析
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(
        AccessDeniedException::class
    )
    fun accessDeniedException(e: AccessDeniedException): RR<*> {
        log.error("拒绝访问", e)
        sendSlackError(e)
        return RR.error(CommErrorCode.E0000000403)
    }

    /**
     * 其他全局异常在此捕获
     *
     * @param e 異常對象
     * @return 統一格式的錯誤返回信息
     */
    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(Throwable::class)
    fun handleException(request: HttpServletRequest, e: Throwable): RR<*> {
        log.error("handleException 捕獲異常  ,[{}]:{}", request.requestURI, e.message)
        sendSlackError(e)
        if (e is BusinessException) {
            val be = e
            //對於權限認證異常,無需輸出完整日誌.
            if (be.code == CommErrorCode.E0000000401.code) {
                //未登录的异常特殊处理
                return do401(be)
            }
            log.error(be.message, be)

            //這裡是全局異常處理的時候增加擴展信息,通過搜索 SpringContextUtils.getBeansByType(ErrorResponseExtHandler 來查找所有添加的地方
            var ext: MutableMap<String, Any?>? = HashMap()
            val beansByType: List<ErrorResponseExtHandler> = SpringContextUtils.getBeansByType(
                ErrorResponseExtHandler::class.java
            )
            for (errorResponseExtHandler in beansByType) {
                ext = errorResponseExtHandler.apply(ext)
            }
            if (CollectionUtils.isEmpty(ext)) {
                ext = null
            }
            return RR.error(e.message, be.code, e).also {
                it.ext = ext
            }
        }
        log.error(e.message, e)
        //为了安全起见, 未知异常只有在非正式环境才输出详情
        return RR.error(CommErrorCode.E0000000500.enMessage, CommErrorCode.E0000000500.code, e)
    }

    @ResponseStatus(HttpStatus.OK)
    @ExceptionHandler(
        NoHandlerFoundException::class
    )
    fun noHandler(e: Throwable): RR<*> {
        log.error("没有找到响应方法", e)
        sendSlackError(e)
        if (e is NoHandlerFoundException) {
            return RR.error(
                ExceptionUtils.getFormatMessage(
                    CommErrorCode.E0000000494,
                    e.httpMethod,
                    e.requestURL
                ), CommErrorCode.E0000000404.code, e
            )
        }
        log.error("发现未处理异常!!")
        log.error(e.message, e)
        return RR.error(CommErrorCode.E0000000500.enMessage, CommErrorCode.E0000000500.code, e)
    }

    @ApiIgnore
    @RequestMapping("/error")
    fun error(request: HttpServletRequest, response: HttpServletResponse): RR<*> {
        val statusCode = request.getAttribute("javax.servlet.error.status_code") as Int
        var errorUri = request.getAttribute("javax.servlet.error.request_uri") as? String
        if (errorUri == null) {
            errorUri = request.getAttribute("javax.servlet.forward.request_uri") as? String
        }
        try {
            val errorQuery = request.getAttribute("javax.servlet.error.request_query") as? String
            if (errorUri != null && errorQuery != null) {
                errorUri += "?$errorQuery"
            }
        } catch (ex: Exception) {
            log.error(
                "error 信息處理時嘗試獲取 query({}) 參數時發生錯誤:{}",
                request.getAttribute("javax.servlet.error.request_query"),
                ex.message,
                ex
            )
        }
        val errorMessage = request.getAttribute("javax.servlet.error.exception") as? Exception
        //javax.servlet.error.exception
        //javax.servlet.error.status_code=500
        //javax.servlet.forward.request_uri=/doc.html
        //javax.servlet.forward.context_path=
        //javax.servlet.forward.servlet_path=/doc.html
        //javax.servlet.error.request_uri=/doc.html
        if (errorMessage != null) {
            log.error("error 捕獲異常 ,[{}]:{}", errorUri, errorMessage.message)
            return if (errorMessage is BusinessException) {
                response.setStatus(200)
                val be = errorMessage
                if (be.code == CommErrorCode.E0000000401.code) {
                    //未登录的异常特殊处理
                    return do401(be)
                }
                log.error(be.message, be)

                //這裡是全局異常處理的時候增加擴展信息,通過搜索 SpringContextUtils.getBeansByType(ErrorResponseExtHandler 來查找所有添加的地方
                var ext: MutableMap<String, Any?>? = HashMap()
                val beansByType: List<ErrorResponseExtHandler> = SpringContextUtils.getBeansByType(
                    ErrorResponseExtHandler::class.java
                )
                for (errorResponseExtHandler in beansByType) {
                    ext = errorResponseExtHandler.apply(ext)
                }
                if (CollectionUtils.isEmpty(ext)) {
                    ext = null
                }
                RR.error(be.message, be.code, be).also {
                    it.ext = ext
                }
            } else {
                //走到这里说明系统有不合理的地方.需要处理
                log.error("!!!未正确捕获的异常!!![{}]:{}", errorUri, errorMessage.message, errorMessage)
                RR.error(CommErrorCode.E0000000500.enMessage, CommErrorCode.E0000000500.code, errorMessage)
            }
        }
        if (statusCode == 403) {
            //SpringSecurity 鉴权失败会到这里
            log.warn("拒绝访问[{}],[{}]", statusCode, errorUri)
            return RR.error(CommErrorCode.E0000000403)
        }
        response.setStatus(404)
        log.warn("发现访问[{}],[{}]", statusCode, errorUri)
        return RR.error(CommErrorCode.E0000000404)
    }

    private fun do401(be: BusinessException): RR<Any?> {
//        log.warn("發現未授權訪問:{}",be.getMessage());
//        sendSlackError(be);
        val stackTrace = be.stackTrace
        if (stackTrace.size > 2) {
            log.warn("401 的可能觸發點:{}", stackTrace[1].toString())
        }
        return RR.error(be.message, be.code, "")
    }

    private fun sendSlackError(e: Throwable) {
        var errorUri: String? = null
        val request: HttpServletRequest? = SpringContextUtils.request
        if (request != null) {
            errorUri = request.getAttribute("javax.servlet.error.request_uri") as? String
            if (errorUri == null) {
                errorUri = request.getAttribute("javax.servlet.forward.request_uri") as? String
            }
        }
        if (StringUtils.isBlank(errorUri)) {
            errorUri = "UNKNOWN"
        }
        sendSlackError(errorUri, e)
    }

    /**
     * 發送異常到 slack
     * @param e 異常
     */
    private fun sendSlackError(uri: String?, e: Throwable) {
        val title = "http REQUEST ERROR url:[$uri]"
        SlackUtils.say(title, e)
    }
}