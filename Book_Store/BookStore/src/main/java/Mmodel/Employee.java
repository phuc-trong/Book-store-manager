/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mmodel;

import java.sql.Date;


public class Employee {

    private String phone;
    private String name;
    private String email;
    private String address;
    private String password;
    private Date birthday;
    private Date create;
    private int order_served;
    private String emp_status;

    public Employee(String name, String phone, String password, String address, Date birthday, Date create) {

        this.phone = phone;
        this.name = name;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.create = create;
    }

    public Employee(String phone, String name, String password, String email, String address, Date birthday) {

        this.phone = phone;
        this.name = name;
        this.email = email;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
    }
    
    public Employee(String phone, String name, String password, String address, Date birthday, Date create, String emp_status) {
        this.phone = phone;
        this.name = name;
        this.address = address;
        this.password = password;
        this.birthday = birthday;
        this.create = create;
        this.emp_status = emp_status;
    }
    
     

    public Employee(String name, String email, String phone, String address, Date birthday, int order_served, Date create, String emp_status) {
        this.phone = phone;
        this.name = name;
        this.email = email;
        this.address = address;
        this.birthday = birthday;
        this.create = create;
        this.order_served = order_served;
        this.emp_status = emp_status;
    }

    public Employee(String name, String phone, int order_served) {
        this.phone = phone;
        this.name = name;
        this.order_served = order_served;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmp_status() {
        return emp_status;
    }

    public void setEmp_status(String emp_status) {
        this.emp_status = emp_status;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }


    public int getOrder_served() {
        return order_served;
    }

    public void setOrder_served(int order_served) {
        this.order_served = order_served;
    }
    

    @Override
    public String toString() {
        return "Employee{" + "phone=" + phone + ", name=" + name + ", address=" + address + ", birthday=" + birthday + ", create=" + create + '}';
    }
}
