
package app;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.2
 * 
 */
@WebService(name = "CalculatorService", targetNamespace = "http://com/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface CalculatorService {


    /**
     * 
     * @param number1
     * @param number2
     * @return
     *     returns int
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "multiply", targetNamespace = "http://com/", className = "app.Multiply")
    @ResponseWrapper(localName = "multiplyResponse", targetNamespace = "http://com/", className = "app.MultiplyResponse")
    @Action(input = "http://com/CalculatorService/multiplyRequest", output = "http://com/CalculatorService/multiplyResponse")
    public int multiply(
        @WebParam(name = "number1", targetNamespace = "")
        int number1,
        @WebParam(name = "number2", targetNamespace = "")
        int number2);

    /**
     * 
     * @param number1
     * @param number2
     * @return
     *     returns int
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "sum", targetNamespace = "http://com/", className = "app.Sum")
    @ResponseWrapper(localName = "sumResponse", targetNamespace = "http://com/", className = "app.SumResponse")
    @Action(input = "http://com/CalculatorService/sumRequest", output = "http://com/CalculatorService/sumResponse")
    public int sum(
        @WebParam(name = "number1", targetNamespace = "")
        int number1,
        @WebParam(name = "number2", targetNamespace = "")
        int number2);

    /**
     * 
     * @param number1
     * @param number2
     * @return
     *     returns int
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "divide", targetNamespace = "http://com/", className = "app.Divide")
    @ResponseWrapper(localName = "divideResponse", targetNamespace = "http://com/", className = "app.DivideResponse")
    @Action(input = "http://com/CalculatorService/divideRequest", output = "http://com/CalculatorService/divideResponse")
    public int divide(
        @WebParam(name = "number1", targetNamespace = "")
        int number1,
        @WebParam(name = "number2", targetNamespace = "")
        int number2);

    /**
     * 
     * @param number1
     * @param number2
     * @return
     *     returns int
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "substract", targetNamespace = "http://com/", className = "app.Substract")
    @ResponseWrapper(localName = "substractResponse", targetNamespace = "http://com/", className = "app.SubstractResponse")
    @Action(input = "http://com/CalculatorService/substractRequest", output = "http://com/CalculatorService/substractResponse")
    public int substract(
        @WebParam(name = "number1", targetNamespace = "")
        int number1,
        @WebParam(name = "number2", targetNamespace = "")
        int number2);

}