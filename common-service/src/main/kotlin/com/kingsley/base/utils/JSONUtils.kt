package com.kingsley.base.utils

import com.fasterxml.jackson.core.JsonProcessingException
import com.fasterxml.jackson.databind.JsonNode
import com.fasterxml.jackson.databind.ObjectMapper
import com.jayway.jsonpath.JsonPath
import com.jayway.jsonpath.PathNotFoundException
import com.kingsley.base.exception.CommErrorCode
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder
import java.util.function.Consumer

object JSONUtils {
    private val log = LoggerFactory.getLogger(JSONUtils::class.java)

    @JvmStatic
    fun toJsonString(obj: Any?): String {
        val om: ObjectMapper = SpringContextUtils.applicationContext.getBean(ObjectMapper::class.java)
        return try {
            om.writeValueAsString(obj)
        } catch (e: JsonProcessingException) {
            log.error(e.message, e)
            throw CommErrorCode.E0000000500.exception()
        }
    }

    @JvmStatic
    fun parse(str: String?): JsonNode {
        val om: ObjectMapper = SpringContextUtils.applicationContext.getBean(ObjectMapper::class.java)
        return try {
            om.readTree(str)
        } catch (e: JsonProcessingException) {
            log.error(e.message, e)
            throw CommErrorCode.E0000000500.exception()
        }
    }

    /**
     * 如果序列化之前需要對ObjectMapper 做自定義修改.傳入 consumer方法.
     * @param node 對象
     * @param config 自定義配置
     * @param clazz 目標類
     * @param parameters 泛型數組
     * @param <T> 泛型
     * @return 結果對象
     */
    @JvmStatic
    fun <T> parseToBeanCustomer(node: JsonNode, config: Consumer<ObjectMapper?>?, clazz: Class<T>?, vararg parameters: Class<*>?): T {
        return parseToBeanCustomer(node.toString(), config, clazz, *parameters)
    }

    /**
     * 使用可以自定義的ObjectMapper進行格式化
     * @param obj 原對象
     * @param config 對ObjectMapper 的配置方法
     * @return json string
     */
    @JvmStatic
    fun toJsonStringCustomer(obj: Any?, config: Consumer<ObjectMapper?>?): String {
        val omBuild: Jackson2ObjectMapperBuilder = SpringContextUtils.applicationContext.getBean(
            Jackson2ObjectMapperBuilder::class.java
        )
        val om: ObjectMapper = omBuild.build<ObjectMapper>()
        config?.accept(om)
        return try {
            om.writeValueAsString(obj)
        } catch (e: JsonProcessingException) {
            log.error(e.message, e)
            throw CommErrorCode.E0000000500.exception()
        }
    }

    /**
     * 如果序列化之前需要對ObjectMapper 做自定義修改.傳入 consumer方法.
     * @param str 字符串
     * @param config 自定義配置
     * @param clazz 類
     * @param parameters 泛型數組
     * @param <T> 泛型
     * @return 目標對象
     */
    @JvmStatic
    fun <T> parseToBeanCustomer(str: String?, config: Consumer<ObjectMapper?>?, clazz: Class<T>?, vararg parameters: Class<*>?): T {
        val omBuild = SpringContextUtils.applicationContext.getBean(Jackson2ObjectMapperBuilder::class.java)
        val om: ObjectMapper = omBuild.build<ObjectMapper>()
        config?.accept(om)
        return try {
            if (parameters.isNotEmpty()) {
                val type = om.typeFactory.constructParametricType(clazz, *parameters)
                om.readValue(str, type)
            } else {
                om.readValue(str, clazz)
            }
        } catch (e: JsonProcessingException) {
            log.error(e.message, e)
            throw CommErrorCode.E0000000500.exception()
        }
    }

    @JvmStatic
    fun <T> parseToBean(node: JsonNode, clazz: Class<T>?, vararg parameters: Class<*>?): T {
        return parseToBean(node.toString(), clazz, *parameters)
    }

    @JvmStatic
    fun <T> parseToBean(str: String?, clazz: Class<T>?, vararg parameters: Class<*>?): T {
        val om: ObjectMapper = SpringContextUtils.applicationContext.getBean(ObjectMapper::class.java)
        return try {
            if (parameters.isNotEmpty()) {
                val type = om.typeFactory.constructParametricType(clazz, *parameters)
                om.readValue(str, type)
            } else {
                om.readValue(str, clazz)
            }
        } catch (e: JsonProcessingException) {
            log.error(e.message, e)
            throw CommErrorCode.E0000000500.exception()
        }
    }

    @JvmStatic
    fun <T> parseToList(str: String?, clazz: Class<T>?): List<T> {
        val om: ObjectMapper = SpringContextUtils.applicationContext.getBean(ObjectMapper::class.java)
        return try {
            val type = om.typeFactory.constructCollectionType(
                ArrayList::class.java, clazz
            )
            om.readValue(str, type)
        } catch (e: JsonProcessingException) {
            log.error(e.message, e)
            throw CommErrorCode.E0000000500.exception()
        }
    }

    @JvmStatic
    fun <T> parseToList(node: JsonNode, clazz: Class<T>?): List<T> {
        return parseToList(node.toString(), clazz)
    }

    @JvmStatic
    fun <T> jsonPath(node: JsonNode, path: String?): T? {
        return jsonPath<T?>(node.toString(), path, null)
    }

    @JvmStatic
    fun <T> jsonPath(node: JsonNode, path: String?, defaultValue: T): T? {
        return jsonPath<T>(node.toString(), path, defaultValue)
    }

    @JvmStatic
    fun <T> jsonPath(json: String?, path: String?): T? {
        return jsonPath<T?>(json, path, null)
    }

    @JvmStatic
    fun <T> jsonPath(json: String?, path: String?, defaultValue: T?): T? {
        try {
            return if (defaultValue != null) {
                JsonPath.parse(json).read(path, defaultValue.javaClass) as T
            } else JsonPath.parse(json).read(path)
        } catch (e: PathNotFoundException) {
            log.debug(e.message)
        } catch (e: Exception) {
            log.error(e.message, e)
        }
        return defaultValue
    }

    @JvmStatic
    fun <T> jsonPath(json: String?, path: String?, clazz: Class<T>, defaultValue: T): T {
        try {
            return JsonPath.parse(json).read(path, clazz)
        } catch (e: PathNotFoundException) {
            log.debug(e.message)
        } catch (e: Exception) {
            log.error(e.message, e)
        }
        return defaultValue
    }

    /**
     * 判斷一段json是否為數組
     * @param json 要判斷的json字符串
     */
    @JvmStatic
    fun checkList(json: String): Boolean {
        var jsonTemp = json
        if (StringUtils.isBlank(jsonTemp)) {
            return false
        }
        jsonTemp = jsonTemp.trim { it <= ' ' }
        return jsonTemp[0] == '[' && jsonTemp[jsonTemp.length - 1] == ']'
    }
}