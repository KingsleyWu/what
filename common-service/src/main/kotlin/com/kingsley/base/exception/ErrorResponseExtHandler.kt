package com.kingsley.base.exception

/**
 * 實現該方法並裝載到spring上下文中. 可以在發生業務錯誤時對響應結果的擴展信息進行賦值
 */
interface ErrorResponseExtHandler {
    fun apply(ext: Map<String, Any?>?): MutableMap<String, Any?>?
}