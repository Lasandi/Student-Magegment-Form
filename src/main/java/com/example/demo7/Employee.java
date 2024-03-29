package com.example.demo7;


public class Employee {
    private String id;
    private String name;
    private String departmentName;
    private String addressType;
    private String address;
    private int NO;

    // Constructors, getters, setters, etc.

    public Employee(String id,String name, String departmentName, String addressType, String address, int NO) {
        this.id = id;
        this.name = name;
        this.departmentName = departmentName;
        this.addressType = addressType;
        this.address = address;
        this.NO = NO;
    }

    public Employee() {

    }

    // Add other constructors, getters, setters, etc. based on your requirements

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getAddressType() {
        return addressType;
    }

    public void setAddressType(String addressType) {
        this.addressType = addressType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getNO() {
        return NO;
    }

    public void setNO(int NO) {
        this.NO = NO;
    }
}
