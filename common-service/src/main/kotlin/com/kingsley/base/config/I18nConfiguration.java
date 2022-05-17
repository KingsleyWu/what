package com.kingsley.base.config;

import cn.hutool.core.collection.CollectionUtil;
import com.google.common.collect.ImmutableList;
import com.kingsley.base.utils.I18nUtils;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.i18n.LocaleContext;
import org.springframework.context.i18n.TimeZoneAwareLocaleContext;
import org.springframework.core.Ordered;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.AbstractLocaleContextResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Configuration
public class I18nConfiguration implements WebMvcConfigurer {
    private Logger log = LoggerFactory.getLogger(I18nConfiguration.class);

    public static final String LANGUAGE_CHANGE_PARAM = "x-locale";
    public static final String LANGUAGE_HEAD = "Accept-Language";
    public static final String LANGUAGE_CUSTOM_HEAD = "x-accept-language";

    private static final String QOOAPP_CURRENT_LOCALE = "qooappCurrentLocale";

    @Autowired(required = false)
    List<I18nsLocaleCustomer> localeCustomerList;

    //language = props.getProperty("user.language", "en");
    @Value("${config.i18ns.default-locale:en}")
    String defaultLocale;

    @Value("${config.i18ns.head:x-locale}")
    String localeHead;

    /**
     * 默认解析器
     */
    @Bean
    public LocaleResolver localeResolver() {
        AbstractLocaleContextResolver localeResolver = new AbstractLocaleContextResolver() {
            @Override
            public @NonNull LocaleContext resolveLocaleContext(@NonNull HttpServletRequest request) {
                return new TimeZoneAwareLocaleContext() {
                    @Override
                    public Locale getLocale() {

                        final Object qooappCurrentLocale = request.getAttribute(QOOAPP_CURRENT_LOCALE);
                        if (ObjectUtils.isNotEmpty(qooappCurrentLocale)){
                            return I18nUtils.getLocaleByCode(qooappCurrentLocale.toString());
                        }

                        String localeInHead;
                        List<String> langHeaders = Stream.of(request.getHeader(localeHead), request.getHeader(LANGUAGE_CUSTOM_HEAD)).collect(Collectors.toList());
                        for (String langHeader : langHeaders) {
                            localeInHead = langHeader;
                            if (StringUtils.isNotBlank(localeInHead)) {
                                if (CollectionUtil.isNotEmpty(localeCustomerList)){
                                    for (I18nsLocaleCustomer i18nsLocaleCustomer : localeCustomerList) {
                                        localeInHead = i18nsLocaleCustomer.customer(localeInHead);
                                    }
                                }
                                return I18nUtils.getLocaleByCode(localeInHead);
                            }
                        }
                        String langHead = request.getHeader(LANGUAGE_HEAD);
                        log.debug("獲取到瀏覽器語言信息:{}",langHead);
                        if(StringUtils.isNotBlank(langHead)){
                            //Accept-Language: zh-CN,zh;q=0.9,en;q=0.8,en-GB;q=0.7,en-US;q=0.6,zh-TW;q=0.5
                            //嘗試獲取瀏覽器的語言
                            String langs = langHead.replaceAll(";q=.*?,",",").replaceAll("-","_");

                            final String[] split = StringUtils.split(langs, ',');
                            //這裡只處理第一個
                            localeInHead = split[0];
                            log.debug("第一個語言:{},完整列表:{}", localeInHead, List.of(langs));
                            if (CollectionUtil.isNotEmpty(localeCustomerList)){
                                for (I18nsLocaleCustomer i18nsLocaleCustomer : localeCustomerList) {
                                    localeInHead = i18nsLocaleCustomer.customer(localeInHead);
                                }
                            }

                            return I18nUtils.getLocaleByCode(localeInHead);
                        }
                        return new Locale(defaultLocale);
                    }

                    @Override
                    @Nullable
                    public TimeZone getTimeZone() {
                        return TimeZone.getDefault();
                    }
                };
            }

            @Override
            public void setLocaleContext(@NonNull HttpServletRequest request, @Nullable HttpServletResponse response, @Nullable LocaleContext localeContext) {
                if (localeContext == null || localeContext.getLocale() == null){
                    request.removeAttribute(QOOAPP_CURRENT_LOCALE);
                }else{
                    request.setAttribute(QOOAPP_CURRENT_LOCALE, localeContext.getLocale().toString());
                }
            }
        };

        final Locale defaultLocale = I18nUtils.getLocaleByCode(this.defaultLocale);
        Locale.setDefault(defaultLocale);
        localeResolver.setDefaultLocale(defaultLocale);
        return localeResolver;
    }

//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new I18nInterceptor());
//    }


    private static class I18nInterceptor implements HandlerInterceptor {
        @Override
        public boolean preHandle(@NonNull HttpServletRequest request,
                                 @NonNull HttpServletResponse response, @NonNull Object handler) throws Exception {

//            request.getParameter("")

            return HandlerInterceptor.super.preHandle(request, response, handler);
        }
    }

    /**
     * 通過實現這個bean來滿足對多語言code的自定義處理
     */
    public interface I18nsLocaleCustomer extends Ordered {
        /**
         *
         * @param locale 本地code
         * @return 返回新的本地code
         */
        String customer(String locale);
    }

    /**
     * 簡單實現. 滿足QooApp對多語言的基本處理方案.
     */
    public static class SimpleI18nsLocaleCustomer implements I18nsLocaleCustomer{

        private final ImmutableList<String> allowLocal;

        public SimpleI18nsLocaleCustomer(){
            allowLocal = null;
        }

        /**
         * 允許的語言列表.如果不存在則返回第一個.
         * @param countries 允許的語言列表
         */
        public SimpleI18nsLocaleCustomer(String ... countries){
            allowLocal = ImmutableList.copyOf(countries);
        }

        @Override
        public String customer(String s) {
            s = s.replace('-','_');

            if (allowLocal != null && allowLocal.size()>0){
                //如果存在允許列表.則直接返回
                for (String s1 : allowLocal) {
                    if (s1.equalsIgnoreCase(s)){
                        return s;
                    }
                }
            }

            if ("zh_CN".equalsIgnoreCase(s)){
                return "zh_CN";
            }

            //繁體語係統一為 zh_HK
            for (String traditionalChineseLocale : I18nUtils.TRADITIONAL_CHINESE_LOCALES) {
                if (traditionalChineseLocale.equalsIgnoreCase(s)){
                    return "zh_HK";
                }
            }

            //其他中文語係統一為簡體中文
            if (s.startsWith("zh")){
                return "zh_CN";
            }

            //其他所有語係只保留語言部分.忽視國家部分
            int index = s.indexOf("_");
            String local = s;
            if (index > 0){
                local = s.substring(0, index);
            }

            if (allowLocal != null && allowLocal.size()>0 && !allowLocal.contains(local)){
                //如果允許列表不存在,則返回第一個
                return allowLocal.get(0);
            }
            return local;
        }

        @Override
        public int getOrder() {
            return -1;
        }
    }
}
