package com.kingsley.base.dto

import io.swagger.annotations.ApiModelProperty

/**
 * @author kyler
 */
data class PageInfo(
    @field:ApiModelProperty("頁碼,1開始")
    var page: Long? = null,
    @field:ApiModelProperty("每頁記錄數")
    var size: Long? = null,
    @field:ApiModelProperty("總記錄數,性能考慮,可能部分查詢可能不會返回這個值")
    var total: Long? = null,
    @ApiModelProperty("如果支持返回下一頁地址,這裡返回")
    var next: String? = null
) : BaseDTO()