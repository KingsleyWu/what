package com.kingsley.base.service

import springfox.documentation.builders.RequestParameterBuilder
import springfox.documentation.service.ParameterType
import springfox.documentation.service.RequestParameter

/**
 * 本類用於自定義swagger的全局請求參數
 */
interface GlobalRequestParameterCustomer {
    /**
     * 實現此方法用於自定義頭部信息,注意會覆蓋默認除權限認證頭之外的所有公共參數
     * @return 將要啟用的公共參數列表, 請參考使用本類中的 buildXXXXParameter系列的方法生成.
     */
    fun globalRequestParameters(): List<RequestParameter>

    /**
     * 構造一個公共頭信息
     * @param name 頭名稱
     * @param description 描述信息
     * @param required 是否必填
     * @return 參數信息
     */
    fun buildGlobalHeaderParameter(name: String?, description: String?, required: Boolean): RequestParameter? {
        return buildGlobalParameter(name, description, ParameterType.HEADER, required)
    }

    /**
     * 構造一個url請求參數
     * @param name 參數名稱
     * @param description 描述信息
     * @param required 是否必填
     * @return 參數信息
     */
    fun buildGlobalQueryParameter(name: String?, description: String?, required: Boolean): RequestParameter? {
        return buildGlobalParameter(name, description, ParameterType.QUERY, required)
    }

    /**
     * 構造一個 地址(url) 參數
     * @param name 參數名稱
     * @param description 描述信息
     * @param required 是否必填
     * @return 參數信息
     */
    fun buildGlobalPathParameter(name: String?, description: String?, required: Boolean): RequestParameter? {
        return buildGlobalParameter(name, description, ParameterType.PATH, required)
    }

    /**
     * 構造一個全局請求參數,請優先調用其他方法
     * @param name 參數名稱
     * @param description 描述信息
     * @param in 參數所在的位置
     * @param required 是否必填
     * @return 參數信息
     */
    fun buildGlobalParameter(name: String?, description: String?, `in`: ParameterType?, required: Boolean): RequestParameter? {
        val parameterBuilder = RequestParameterBuilder()
        parameterBuilder.name(name)
            .description(description)
            .`in`(`in`)
            .required(required)
        return parameterBuilder.build()
    }
}