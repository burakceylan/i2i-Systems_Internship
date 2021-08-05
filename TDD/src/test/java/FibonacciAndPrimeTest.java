import org.testng.Assert;
import org.testng.annotations.Test;


public class FibonacciAndPrimeTest {
    FibonacciAndPrime fp;
    boolean response;

    @Test
    public void PrimeAndFibonacci() {
        fp = new FibonacciAndPrime();
        response = fp.isPrimeAndFibonacci(2);
        Assert.assertEquals(true,response);
    }
    @Test
    public void PrimeAndNotFibonacci() {
        fp = new FibonacciAndPrime();
        response = fp.isPrimeAndFibonacci(11);
        Assert.assertEquals(false,response);
    }
    @Test
    public void notPrimeAndFibonacci() {
        fp = new FibonacciAndPrime();
        response = fp.isPrimeAndFibonacci(1);
        Assert.assertEquals(false,response);
    }
    @Test
    public void notPrimeAndNotFibonacci() {
        fp = new FibonacciAndPrime();
        response = fp.isPrimeAndFibonacci(4);
        Assert.assertEquals(false,response);
    }
}