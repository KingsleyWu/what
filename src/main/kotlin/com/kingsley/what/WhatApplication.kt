package com.kingsley.what

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.servlet.config.annotation.EnableWebMvc

@EnableWebMvc
@SpringBootApplication
class WhatApplication

fun main(args: Array<String>) {
    runApplication<WhatApplication>(*args)

}
