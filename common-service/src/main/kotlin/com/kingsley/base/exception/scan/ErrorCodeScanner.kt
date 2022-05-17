package com.kingsley.base.exception.scan

import com.google.common.collect.ImmutableMap
import com.kingsley.base.exception.ErrorCode
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.config.BeanDefinitionHolder
import org.springframework.beans.factory.support.BeanDefinitionRegistry
import org.springframework.context.annotation.ClassPathBeanDefinitionScanner
import org.springframework.core.type.filter.AssignableTypeFilter
import org.springframework.lang.NonNull

class ErrorCodeScanner(registry: BeanDefinitionRegistry, useDefaultFilters: Boolean) :
    ClassPathBeanDefinitionScanner(registry, useDefaultFilters) {
    private val log = LoggerFactory.getLogger(ErrorCodeScanner::class.java)

    @NonNull
    public override fun doScan(vararg basePackages: String): Set<BeanDefinitionHolder> {
        val includeFilter = AssignableTypeFilter(ErrorCode::class.java)
        addIncludeFilter(includeFilter)
        val total: MutableMap<Int, ErrorCode> = HashMap()
        val beanDefinitions: Set<BeanDefinitionHolder> = LinkedHashSet()
        val prefixCheck: MutableMap<String, Class<*>> = HashMap()
        for (basePackage in basePackages) {
            val candidates = findCandidateComponents(basePackage)
            for (candidate in candidates) {
                val prefixes: MutableSet<String> = HashSet()
                val beanClassName = candidate.beanClassName
                val aClass = this.javaClass.classLoader.loadClass(beanClassName)
                if (!ErrorCode::class.java.isAssignableFrom(aClass)) {
                    //跳過非繼承自ErrorCode的類.
                    continue
                }
                log.info("查找到ErrorCode : {}", beanClassName)
                try {
                    val values = aClass.getMethod("values")

                    @Suppress("UNCHECKED_CAST")
                    val invoke = values.invoke(null) as Array<ErrorCode>
                    for (o in invoke) {
                        val key = o.code
                        //檢查錯誤碼前6位是否被跨文件相同
                        prefixes.add(StringUtils.leftPad(key.toString(), 10, "0").substring(0, 6))
                        log.info("查找到錯誤碼: {}:{}", key, o.message)
                        if (total.containsKey(key)) {
                            val old = total[key]
                            log.error("發現重複的ErrorCode:[{}] 在 {} 和 {}", key, old!!.javaClass.name, o.javaClass.name)
                        } else {
                            total[key] = o
                        }
                    }
                } catch (nse: NoSuchMethodException) {
                    log.warn("錯誤碼類[{}] 沒有找到 values 方法,跳過處理", beanClassName)
                }
                if (prefixes.size > 0) {
                    //檢查錯誤碼前6位是否被跨文件相同
                    for (prefix in prefixes) {
                        if (prefixCheck.containsKey(prefix)) {
                            log.warn(
                                "發現錯誤碼前綴跨文件相同[E{}] 在 {} 和 {};",
                                prefix,
                                aClass.name,
                                prefixCheck[prefix]!!.name
                            )
                        } else {
                            prefixCheck[prefix] = aClass
                        }
                    }
                }
            }
        }
        totalErrorCode = ImmutableMap.copyOf(total)

        //這裡只是需要收集錯誤碼類,並不需要被spring管理
        return beanDefinitions
    }

    companion object {
        var totalErrorCode: ImmutableMap<Int, ErrorCode>? = null
            private set
    }
}