package com.kingsley.base

import com.kingsley.base.utils.CommonStringUtils
import com.kingsley.base.utils.SpringContextUtils
import com.kingsley.base.utils.message.SlackUtils
import net.gpedro.integrations.slack.SlackAttachment
import net.gpedro.integrations.slack.SlackMessage
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.boot.context.event.ApplicationFailedEvent
import org.springframework.boot.context.event.ApplicationStartedEvent
import org.springframework.context.ApplicationListener
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Profile
import java.text.SimpleDateFormat
import java.util.*

@Configuration
@Profile("devel", "beta", "testing", "prod", "production")
class ApplicationEventConfig {
    private val log = LoggerFactory.getLogger(ApplicationEventConfig::class.java)

    @Bean
    fun startedListener() = ApplicationListener<ApplicationStartedEvent> {
        val secondName = secondName
        val format = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        log.info("$secondName - 啟動成功! ")
        val text =
            "啟動成功" + ",最大允許內存:" + Runtime.getRuntime().maxMemory() / 1048576 + "MB,已使用:" + Runtime.getRuntime()
                .totalMemory() / 1048576 + " @ " + format.format(
                Date()
            )
        val applicationName: String? = SpringContextUtils.getEnvironment("spring.application.name")
        val message = SlackMessage("")
        val attach = SlackAttachment()
        attach.setFallback(text)
        attach.setColor("good")
        //
        attach.setTitle("$applicationName @ $secondName")
        attach.setText(text)
        message.addAttachments(attach)
        log.debug("ApplicationStartedEvent:{}", CommonStringUtils.toString(message))
        SlackUtils.say(message)
    }

    @Bean
    fun failedListener() = ApplicationListener<ApplicationFailedEvent> {
        val exception: Throwable? = it.exception
        var errorMessage: String? = "未知錯誤"
        if (exception != null) {
            errorMessage = exception.message
            log.error(errorMessage, exception)
        }
        log.info("啟動失敗:{}", errorMessage)
        val text: String? = it.exception.message
        val applicationName: String? = SpringContextUtils.getEnvironment("spring.application.name")
        val message = SlackMessage("")
        val attach = SlackAttachment()
        attach.setFallback(text)
        attach.setColor("danger")
        attach.setTitle(applicationName + "@" + SpringContextUtils.firstProfiles)
        attach.setText(errorMessage)
        message.addAttachments(attach)
        log.debug("ApplicationStartedEvent:{}", CommonStringUtils.toString(message))
        SlackUtils.say(message)
    }

    companion object {

        @JvmStatic
        val secondName: String
            get() {
                var hostname: String? = SpringContextUtils.getEnvironment("POD_NAME")
                if (StringUtils.isBlank(hostname)) {
                    hostname = SpringContextUtils.getEnvironment("config.instance.name")
                }
                if (StringUtils.isBlank(hostname)) {
                    hostname = SpringContextUtils.getEnvironment("HOSTNAME")
                }
                if (StringUtils.isBlank(hostname)) {
                    hostname = "UNKNOWN"
                }
                return SpringContextUtils.firstProfiles + "/" + hostname
            }
    }
}