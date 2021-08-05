package org.example;

/**
 * Hello world!
 */

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class App {

    private static Logger logger = LogManager.getLogger(App.class);
    public static void main(String[] args) {
        logger.info("Program started");
        for (int i = 0; i < 10000; i++) {
            Fib_Prime fb = new Fib_Prime(logger);
            fb.primeAndInFibonacci();
        }
        logger.info("program ended");
    }
}
