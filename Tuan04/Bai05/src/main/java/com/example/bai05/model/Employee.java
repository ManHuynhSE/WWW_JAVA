package com.example.bai05.model;

public class Employee {
    private int id;
    private String name;
    private String role;
    private double salary;
    private int dept_id;


    public Employee() {
    }

    public Employee(int id, String name, int dept_id, double salary) {
        this.id = id;
        this.name = name;
        this.salary = salary;
        this.dept_id = dept_id;
    }

    public Employee(int id, String name, String role, double salary) {
        this.id = id;
        this.name = name;
        this.role = role;
        this.salary = salary;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public int getDept_id() {
        return dept_id;
    }

    public void setDept_id(int dept_id) {
        this.dept_id = dept_id;
    }
}
