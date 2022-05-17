import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	id("org.springframework.boot") version "2.6.7"
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
	implementation(project(":common-dto"))
	implementation("org.springframework.boot:spring-boot-starter-actuator")
	implementation("org.springframework.boot:spring-boot-starter-security")
	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("org.springframework.boot:spring-boot-starter-data-redis")
	implementation("org.springframework.boot:spring-boot-starter-cache")
	implementation("org.springframework.boot:spring-boot-configuration-processor")
	runtimeOnly("mysql:mysql-connector-java")
	implementation("org.flywaydb:flyway-core")
	implementation("com.fasterxml.jackson.core:jackson-databind")

	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
	testImplementation("org.springframework.security:spring-security-test")

	compileOnly("org.springframework.amqp:spring-rabbit:2.4.4")
	compileOnly("org.springframework.amqp:spring-amqp:2.4.4")

	implementation("com.alibaba:druid:1.2.9")
	implementation("org.apache.shardingsphere:shardingsphere-jdbc-core-spring-boot-starter:5.1.1")

	implementation("io.swagger:swagger-annotations:1.6.6")
	implementation("io.swagger:swagger-models:1.6.6")
	implementation("com.github.xiaoymin:knife4j-spring-boot-starter:3.0.3")

	implementation("com.baomidou:mybatis-plus-extension:3.5.1")
	implementation("com.baomidou:mybatis-plus-boot-starter:3.5.1")

	implementation("cn.afterturn:easypoi-annotation:4.4.0")
	implementation("cn.afterturn:easypoi-base:4.4.0")
	implementation("com.fasterxml.jackson.core:jackson-annotations:2.13.3")
	implementation("javax.validation:validation-api:2.0.1.Final")
	implementation("commons-codec:commons-codec:1.15")
	implementation("ma.glasnost.orika:orika-core:1.5.4")
	implementation("org.apache.commons:commons-lang3:3.12.0")
	implementation("org.apache.commons:commons-text:1.9")
	implementation("org.apache.commons:commons-csv:1.9.0")
	implementation("org.apache.commons:commons-pool2:2.11.1")
	implementation("org.apache.poi:poi-ooxml:5.2.2")
	implementation("org.apache.poi:poi:5.2.2")
	implementation("org.hashids:hashids:1.0.3")
	implementation("com.jayway.jsonpath:json-path:2.7.0")
	implementation("javax.xml.bind:jaxb-api:2.4.0-b180830.0359")
	implementation("com.amazonaws:aws-java-sdk-s3:1.12.220")
	implementation("com.auth0:java-jwt:3.19.2")
	implementation("com.maxmind.geoip2:geoip2:3.0.1")

	implementation("cn.hutool:hutool-core:5.8.0")
	implementation("cn.hutool:hutool-crypto:5.8.0")
	implementation("cn.hutool:hutool-captcha:5.8.0")
	implementation("cn.hutool:hutool-poi:5.8.0")

	implementation("com.vladsch.flexmark:flexmark:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-util:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-ext-tables:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-ext-toc:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-ext-gfm-strikethrough:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-ext-gfm-tasklist:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-ext-emoji:0.64.0")
	implementation("com.vladsch.flexmark:flexmark-ext-superscript:0.64.0")

	implementation("net.gpedro.integrations.slack:slack-webhook:1.4.0")
	implementation("io.micrometer:micrometer-registry-prometheus:1.9.0")
	implementation("org.redisson:redisson:3.17.0")
	implementation("io.springfox:springfox-boot-starter:3.0.0")
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
