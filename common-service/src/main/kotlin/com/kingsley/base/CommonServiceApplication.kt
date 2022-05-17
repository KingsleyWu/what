package com.kingsley.base

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class CommonServiceApplication

fun main(args: Array<String>) {
	runApplication<CommonServiceApplication>(*args)
}
