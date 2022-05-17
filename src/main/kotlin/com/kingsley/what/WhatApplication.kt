package com.kingsley.what

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class WhatApplication

fun main(args: Array<String>) {
    runApplication<WhatApplication>(*args)
}
