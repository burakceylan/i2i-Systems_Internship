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

  

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

@WebService
public class CalculatorService {
    static Logger logger = Logger.getLogger(CalculatorService.class);
   @WebMethod(operationName = "sum")
    public int sum(@WebParam(name = "number1") int number1, @WebParam(name = "number2") int number2) {
        BasicConfigurator.configure();
        //TODO write your implementation code here:
        logger.info("sum");
        return number1+number2;
    }
     @WebMethod(operationName = "substract")
    public int substract(@WebParam(name = "number1") int number1, @WebParam(name = "number2") int number2) {
        //TODO write your implementation code here:
        return number1-number2;
    }
     @WebMethod(operationName = "multiply")
    public int multiply(@WebParam(name = "number1") int number1, @WebParam(name = "number2") int number2) {
        //TODO write your implementation code here:
        return number1*number2;
    }
     @WebMethod(operationName = "divide")
    public int divide(@WebParam(name = "number1") int number1, @WebParam(name = "number2") int number2) {
        //TODO write your implementation code here:
        return number1/number2;
    }  
}
