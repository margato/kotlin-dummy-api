package io.github.margato.aws.dummyapi.dummy.service

import io.github.margato.aws.dummyapi.dummy.model.DummyDto
import org.springframework.stereotype.Service
import java.net.InetAddress
import java.time.ZonedDateTime

@Service
class DummyService {

    fun generateDummyDto(): DummyDto {
        val timestamp = ZonedDateTime.now().toString()
        val ip = InetAddress.getLocalHost().hostAddress.toString()

        return DummyDto("Hello world, from $ip", timestamp)
    }

}