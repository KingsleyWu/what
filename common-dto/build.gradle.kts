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
	implementation("org.springframework.boot:spring-boot-starter-actuator")
	implementation("org.springframework.boot:spring-boot-starter-security")
	implementation("org.springframework.boot:spring-boot-starter-web")
	implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
	implementation("org.jetbrains.kotlin:kotlin-reflect")
	implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
	runtimeOnly("mysql:mysql-connector-java")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
	testImplementation("org.springframework.security:spring-security-test")

	implementation("io.swagger:swagger-annotations:1.6.6")
	implementation("com.baomidou:mybatis-plus-extension:3.5.1")
	implementation("cn.afterturn:easypoi-annotation:4.4.0")
	implementation("com.fasterxml.jackson.core:jackson-annotations:2.13.3")
	implementation("javax.validation:validation-api:2.0.1.Final")
	implementation("commons-codec:commons-codec:1.15")
	implementation("ma.glasnost.orika:orika-core:1.5.4")
	implementation("org.apache.commons:commons-lang3:3.12.0")
	implementation("org.apache.commons:commons-text:1.9")
	implementation("org.hashids:hashids:1.0.3")
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
