package com.kingsley.base.config

import com.kingsley.base.utils.SpringContextUtils
import org.apache.commons.lang3.StringUtils
import org.slf4j.LoggerFactory
import org.springframework.boot.web.context.WebServerInitializedEvent
import org.springframework.context.ApplicationListener
import org.springframework.stereotype.Component
import java.net.InetAddress
import java.net.UnknownHostException

/**
 * @author kyler
 */
@Component
class ApplicationInfo : ApplicationListener<WebServerInitializedEvent?> {
    private val log = LoggerFactory.getLogger(Knife4jConfiguration::class.java)
    var serverPort = 0
        internal set

    val contextPath: String
        get() {
            var contextPath: String? = SpringContextUtils.getEnvironment("server.servlet.context-path")
            if (StringUtils.isEmpty(contextPath) || "/" == contextPath) {
                contextPath = ""
            }
            return contextPath!!
        }

    val url: String
        get() {
            var ip = "127.0.0.1"
            val address: InetAddress
            try {
                address = InetAddress.getLocalHost()
                ip = address.hostAddress
            } catch (e: UnknownHostException) {
                log.error(e.message, e)
            }
            return "http://$ip:$serverPort$contextPath"
        }

    override fun onApplicationEvent(event: WebServerInitializedEvent) {
        val port: Int = event.webServer.port
        // 9999 為監控端口,並不是業務端口.
        if (port != 9999) {
            serverPort = port
        }
    }
}