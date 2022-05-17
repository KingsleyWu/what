package com.kingsley.base.utils.message

import com.kingsley.base.config.property.SlackWebHookProperties
import com.kingsley.base.exception.BusinessException
import com.kingsley.base.utils.SpringContextUtils.Companion.firstProfiles
import com.kingsley.base.utils.SpringContextUtils.Companion.getBean
import com.kingsley.base.utils.SpringContextUtils.Companion.getEnvironment
import net.gpedro.integrations.slack.SlackApi
import net.gpedro.integrations.slack.SlackAttachment
import net.gpedro.integrations.slack.SlackException
import net.gpedro.integrations.slack.SlackMessage
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import java.lang.reflect.InvocationTargetException
import java.util.*

object SlackUtils {
    private val log = LoggerFactory.getLogger(SlackUtils::class.java)
    const val FILTER_EXCEPTION_KEY = "fly"

    @JvmStatic
    fun say(message: SlackMessage) {
        val webhook = getEnvironment("config.slack.webhook")
        say(message, webhook)
    }

    @JvmStatic
    fun say(message: SlackMessage, webhook: String?) {
        if (StringUtils.isNotBlank(webhook)) {
            try {
                val api = SlackApi(webhook)
                api.call(message)
            } catch (ex: SlackException) {
                //阻止由於發送消息失敗而導致啟動失敗
                log.warn(ex.message)
            }
        } else {
            log.warn("沒有配置 slack WebHook, 跳過消息發送.\n{}", message.toString())
        }
    }

    /**
     * 发送錯誤消息
     * @param title 标题
     * @param text 内容
     * @param webhook 发送的群组
     */
    @JvmStatic
    fun sayDanger(title: String?, text: String?, webhook: String?) {
        if (StringUtils.isNotBlank(webhook)) {
            val applicationName = getEnvironment("spring.application.name")
            val message = SlackMessage("")
            val attach = SlackAttachment()
            attach.setFallback(text)
            attach.setTimestamp(Date())
            attach.setColor("danger")
            //            attach.setTitle(applicationName + "@" + ApplicationEventConfig.getSecondName() +" - " + title);
            attach.setText(text)
            message.addAttachments(attach)
            say(message, webhook)
        } else {
            log.warn("沒有配置 slack WebHook, 跳過消息發送.\n{}", text)
        }
    }

    /**
     * 发送消息
     * @param title 标题
     * @param e 异常内容
     * @param webhook 发送的群组
     */
    @JvmStatic
    fun say(title: String?, e: Throwable?, webhook: String?) {
        var e = e ?: return
        try {
            if (e is BusinessException) {
                log.debug("BusinessException 異常，無需發送:{}", e.message)
                return
            }
            if ("local".equals(firstProfiles, ignoreCase = true)) {
                log.debug("本地開發環境,跳過異常日誌發送:{}", e.message)
                return
            }
            if (e is InvocationTargetException) {
                e = e.targetException
            }
            var errorMessage = e.message
            if (StringUtils.isBlank(errorMessage)) {
                errorMessage = ""
            }
            val context = StringBuilder(errorMessage)
            context.append("\n\t")

            //為了減少異常輸出數量.對異常進行過濾
            val stackTrace = e.stackTrace
            for (i in stackTrace.indices) {
                val stackTraceElement = stackTrace[i]
                if (i < 20) {
                    //記錄完整的前20條
                    context.append(stackTraceElement).append("\n\t")
                } else {
                    if (i == 20) {
                        context.append(
                            """---- FILTER BY $FILTER_EXCEPTION_KEY-----
	"""
                        )
                    }
                    //後續記錄只記錄和項目有關的記錄
                    val s = stackTraceElement.toString()
                    if (s.contains(FILTER_EXCEPTION_KEY)) {
                        context.append(s).append("\n\t")
                    }
                }
            }
            sayDanger(title, context.toString(), webhook)
        } catch (ex: Exception) {
            log.error("嘗試發送消息時發生錯誤:{}", e.message, e)
        }
    }

    /**
     * 发送消息
     * @param title 标题
     * @param e 异常内容
     */
    @JvmStatic
    fun say(title: String?, e: Throwable?) {
        getBean(SlackWebHookProperties::class.java).map { slackWebHookProperties: SlackWebHookProperties ->
            val webhook = slackWebHookProperties.webhooks["exception"]
            say(title, e, webhook)
            slackWebHookProperties
        }
    }
}