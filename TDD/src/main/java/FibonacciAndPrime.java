public class FibonacciAndPrime {
    public boolean isPrimeAndFibonacci(int number) {
        return isPrime(number) && insideFibonacci(number);
    }

    private boolean isPrime(int number) {
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

    private boolean insideFibonacci(int number) {
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
