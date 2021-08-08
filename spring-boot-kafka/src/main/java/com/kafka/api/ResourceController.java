package com.kafka.api;

import com.kafka.dto.FibonacciPrimeCalcModel;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/calc")
public class ResourceController {

    @Value("${kafka.topic}")
    private String topic;

    @Autowired
    private final KafkaTemplate<String, FibonacciPrimeCalcModel> kafkaTemplate;

    public ResourceController(KafkaTemplate<String, FibonacciPrimeCalcModel> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    @PostMapping
    public void sendMessage(@RequestBody FibonacciPrimeCalcModel kMessage) {
        kafkaTemplate.send(topic, UUID.randomUUID().toString(), kMessage);
    }
}
