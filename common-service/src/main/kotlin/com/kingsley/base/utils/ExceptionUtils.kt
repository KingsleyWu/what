package com.kingsley.base.utils

import com.kingsley.base.exception.BusinessException
import com.kingsley.base.exception.ErrorCode
import org.slf4j.helpers.MessageFormatter
import java.io.ByteArrayOutputStream
import java.io.PrintStream
import java.util.*

object ExceptionUtils {
    /**
     * 格式化並拋出錯誤,如果有佔位符可以提供參數, 使用默認的 BusinessException
     * @param errorCode 錯誤碼
     * @param args 參數
     * @return 異常
     */
    fun exceptionAndFormat(errorCode: ErrorCode, vararg args: Any?): BusinessException {
        return exceptionAndFormat(errorCode, null, *args)
    }

    /**
     * 格式化並拋出錯誤,針對消息有佔位符的錯誤
     * @param errorCode 錯誤碼對象
     * @param cause 原始異常,可以為空, 只有非生產環境才會返回錯誤堆棧給調用方
     * @param args 佔位符替換的值.
     * @return 異常對象
     */
    fun exceptionAndFormat(errorCode: ErrorCode, cause: Throwable?, vararg args: Any?): BusinessException {
        val message = getFormatMessage(errorCode, *args)
        return BusinessException(message, errorCode.code, cause)
    }

    /**
     * 如果綁定的是一個i18n消息key , 可以這樣拋出本地語言信息
     * @param errorCode 錯誤碼對象
     * @param cause 原始異常,可以為空, 只有非生產環境才會返回錯誤堆棧給調用方
     * @param locale 本地語言
     * @param args 參數
     * @return 異常對象
     */
    fun exceptionAndI18n(
        errorCode: ErrorCode,
        cause: Throwable?,
        locale: Locale,
        vararg args: Any?
    ): BusinessException {
        val i18nMessage: String? = I18nUtils.getMessage(locale, errorCode.enMessage, args)
        return BusinessException(i18nMessage, errorCode.code, cause)
    }

    fun i18nException(errorCode: ErrorCode?, vararg args: Any?): BusinessException {
        return i18nException(null, errorCode, *args)
    }

    fun i18nException(cause: Throwable?, errorCode: ErrorCode, vararg args: Any?): BusinessException {
        return BusinessException(
            I18nUtils.getCurrentMessage(errorCode.enMessage, args),
            errorCode.code,
            cause
        )
    }

    fun i18nException(cause: Throwable?, locale: Locale, errorCode: ErrorCode, vararg args: Any?): BusinessException {
        return exceptionAndI18n(errorCode, cause, locale, *args)
    }

    /**
     * 用于替换错误信息中存在 {} 占位符情况下,请注意需要匹配位置和数量
     * @param errorCode 錯誤碼對象
     * @param args 參數
     * @return 格式化後的字符串
     */
    fun getFormatMessage(errorCode: ErrorCode, vararg args: Any?): String {
        val formattingTuple = MessageFormatter.arrayFormat(errorCode.enMessage, args)
        return formattingTuple.message
    }

    /**
     * 獲取一個異常信息的詳細堆棧
     * @param exception 異常對象
     * @return 堆棧信息
     */
    fun getStackTrace(exception: Throwable): String {
        val outputStream = ByteArrayOutputStream()
        exception.printStackTrace(PrintStream(outputStream))
        return """
             ${exception.message}
             $outputStream
             """.trimIndent()
    }
}