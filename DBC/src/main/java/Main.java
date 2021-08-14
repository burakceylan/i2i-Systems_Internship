import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        Company company = new Company(new ArrayList<Employee>(),"i2i");
        Employee employee = new Employee(15,1,"FarukCeylan");
        Employee employee1 = new Employee(20,1,"FarukCeylan");
        company.addEmployee(employee);

    }
}

