package io.github.margato.aws.dummyapi

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DummyApplication

fun main(args: Array<String>) {
    runApplication<DummyApplication>(*args)
}
