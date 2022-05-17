package com.kingsley.base.config.property

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.stereotype.Component

@Component
@ConfigurationProperties(prefix = "config.slack")
class SlackWebHookProperties {
    var webhooks: Map<String, String> = HashMap()
}