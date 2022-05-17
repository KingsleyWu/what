package com.kingsley.base.exception.scan
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.support.BeanDefinitionRegistry
import org.springframework.context.EnvironmentAware
import org.springframework.context.ResourceLoaderAware
import org.springframework.context.annotation.ImportBeanDefinitionRegistrar
import org.springframework.core.env.Environment
import org.springframework.core.io.ResourceLoader
import org.springframework.core.type.AnnotationMetadata

class ErrorCodeBeanRegistrar : ImportBeanDefinitionRegistrar, ResourceLoaderAware, EnvironmentAware {
    private val log = LoggerFactory.getLogger(ErrorCodeBeanRegistrar::class.java)

    private var resourceLoader: ResourceLoader? = null
    private var environment: Environment? = null
    override fun setResourceLoader(resourceLoader: ResourceLoader) {
        this.resourceLoader = resourceLoader
    }

    override fun registerBeanDefinitions(importingClassMetadata: AnnotationMetadata, registry: BeanDefinitionRegistry) {
        val property = environment?.getProperty("knife4j.basePackage")
        if (StringUtils.isNotBlank(property)) {
            val scanner = ErrorCodeScanner(registry, true)
            log.debug("開始掃描ErrorCode")
            scanner.doScan(*property!!.split(",".toRegex()).dropLastWhile { it.isEmpty() }.toTypedArray())
        }
    }

    override fun setEnvironment(environment: Environment) {
        this.environment = environment
    }

}