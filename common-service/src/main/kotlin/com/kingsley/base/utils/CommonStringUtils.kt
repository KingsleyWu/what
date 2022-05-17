package com.kingsley.base.utils

import org.apache.commons.lang3.builder.ToStringBuilder
import org.apache.commons.text.StringSubstitutor
import java.util.function.Function

object CommonStringUtils {
    fun toString(obj: Any?): String? {
        if (obj == null) {
            return null
        }
        return if (obj is CharSequence) {
            obj.javaClass.name + "[value=[" + obj + "]]"
        } else {
            ToStringBuilder.reflectionToString(obj)
        }
    }
    /**
     * 使用指定的字符替換器 替換指定字符串
     *
     * @param str     原字符串
     * @param itemFun 替換函數,參數為字符串中的變量名
     * @return 替換後的字符串
     */
    /**
     * 使用環境變量替換指定字符串
     *
     * @param str 源字符串
     * @return 使用環境變量替換內部變量後的字符串
     */
    @JvmOverloads
    fun replaceValue(
        str: String?,
        itemFun: Function<String?, String?> = Function { SpringContextUtils.getEnvironment() },
        prefix: String? = "\${",
        suffix: String? = "}",
        escapeChar: Char = '\\'
    ): String {
        val sub = StringSubstitutor()
        sub.setVariablePrefix(prefix)
        sub.setVariableSuffix(suffix)
        sub.setVariableResolver { t: String? -> itemFun.apply(t) }
        sub.escapeChar = escapeChar
        return sub.replace(str)
    }

    @JvmOverloads
    fun replaceValue(
        str: String?,
        values: Map<String, Any?>,
        prefix: String?,
        suffix: String?,
        escapeChar: Char = '\\'
    ): String {
        return replaceValue(str, { s: String? ->
            val o = values[s]
            o?.toString() ?: ""
        }, prefix, suffix, escapeChar)
    }
}