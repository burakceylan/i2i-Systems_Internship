/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

/**
 *
 * @author home
 */
import app.CalculatorService;
import app.CalculatorServiceService;
import java.util.ArrayList;
import java.util.Scanner;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

public class calculator {

    static Logger logger = Logger.getLogger(calculator.class);

    public static void main(String[] args) {
        BasicConfigurator.configure();
        logger.info("I'm started");
        // Create the proxy Web Service and call the sum method
        // using the port of the proxy service.
        CalculatorServiceService service = new CalculatorServiceService();
        CalculatorService port = service.getCalculatorServicePort();

        // retrieve the sum of number1 and number2
        ArrayList<String> operands = new ArrayList<>();
        operands.add("+");
        operands.add("/");
        operands.add("*");
        operands.add("-");
        Scanner sc = new Scanner(System.in);
        String input;

        System.out.print("Select operand\nSum (+)\nDivide (/)\nMultiply (*)\nSubstract (-)\nEXIT (EXIT)\nSelection :");
        while (!"EXIT".equals(input = sc.next())) {
            if (operands.contains(input)) {
                int number1 = 0, number2 = 0, result = 0;
                System.out.print("\nEnter number1: ");
                String numInput;
                while (true) {
                    try {
                        numInput = sc.next();
                        number1 = Integer.valueOf(numInput);
                        break;
                    } catch (NumberFormatException e) {
                        System.out.print("Number must be int.\nEnter number1: ");
                    }
                }
                System.out.print("Enter number2: ");
                while (true) {
                    try {
                        numInput = sc.next();
                        number2 = Integer.valueOf(numInput);
                        break;
                    } catch (NumberFormatException e) {
                        System.out.print("Number must be int.\nEnter number2: ");
                    }
                }

                switch (input) {
                    case "+":
                        result = port.sum(number1, number2);
                        break;
                    case "-":
                        result = port.substract(number1, number2);
                        break;
                    case "/":
                        if (number2 != 0) {
                            result = port.divide(number1, number2);
                        }

                        break;
                    case "*":
                        result = port.multiply(number1, number2);
                        break;
                    default:
                        result = 0;
                        break;
                }
                if (!(input.equals("/") && number2 == 0) ) {
                    System.out.println("Result: " + result + "\n");
                } else {
                 System.out.println("Result: uncertain\n");   
                }
            }
            System.out.print("Select operand\nSum (+)\nDivide (/)\nMultiply (*)\nSubstract (-)\nEXIT (EXIT)\nSelection :");
        }
        // int sum = port.sum(number1, number2);
    }

}
