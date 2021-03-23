package io.github.margato.aws.dummyapi.dummy.controller

import io.github.margato.aws.dummyapi.dummy.model.DummyDto
import io.github.margato.aws.dummyapi.dummy.service.DummyService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/greetings")
class DummyController(@Autowired val dummyService : DummyService) {

    @GetMapping
    fun greet(): ResponseEntity<DummyDto> {
        val dto = dummyService.generateDummyDto()
        return ResponseEntity.ok(dto)
    }

}