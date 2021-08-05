public class Employee {
    int id;
    String nameSurname;
    int age;

    public Employee(int age,int id, String nameSurname) {
        this.id = id;
        this.nameSurname = nameSurname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameSurname() {
        return nameSurname;
    }

    public void setNameSurname(String nameSurname) {
        this.nameSurname = nameSurname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
