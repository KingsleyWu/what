package com.kingsley.base.utils

import cn.hutool.core.util.ArrayUtil
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.beans.BeansException
import org.springframework.beans.factory.NoUniqueBeanDefinitionException
import org.springframework.context.ApplicationContext
import org.springframework.context.ApplicationContextAware
import org.springframework.core.env.Environment
import org.springframework.lang.NonNull
import org.springframework.web.context.request.RequestContextHolder
import org.springframework.web.context.request.ServletRequestAttributes
import java.util.*
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

class SpringContextUtils : ApplicationContextAware {

    @Throws(BeansException::class)
    override fun setApplicationContext(@NonNull applicationContext: ApplicationContext) {
        Companion.applicationContext = applicationContext
    }

    companion object {
        private val log = LoggerFactory.getLogger(SpringContextUtils::class.java)
        private var isProd: Boolean? = null

        lateinit var applicationContext: ApplicationContext
            private set

        /**
         * 禁止使用在controller 和 Exception 層之外, 特別是 service層
         * @return 當前請求,如果使用在其他場景下可能為 null
         */
        @JvmStatic
        val request: HttpServletRequest?
            get() {
                val requestAttributes =
                    RequestContextHolder.getRequestAttributes() as ServletRequestAttributes? ?: return null
                return requestAttributes.request
            }

        /**
         * 禁止使用在controller 和 Exception 層之外, 特別是 service層
         * @return 當前請求,如果使用在其他場景下可能為 null
         */
        @JvmStatic
        val response: HttpServletResponse?
            get() {
                val requestAttributes =
                    RequestContextHolder.getRequestAttributes() as ServletRequestAttributes? ?: return null
                return requestAttributes.response
            }

        @JvmStatic
        fun <T> getBeansByType(tClass: Class<T>?): List<T> {
            return if (applicationContext == null || tClass == null) {
                ArrayList()
            } else try {
                val beansOfType = applicationContext!!.getBeansOfType(tClass)
                ArrayList(beansOfType.values)
            } catch (ex: Exception) {
                log.error("獲取類型[{}]的實例發生錯誤", tClass.name, ex)
                ArrayList()
            }
        }

        @JvmStatic
        fun <T : Any> getBean(tClass: Class<T>?, name: String?): Optional<T> {
            return if (applicationContext == null || tClass == null) {
                Optional.empty()
            } else try {
                if (StringUtils.isNotBlank(name)) {
                    Optional.of(applicationContext!!.getBean(name!!, tClass))
                } else Optional.of(applicationContext!!.getBean(tClass))
            } catch (ex: NoUniqueBeanDefinitionException) {
                val beansOfType = applicationContext!!.getBeansOfType(tClass)
                log.warn("發現多個[{}]的實例,將隨機返回一個.這可能造成邏輯不穩定:{}", tClass.name, beansOfType.keys)
                val t = beansOfType[beansOfType.keys.iterator().next()]
                if (t == null) {
                    Optional.empty()
                } else {
                    Optional.of(t)
                }
            } catch (ex: Exception) {
                log.error("獲取類型[{}]的實例發生錯誤", tClass.name, ex)
                Optional.empty()
            }
        }

        /**
         * 根據類型獲取單個實例.
         * @param tClass 類型
         * @param <T> 實例類型
         * @return 實例,如果查詢到多個實例,則隨機返回一個, 沒有查找到返回 Optional.empty()
        </T> */
        @JvmStatic
        fun <T : Any> getBean(tClass: Class<T>?): Optional<T> {
            return getBean(tClass, null)
        }

        /**获得配置的值 */
        @JvmStatic
        fun getEnvironment(key: String? = null): String? {
            return applicationContext!!.environment.getProperty(key!!)
        }

        @JvmStatic
        val isNotProd: Boolean
            get() = !isProd()

        /**
         * 判断当前环境是否是生产环境
         * @return true:是, false:否
         */
        @JvmStatic
        fun isProd(): Boolean {
            return isProd(null)
        }

        @JvmStatic
        fun isProd(env: Environment?): Boolean {
            var environment = env
            if (isProd != null) {
                return isProd!!
            }
            if (environment == null) {
                environment = applicationContext!!.environment
            }
            val activeProfiles = environment.activeProfiles
            if (ArrayUtil.isEmpty(activeProfiles)) {
                //如果什么都没配置,出于安全考虑认为是生产模式.
                isProd = true
                return isProd!!
            }
            for (activeProfile in activeProfiles) {
                //任意一个激活的环境是 prod 开始的,则认为是生产环境
                if (activeProfile != null && activeProfile.lowercase(Locale.getDefault()).startsWith("prod")) {
                    isProd = true
                    return isProd!!
                }
            }
            isProd = false
            return isProd!!
        }

        /**
         * 获取第一个激活的环境, 完整环境列表获取方式为: SpringContextUtils.getApplicationContext().getEnvironment().getActiveProfiles()
         * @return 環境名稱
         */
        @JvmStatic
        val firstProfiles: String
            get() = getFirstProfiles(applicationContext!!.environment)

        @JvmStatic
        fun getFirstProfiles(environment: Environment): String {
            val activeProfiles = environment.activeProfiles
            return if (ArrayUtil.isEmpty(activeProfiles)) {
                //如果什么都没配置,出于安全考虑认为是生产模式.
                ""
            } else activeProfiles[0]
        }
    }
}