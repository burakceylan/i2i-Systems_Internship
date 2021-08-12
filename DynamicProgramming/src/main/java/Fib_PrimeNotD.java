public class Fib_PrimeNotD {


    static int fib(int n) {
        if (n <= 1)
            return n;
        return fib(n - 1) + fib(n - 2);
    }

    public void primeAndInFibonacci(int number) {
        boolean prime, exist;

        prime = isNumberPrime(number);
        exist = isNumberInFibonacci(number);
        /*if (prime && exist) {
            System.out.println(number + " is prime number and exists in Fibonacci series.");
        } else if (prime) {
            System.out.println(number + " is prime number and does not exist in Fibonacci series.");
        } else if (exist) {
            System.out.println(number + " is not prime number and exists in Fibonacci series.");
        } else {
            System.out.println(number + " is not prime number and does not exist in Fibonacci series.");
        }*/
    }

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

    static boolean isNumberInFibonacci(int number) {
        int next = 1, index = 1;
        int current = fib(index);
        while (current <= number) {
            if (number == current) {
                return true;
            }
            index++;
            current = fib(index);
        }
        return false;
    }
}

