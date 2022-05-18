import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	id("org.springframework.boot") version "2.5.2"
	id("io.spring.dependency-management") version "1.0.11.RELEASE"
	kotlin("jvm") version "1.6.21"
	kotlin("plugin.spring") version "1.6.21"
}

group = "com.kingsley"
version = "0.0.1-SNAPSHOT"
java.sourceCompatibility = JavaVersion.VERSION_11

repositories {
	mavenCentral()
}

dependencies {
	api(project(":common-dto"))
	api("org.springframework.boot:spring-boot-starter-actuator")
	api("org.springframework.boot:spring-boot-starter-security")
	api("org.springframework.boot:spring-boot-starter-web")
	api("org.springframework.boot:spring-boot-starter-data-redis")
	api("org.springframework.boot:spring-boot-starter-cache")
	api("org.springframework.boot:spring-boot-configuration-processor")
	runtimeOnly("mysql:mysql-connector-java")
	api("org.flywaydb:flyway-core")
	api("com.fasterxml.jackson.core:jackson-databind")

	api("org.jetbrains.kotlin:kotlin-reflect")
	api("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
	testImplementation("org.springframework.security:spring-security-test")

	compileOnly("org.springframework.amqp:spring-rabbit:2.4.4")
	compileOnly("org.springframework.amqp:spring-amqp:2.4.4")

	api("com.alibaba:druid:1.2.9")
	@Suppress("VulnerableLibrariesLocal")
	api("org.apache.shardingsphere:shardingsphere-jdbc-core-spring-boot-starter:5.1.1")
	api("com.google.protobuf:protobuf-java:3.20.1")

	api("io.swagger:swagger-annotations:1.6.6")
	api("io.swagger:swagger-models:1.6.6")
	api("com.github.xiaoymin:knife4j-spring-boot-starter:3.0.3")

	api("com.baomidou:mybatis-plus-extension:3.5.1")
	api("com.baomidou:mybatis-plus-boot-starter:3.5.1")

	api("cn.afterturn:easypoi-annotation:4.4.0")
	api("cn.afterturn:easypoi-base:4.4.0")
	api("com.fasterxml.jackson.core:jackson-annotations:2.13.3")
	api("javax.validation:validation-api:2.0.1.Final")
	api("commons-codec:commons-codec:1.15")
	api("ma.glasnost.orika:orika-core:1.5.4")
	api("org.apache.commons:commons-lang3:3.12.0")
	api("org.apache.commons:commons-text:1.9")
	api("org.apache.commons:commons-csv:1.9.0")
	api("org.apache.commons:commons-pool2:2.11.1")
	api("org.apache.poi:poi-ooxml:5.2.2")
	api("org.apache.poi:poi:5.2.2")
	api("org.hashids:hashids:1.0.3")
	api("com.jayway.jsonpath:json-path:2.7.0")
	api("javax.xml.bind:jaxb-api:2.4.0-b180830.0359")
	api("com.amazonaws:aws-java-sdk-s3:1.12.220")
	api("com.auth0:java-jwt:3.19.2")
	api("com.maxmind.geoip2:geoip2:3.0.1")

	api("cn.hutool:hutool-core:5.8.0")
	api("cn.hutool:hutool-crypto:5.8.0")
	api("cn.hutool:hutool-captcha:5.8.0")
	api("cn.hutool:hutool-poi:5.8.0")

	api("com.vladsch.flexmark:flexmark:0.64.0")
	api("com.vladsch.flexmark:flexmark-util:0.64.0")
	api("com.vladsch.flexmark:flexmark-ext-tables:0.64.0")
	api("com.vladsch.flexmark:flexmark-ext-toc:0.64.0")
	api("com.vladsch.flexmark:flexmark-ext-gfm-strikethrough:0.64.0")
	api("com.vladsch.flexmark:flexmark-ext-gfm-tasklist:0.64.0")
	api("com.vladsch.flexmark:flexmark-ext-emoji:0.64.0")
	api("com.vladsch.flexmark:flexmark-ext-superscript:0.64.0")

	api("net.gpedro.integrations.slack:slack-webhook:1.4.0")
	api("io.micrometer:micrometer-registry-prometheus:1.9.0")
	api("org.redisson:redisson:3.17.0")
	api("io.springfox:springfox-boot-starter:3.0.0")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "11"
	}
}

tasks.withType<Test> {
	useJUnitPlatform()
}
