package com.kingsley.base.utils

import org.springframework.core.io.DefaultResourceLoader
import org.springframework.core.io.Resource
import org.springframework.core.io.ResourceLoader
import org.springframework.core.io.support.PathMatchingResourcePatternResolver
import java.io.File
import java.io.IOException
import java.nio.charset.StandardCharsets

object ResourceUtils {

    @JvmStatic
    fun readResourceAsString(path: String?): String? {
        val resourceLoader: ResourceLoader = DefaultResourceLoader()
        val resource = resourceLoader.getResource(path!!)
        return readAll(resource)
    }

    @JvmStatic
    private fun readAll(resource: Resource): String? {
        var result: String? = null
        resource.inputStream.use { inputStream ->
            val available = inputStream.available()
            if (available > 0) {
                val bytes = ByteArray(available)
                val count = inputStream.read(bytes)
                result = String(bytes, StandardCharsets.UTF_8)
            }
        }
        return result
    }

    @JvmStatic
    @Throws(IOException::class)
    fun listFile(path: String?): List<ResourceInfo> {
        val result: MutableList<ResourceInfo> = ArrayList()
        val resources = PathMatchingResourcePatternResolver().getResources(
            path!!
        )
        for (resource in resources) {
            val info = ResourceInfo(resource.filename, readAll(resource), resource.file)
            result.add(info)
        }
        return result
    }

    data class ResourceInfo(
        var fileName: String? = null,
        var content: String? = null,
        var file: File? = null
    )
}