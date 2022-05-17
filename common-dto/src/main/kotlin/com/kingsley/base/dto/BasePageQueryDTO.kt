package com.kingsley.base.dto

import com.baomidou.mybatisplus.extension.plugins.pagination.Page
import io.swagger.annotations.ApiModel
import io.swagger.annotations.ApiModelProperty
import org.apache.commons.lang3.StringUtils
import java.io.Serializable

/**
 * 基礎分頁查詢參數,請使用 getSafePage / getSafeSize 獲取頁碼和每頁記錄數
 * @author kyler
 */
@ApiModel("分頁參數")
class BasePageQueryDTO : Serializable {

    @ApiModelProperty("頁碼,1開始")
    var page: String? = null

    @ApiModelProperty("每頁記錄數,默認20")
    var size: String? = null

    @ApiModelProperty(hidden = true)
    private fun getSafeInteger(v: String?, defaultValue: Long): Long {
        return if (StringUtils.isBlank(v) || !StringUtils.isNumeric(v)) {
            defaultValue
        } else v!!.toLong()
    }

    /**
     * 返回頁碼, 最小為1.非法值都會轉為1
     * @return
     */
    @ApiModelProperty(hidden = true)
    fun getSafePage(): Long {
        val safeInteger = getSafeInteger(page, 1L)
        return 1L.coerceAtLeast(safeInteger)
    }

    /**
     * 返回每頁大小, 默認20, 受MAX_SAFE_SIZE_LIMIT 最大值影響
     * @return
     */
    @ApiModelProperty(hidden = true)
    fun getSafeSize(): Long {
        val safeInteger = getSafeInteger(size, 20L)
        return MAX_SAFE_SIZE_LIMIT.coerceAtMost(safeInteger)
    }

    @ApiModelProperty(hidden = true)
    fun getSafeSizeUnLimit() = getSafeInteger(size, 20L)

    @ApiModelProperty(hidden = true)
    fun getOffset() = (getSafePage() - 1) * getSafeSize()

    /**
     * 返回用於查詢的 Page 對象
     * @param <T>
     * @return </T>
     */
    inline fun <reified T> toPage(): Page<T> {
        return Page(getSafePage(), getSafeSize())
    }

    companion object {
        private const val serialVersionUID = 1L
        const val MAX_SAFE_SIZE_LIMIT = 500L
    }
}