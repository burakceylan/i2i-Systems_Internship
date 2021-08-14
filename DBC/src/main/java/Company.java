import java.util.ArrayList;

public class Company {
    ArrayList<Employee> employees;
    String name;

    public Company(ArrayList<Employee> employees, String name) {
        this.employees = employees;
        this.name = name;

    }

    /*
    * @preConditions employee age greater than 18 and less than 45
    * @postConditions employee will have been added to employee list.
    * */
    public void addEmployee(Employee e) {
        assert (e.getAge()<45 && e.getAge()>18) :"Age Error";
        employees.add(e);
        assert employees.contains(e):"Employee not added.";
    }
}
