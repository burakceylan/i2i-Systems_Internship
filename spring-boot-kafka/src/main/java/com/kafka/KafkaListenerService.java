package com.kafka;

import com.kafka.dto.FibonacciPrimeCalcModel;
import com.kafka.operations.Fib_Prime;
import lombok.extern.slf4j.Slf4j;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class KafkaListenerService {

    @KafkaListener(
            topics = "${kafka.topic}",
            groupId = "${kafka.group.id}"
    )
    public void listen(@Payload FibonacciPrimeCalcModel message) {
        if (message.getOperation().equals("Fib-Prime")) {
            Fib_Prime fibPrime = new Fib_Prime();
            fibPrime.primeAndInFibonacci(message.getOperand());
        }
    }
}
