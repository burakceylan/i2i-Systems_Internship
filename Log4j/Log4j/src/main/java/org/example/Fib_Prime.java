package org.example;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Fib_Prime {
    private static  Logger logger;
    Fib_Prime(Logger l){
        logger=l;
    }

    public void primeAndInFibonacci() {
        boolean prime, exist;
        for (int i = 2; i < 15; i++) {
            logger.info("Start calculating " + i + ".");
            /*  Calculates the prime and exist status
                According the calculations print the relevant answer. */
            prime = isNumberPrime(i);
            exist = isNumberInFibonacci(i);
            if (prime && exist) {
                System.out.println(i + " is prime number and exists in Fibonacci series.");
            } else if (prime) {
                System.out.println(i + " is prime number and does not exist in Fibonacci series.");
            } else if (exist) {
                System.out.println(i + " is not prime number and exists in Fibonacci series.");
            } else {
                System.out.println(i + " is not prime number and does not exist in Fibonacci series.");
            }
        }
    }

    /*  Checks the given number is prime
        Returns true if the number is prime, otherwise returns false */
    static boolean isNumberPrime(int number) {
        logger.info("Checks status of prime.");
        for (int i = 2; i <= number / 2; i++) {
            if ((number % i) == 0) {
                return false;
            }
        }
        return true;

    }

    /*  Checks the given number exists in Fibonacci series
        Returns true if the number exists in Fibonacci, otherwise returns false */
    static boolean isNumberInFibonacci(int number) {
        logger.info("Checks inside the fibonacci.");
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
