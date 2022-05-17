package com.kingsley.base.exception

import io.swagger.annotations.ApiOperation

/**
 * 通用错误, 适用于所有的请求, 范围码为 E0000000000 ~ E0000XXXXXX
 */
@ApiOperation("通用錯誤碼")
enum class CommErrorCode(
    override val message: String?,
    override val enMessage: String? = null
) : ErrorCode {
    E0000000400("錯誤的請求", "Bad Request"),
    E0000000401("未授權,請先登錄", "Unauthorized, Please log in"),
    E0000000403("無權訪問", "ACCESS DENIED"),
    E0000000404("沒有找到", "Not Found"),
    /** 不支持请求方法:<br></br>  Unsupported [{}] Method */
    E0000000405("不支持[{}]方法", "Unsupported [{}] Method"),
    E0000000406("不支持[{}]媒體類型", "Unsupported [{}] MediaType"),

    /** 参数类型错误:<br></br>  Parameter [{}] type is [{}] */
    E0000000490("類型錯誤,參數[{}]類型應該為[{}]", "Parameter [{}] type is [{}]"),

    /** 没有找到方法:<br></br>  [{}] {} Not Found */
    E0000000494("[{}] {} 沒有找到", " [{}] {} Not Found"),
    E0000000500("網絡錯誤;请稍后再试.", "Network error, please try again later"),

    /** redis 服務未就緒.  */
    E0000000501("redis 服務未就緒.", "redis Service not ready"),

    /** redis 服務已關閉.  */
    E0000000502("redis 服務已關閉.", "redis has been shut down"),

    E0000000503("发送通知消息失败", "Failed to send notification message"),
    E0000000600("超出最大上傳大小,最大:{}", "Maximum upload size exceeded,Max = {}"),
    E0000008000("当前 QooApp 需更新", "QooApp need update"),
    E0000008001("Access Token 失效", "Access Token Ineffective"),
    E0000008002("特殊:全局通知,message應指定為通知页面", ""),
    E0000008003("用户名字违规", "User name violation"),
    E0000008004("你已经修改过名字，不能再次修改", "You has already modified name and cannot modify it again"),
    E0000008005("特殊:客户端调用浏览器打开一个网址，网址在message里面", ""),
    E0000008011("訪問的資源不存在", "The accessed resource does not exist"),
    E0000040404("數據不存在", "Data does not exist"),
    E0000040405("對象初始化不完整", "Incomplete object initialization"),
    E0000040406("超出數值允許範圍", "Value out of allowable range"),
    E0000999999("未知錯誤", "Unknown Error");
}