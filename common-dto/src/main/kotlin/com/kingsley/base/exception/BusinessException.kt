package com.kingsley.base.exception

open class BusinessException : RuntimeException {

    var code: Int = 400

    constructor(message: String?) : super(message)

    constructor(message: String?, code: Int) : super(message) {
        this.code = code
    }

    constructor(message: String?, cause: Throwable?) : super(message, cause) {
        this.code = 400
    }

    constructor(message: String?, code: Int, cause: Throwable?) : super(message, cause) {
        this.code = code
    }
}