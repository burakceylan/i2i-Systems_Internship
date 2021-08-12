public class Fib_PrimeD {


    public Fib_PrimeD() {
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
