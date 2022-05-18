package com.kingsley.base.utils

import com.kingsley.base.config.I18nConfiguration
import org.apache.commons.collections4.CollectionUtils
import org.apache.commons.collections4.MapUtils
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.context.NoSuchMessageException
import org.springframework.context.i18n.LocaleContextHolder
import org.springframework.web.servlet.LocaleResolver
import java.util.*
import java.util.function.Function

/**
 * @author kyler
 */
object I18nUtils {
    private val log = LoggerFactory.getLogger(I18nUtils::class.java)
    const val ZH = "zh"
    const val ZH_HK = "zh_hk"
    const val ZH_CN = "zh_cn"
    const val ZH_TW = "zh_tw"
    const val ZH_MO = "zh_mo"
    const val ZH_HANT = "zh_hant"

    //繁體中文列表，認定為繁體中文的語言列表，列表之外的zh開頭的多語言都認定為簡體中文
    @JvmField
    val TRADITIONAL_CHINESE_LOCALES = listOf(ZH, ZH_HK, ZH_TW, ZH_MO, ZH_HANT)

    const val MESSAGE_VAR_PREFIX = "{"
    const val MESSAGE_VAR_SUFFIX = "}"

    @JvmStatic
    val currentLocaleCode: Locale
        get() = LocaleContextHolder.getLocale()

    @JvmStatic
    fun setCurrentLocale(locale: String) {
        val localeResolver = SpringContextUtils.getBean(LocaleResolver::class.java).orElseThrow()
        //沒有對locale做修改. 是否修改為特定語言應該交由調用人處理.
        localeResolver.setLocale(
            Objects.requireNonNull(SpringContextUtils.request)!!,
            SpringContextUtils.response,
            getLocaleByCode(locale)
        )
    }

    @JvmStatic
    fun getLocaleByCode(code: String): Locale {
        val split = code.replace('-', '_').split("_".toRegex(), limit = 2).toTypedArray()
        val language = split[0]
        val country = if (split.size > 1) split[1].uppercase(Locale.getDefault()) else ""
        return Locale(language, country)
    }

    /**
     * 這個方法輸出經過標準化處理並轉換為小寫的字符串
     * @return 經過處理並轉換為小寫的字符串
     */
    @JvmStatic
    val currentLocaleCodeInApp: String
        get() = getLocaleCodeInApp(currentLocaleCode.toString())

    /**
     * 這個方法輸出經過標準化處理並轉換為小寫的字符串
     * @return 經過處理並轉換為小寫的字符串
     */
    @JvmStatic
    fun getLocaleCodeInApp(locale: String): String {
        var localeTemp = locale
        val bean = SpringContextUtils.getBean(I18nConfiguration.I18nsLocaleCustomer::class.java)
        if (bean.isPresent) {
            localeTemp = bean.get().customer(locale)
        }
        return localeTemp.lowercase()
    }

    @JvmStatic
    fun getCurrentMessage(i18nKey: String, vararg args: Any?): String? {
        try {
            return SpringContextUtils.applicationContext?.getMessage(i18nKey, args, currentLocaleCode)
        } catch (ex: NoSuchMessageException) {
            log.error("沒有找到對應的多語言信息:key={},錯誤信息:{}", i18nKey, ex.message, ex)
        }
        return i18nKey
    }

    /**
     * 使用變量名的形式替換多語言變量, 變量用 `{`, `}` 包裹
     * @param i18nKey 多語言key
     * @param values 用於替換內部變量的map
     * @return 替換後的字符串
     */
    @JvmStatic
    fun getCurrentMessage(i18nKey: String, values: Map<String, Any?>?): String? {
        return getMessage(currentLocaleCode, i18nKey, values, MESSAGE_VAR_PREFIX, MESSAGE_VAR_SUFFIX)
    }

    /**
     * 使用變量名的形式替換多語言變量, 變量用自定義前後綴
     * @param locale 語言
     * @param i18nKey 多語言key
     * @param values 用於替換內部變量的map
     * @param prefix 變量前修飾符
     * @param suffix 變量後修飾符
     * @return 替換後的字符串
     */
    @JvmStatic
    fun getMessage(locale: Locale, i18nKey: String, values: Map<String, Any?>?, prefix: String?, suffix: String?): String? {
        try {
            //對多語言進行一次標準化處理
            val localeCodeInApp = getLocaleCodeInApp(locale.toString())
            val message: String = SpringContextUtils.applicationContext.getMessage(i18nKey, null, getLocaleByCode(localeCodeInApp))
            return if (MapUtils.isNotEmpty(values)) {
                CommonStringUtils.replaceValue(message, values!!, prefix, suffix)
            } else message
        } catch (ex: NoSuchMessageException) {
            log.error("在指定語言({})中沒有找到對應的多語言信息:key={},錯誤信息:{}", locale, i18nKey, ex.message, ex)
        }
        return i18nKey
    }

    /**
     * 使用變量名的形式替換多語言變量, 變量用 `{`, `}` 包裹
     * @param locale 語言
     * @param i18nKey 多語言key
     * @param values 用於替換內部變量的map
     * @return 替換後的字符串
     */
    @JvmStatic
    fun getMessage(locale: Locale, i18nKey: String, values: Map<String?, Any?>?): String? {
        return getMessage(locale, i18nKey, values, MESSAGE_VAR_PREFIX, MESSAGE_VAR_SUFFIX)
    }

    /**
     * 使用變量名的形式替換多語言變量
     * @param locale 語言
     * @param i18nKey 多語言key
     * @param values 用於替換內部變量的map
     * @return 替換後的字符串
     */
    @JvmStatic
    fun getMessage(locale: String, i18nKey: String, values: Map<String?, Any?>?): String? {
        return getMessage(getLocaleByCode(locale), i18nKey, values, MESSAGE_VAR_PREFIX, MESSAGE_VAR_SUFFIX)
    }

    @JvmStatic
    fun getMessage(locale: String, i18nKey: String, vararg args: Any?): String? {
        return getMessage(getLocaleByCode(locale), i18nKey, *args)
    }

    @JvmStatic
    fun getMessage(locale: Locale, i18nKey: String, vararg args: Any?): String? {
        try {
            return SpringContextUtils.applicationContext?.getMessage(i18nKey, args, locale)
        } catch (ex: NoSuchMessageException) {
            log.error("在指定語言({})中沒有找到對應的多語言信息:key={},錯誤信息:{}", locale, i18nKey, ex.message, ex)
        }
        return i18nKey
    }

    @JvmStatic
    fun <T, R> fuzzyFieldMatchLangByLocale(i18nList: List<T>, locale: String, getLocale: Function<T, String?>, getFiled: Function<T, R>): R? {
        val i18n = fuzzyMatchLangByLocale(i18nList, locale, { a: T -> "en".equals(getLocale.apply(a), ignoreCase = true) }, getLocale) { a: T ->
            val field: R? = getFiled.apply(a)
            field != null && StringUtils.isNotBlank(field.toString())
        }
        return if (i18n == null) null else getFiled.apply(i18n)
    }

    /**
     * 根據多語言的模糊匹配規則獲取某個字段的有效內容
     * @param i18nList 多語言對象列表
     * @param locale 當前語言，此處要求傳入的是包含國家的全小寫完整多語言碼，例如en_us
     * @param checkIsDefault 檢查是否默認語言的方法
     * @param getLocale 獲取多語言對象所屬語言的方法
     * @param getFiled 獲取字段的方法
     * @param <T> 多語言對象類型
     * @param <R> 字段類型
     * @return 滿足條件的字段多語言內容
     */
    @JvmStatic
    fun <T, R> fuzzyFieldMatchLangByLocale(i18nList: List<T>, locale: String, checkIsDefault: Function<T, Boolean>, getLocale: Function<T, String?>, getFiled: Function<T, R>): R? {
        val i18n = fuzzyMatchLangByLocale(i18nList, locale, checkIsDefault, getLocale) { a: T ->
            val field: R? = getFiled.apply(a)
            field != null && StringUtils.isNotBlank(field.toString())
        }
        return if (i18n == null) null else getFiled.apply(i18n)
    }

    @JvmStatic
    fun <T> fuzzyMatchLangByLocale(i18nList: List<T>, locale: String, getLocale: Function<T, String?>): T? {
        //不包含額外條件
        return fuzzyMatchLangByLocale(i18nList, locale, { a: T -> "en".equals(getLocale.apply(a), ignoreCase = true) }, getLocale) { true }
    }

    @JvmStatic
    fun <T> fuzzyMatchLangByLocale(i18nList: List<T>, locale: String, checkIsDefault: Function<T, Boolean>, getLocale: Function<T, String?>): T? {
        //不包含額外條件
        return fuzzyMatchLangByLocale(i18nList, locale, checkIsDefault, getLocale) { true }
    }

    /**
     * 根据优先级获模糊匹配多语言locale的前兩位，當前語言(精確匹配) > 當前語言(前兩位匹配) > 默認語言，中文有特殊處理
     * @param i18nList 多語言對象列表
     * @param locale 當前語言，此處要求傳入的是包含國家的全小寫完整多語言碼，例如en_us
     * @param checkIsDefault 檢查是否默認語言的方法
     * @param getLocale 獲取多語言對象所屬語言的方法
     * @param extraCondition 判斷多語言是否符合要求的額外條件
     * @param <T> 多語言對象類型
     * @return 最終匹配當前語言的多語言對象
    </T> */
    @JvmStatic
    fun <T> fuzzyMatchLangByLocale(
        i18nList: List<T>,
        locale: String,
        checkIsDefault: Function<T, Boolean>,
        getLocale: Function<T, String?>,
        extraCondition: Function<T, Boolean>
    ): T? {
        val localeTemp = StringUtils.replace(StringUtils.lowerCase(locale), "-", "_")
        //默認語言
        var defaultI18n: T? = null
        //簡體中文列表
        val simpleChinese: MutableList<T?> = ArrayList()
        //繁體中文列表
        val traditionalChinese: MutableList<T?> = ArrayList()
        //語言碼前兩位匹配的多語言
        var fuzzyMatchI18n: T? = null
        for (i18n in i18nList) {
            var curLocale: String = getLocale.apply(i18n) ?: continue

            curLocale = StringUtils.replace(StringUtils.lowerCase(curLocale), "-", "_")

            //如果完全匹配，則直接返回
            if (curLocale == localeTemp && extraCondition.apply(i18n)) {
                return i18n
            }

            //前兩位匹配
            if (StringUtils.substring(curLocale, 0, 2) == StringUtils.substring(localeTemp, 0, 2)
                && extraCondition.apply(i18n)
            ) {
                fuzzyMatchI18n = i18n
            }

            //填充默認語言
            if (checkIsDefault.apply(i18n)) {
                defaultI18n = i18n
            }

            //中文特殊處理
            if (StringUtils.startsWith(curLocale, ZH) && extraCondition.apply(i18n)) {
                if (TRADITIONAL_CHINESE_LOCALES.contains(curLocale)) {
                    traditionalChinese.add(i18n)
                } else {
                    simpleChinese.add(i18n)
                }
            }
        }

        //中文特殊處理
        if (StringUtils.startsWith(localeTemp, ZH)) {
            if (TRADITIONAL_CHINESE_LOCALES.contains(localeTemp)) {
                //如果是繁體中文
                if (CollectionUtils.isNotEmpty(traditionalChinese)) {
                    return traditionalChinese[0]
                }
            } else {
                //如果是簡體中文
                if (CollectionUtils.isNotEmpty(simpleChinese)) {
                    return simpleChinese[0]
                }
            }
        } else {
            //如果有前兩位匹配
            if (fuzzyMatchI18n != null) {
                return fuzzyMatchI18n
            }
        }

        //否則統一返回默認語言
        return defaultI18n
    }

    /**
     * 將指定語言轉成模糊语言
     * @param locale 當前語言
     */
    @JvmStatic
    fun parseToFuzzyLocale(locale: String?): String? {
        var localeTemp: String? = locale ?: return null
        localeTemp = StringUtils.lowerCase(localeTemp)
        val prefix = localeTemp.substring(0, localeTemp.length.coerceAtMost(2))
        return if (ZH == prefix) {
            if (TRADITIONAL_CHINESE_LOCALES.contains(localeTemp)) ZH_HK else ZH_CN
        } else prefix
    }
}