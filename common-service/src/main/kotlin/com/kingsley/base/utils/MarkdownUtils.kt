package com.kingsley.base.utils

import com.vladsch.flexmark.ext.emoji.EmojiExtension
import com.vladsch.flexmark.ext.gfm.strikethrough.StrikethroughExtension
import com.vladsch.flexmark.ext.gfm.tasklist.TaskListExtension
import com.vladsch.flexmark.ext.superscript.SuperscriptExtension
import com.vladsch.flexmark.ext.tables.TablesExtension
import com.vladsch.flexmark.ext.toc.TocExtension
import com.vladsch.flexmark.html.HtmlRenderer
import com.vladsch.flexmark.parser.Parser
import com.vladsch.flexmark.util.ast.Node
import com.vladsch.flexmark.util.data.MutableDataSet
import com.vladsch.flexmark.util.misc.Extension
import org.apache.commons.lang3.StringUtils

/**
 * @author kyler
 */
object MarkdownUtils {

    @JvmStatic
    fun toHtmlWithCss(markdown: String, cssScript: String): String {
//        log.debug("轉換前:{}", markdown);
        var markdownTemp = markdown
        if (StringUtils.isNotBlank(cssScript)) {
            markdownTemp = "$cssScript<span class=\"markdown-body\">\n\n$markdownTemp\n\n</span>"
        }
        val options = MutableDataSet()
        options.set(
            Parser.EXTENSIONS,
            listOf<Extension>(
                TablesExtension.create(),
                TocExtension.create(),
                StrikethroughExtension.create(),
                TaskListExtension.create(),
                EmojiExtension.create(),
                SuperscriptExtension.create()
            )
        )
        val parser = Parser.builder(options).build()
        val document: Node = parser.parse(markdownTemp)
        val renderer = HtmlRenderer.builder(options).build()
        //        log.debug("轉換後:{}", render);
        return renderer.render(document)
    }

    @JvmStatic
    @JvmOverloads
    fun toHtml(markdown: String, withCss: Boolean = false): String {
//        log.debug("轉換前:{}", markdown);
        var markdownTemp = markdown
        if (withCss) {
            markdownTemp = "<span class=\"markdown-body\">\n\n$markdownTemp\n\n</span>"
        }
        val options = MutableDataSet()
        options.set(
            Parser.EXTENSIONS,
            listOf<Extension>(
                TablesExtension.create(),
                TocExtension.create(),
                StrikethroughExtension.create(),
                TaskListExtension.create(),
                EmojiExtension.create(),
                SuperscriptExtension.create()
            )
        )
        val parser = Parser.builder(options).build()
        val document: Node = parser.parse(markdownTemp)
        val renderer = HtmlRenderer.builder(options).build()
        //        log.debug("轉換後:{}", render);
        return renderer.render(document)
    }


}

fun main() {
    val text = "# title \n\n |table|test|\n|---|---|\na|b\n111|222\n"
    println(MarkdownUtils.toHtml(text));
}