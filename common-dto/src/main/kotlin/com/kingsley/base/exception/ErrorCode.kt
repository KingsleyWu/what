package com.kingsley.base.exception

/**
 * 继承这个类进行错误码管理, 错误码由 此格式组成 "EMMMMXXXXXX", 其中 E 是固定的字母前缀, MMMM 4位数字表示模块.不同模块间应该不同.
 * 最后的 XXXXXXX 表示6位具体的错误码. 错误码在项目中应该保持唯一性. 所以建议同MMMM 的错误码都放在一个文件里.方便核对和管理.
 * <br></br>
 * 可選增加 enMessage 用於返回英文版本的錯誤碼
 *
 * <br></br><br></br>
 * 多語言和參數支持請使用 ExceptionUtils 的響應方法.
 *
 */
interface ErrorCode {
    /**
     * 返回错误码中数字部分,直接截取第一位后转为数字. 请注意错误码格式.避免异常
     * @return 錯誤碼
     */
    val code: Int
        get() = this.toString().substring(1).toInt()

    /**
     * 所有继承的对象都应该有 message属性, 注意默認信息是英文信息
     * @return 中文message
     */
    val message: String?

    /**
     * 返回 英文版本的消息, 這是系統處理中的默認信息
     * @return 英文message
     */
    val enMessage: String
        get() = message ?: ""

    fun exception(): BusinessException {
        return BusinessException(enMessage, this.code)
    }

    /**
     * 重写错误消息.沿用这个错误码
     * @param customerMsg 自定义的错误消息
     * @return 異常對象
     */
    fun exception(customerMsg: String?): BusinessException {
        return BusinessException(customerMsg, this.code)
    }

    fun exception(cause: Throwable?): BusinessException {
        return BusinessException(enMessage, this.code, cause)
    }

}