package com.kafka.operations;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Fib_Prime {


    public Fib_Prime() {
    }

    public void primeAndInFibonacci(int number) {
        boolean prime, exist;
            /*  Calculates the prime and exist status
                According the calculations print the relevant answer. */
        prime = isNumberPrime(number);
        exist = isNumberInFibonacci(number);
        if (prime && exist) {
            System.out.println(number + " is prime number and exists in Fibonacci series.");
        } else if (prime) {
            System.out.println(number + " is prime number and does not exist in Fibonacci series.");
        } else if (exist) {
            System.out.println(number + " is not prime number and exists in Fibonacci series.");
        } else {
            System.out.println(number + " is not prime number and does not exist in Fibonacci series.");
        }
    }

    /*  Checks the given number is prime
        Returns true if the number is prime, otherwise returns false */
    static boolean isNumberPrime(int number) {
        int factors = 0;
        int j = 1;

        while (j <= number) {
            if (number % j == 0) {
                factors++;
            }
            j++;
        }
        return (factors == 2);

    }

    /*  Checks the given number exists in Fibonacci series
        Returns true if the number exists in Fibonacci, otherwise returns false */
    static boolean isNumberInFibonacci(int number) {
        int current = 1, next = 1, temp;
        while (current <= number) {
            if (number == current) {
                return true;
            }
            next = current + next;
            current = next - current;
        }
        return false;
    }
}
