package com.kingsley.base.dto

import com.kingsley.base.exception.ErrorCode
import com.kingsley.base.exception.ErrorResponseExtHandler
import com.kingsley.base.utils.SpringContextUtils
import org.springframework.util.CollectionUtils
import java.io.ByteArrayOutputStream
import java.io.Serializable
import io.swagger.annotations.ApiModel
import io.swagger.annotations.ApiModelProperty
import java.io.PrintStream

/**
 * 用于标准化返回json结构
 *
 * @param <T>
 */
@ApiModel("通用返回格式")
data class RR<T>(
    @ApiModelProperty("业务状态码,200表示OK")
    var code: Int = 200,
    @ApiModelProperty("错误信息")
    var message: String? = "",
    @ApiModelProperty("返回值")
    var data: T,
    @ApiModelProperty("擴展信息,不同項目的結構和作用不同")
    var ext: Map<String, Any?>? = null
) : Serializable {

    data class PageDTO<C>(
        @ApiModelProperty("分頁信息")
        var pager: PageInfo? = null,
        @ApiModelProperty("包含的記錄列表")
        var items: List<C>? = null
    )

    companion object {

        @JvmStatic
        fun ok() = ok(null)

        @JvmStatic
        fun <T> ok(data: T): RR<T> {
            return RR(200, "", data)
        }

        @JvmOverloads
        @JvmStatic
        fun error(message: String?, code: Int = 400, data: Any? = null): RR<Any?> {
            var content: Any? = null
            var exception: Any? = null
            if (data is Throwable) {
                // 如果是测试环境,则返回详细堆栈
                if (SpringContextUtils.isNotProd) {
                    val outputStream = ByteArrayOutputStream()
                    data.printStackTrace(PrintStream(outputStream))
                    exception = outputStream.toString()
                }
            } else {
                content = data
            }

            //這裡是正常error返回的時候, 通過搜索 SpringContextUtils.getBeansByType(ErrorResponseExtHandler 來查找所有添加的地方
            var ext: MutableMap<String, Any?>? = HashMap()
            val beansByType: List<ErrorResponseExtHandler> = SpringContextUtils.getBeansByType(
                ErrorResponseExtHandler::class.java
            )
            for (errorResponseExtHandler in beansByType) {
                ext = errorResponseExtHandler.apply(ext)
            }
            if (exception != null) {
                ext!!["exception"] = exception
            }
            if (CollectionUtils.isEmpty(ext)) {
                ext = null
            }
            return RR(code, message, content, ext)
        }

        @JvmStatic
        fun error(code: ErrorCode): RR<Any?> {
            return error(code.enMessage, code.code)
        }

        @JvmStatic
        fun <C> page(items: List<C>?, current: Long?, size: Long?): RR<PageDTO<C>> {
            return page(items, current, size, null)
        }

        @JvmStatic
        fun <C> page(items: List<C>?, current: Long?, size: Long?, total: Long?): RR<PageDTO<C>> {
            return ok(PageDTO(PageInfo(current, size, total), items))
        }
    }
}