
class Test {
    public static void main(String[] args) {
        long start = System.nanoTime();
        Fib_PrimeNotD pnd = new Fib_PrimeNotD();
        for (int i = 5; i < 100000; i++) {
            pnd.primeAndInFibonacci(i);
        }
        long end = System.nanoTime();
        long duration = (end - start);
        System.out.println("Not Dynamic Duration = " + duration / 1000000 + "ms");

        start = System.nanoTime();
        Fib_PrimeD pd = new Fib_PrimeD();
        for (int i = 5; i < 100000; i++) {
            pd.primeAndInFibonacci(i);
        }
        end = System.nanoTime();
        duration = (end - start);
        System.out.println("Dynamic Duration = " + duration / 1000000 + "ms");

    }
}