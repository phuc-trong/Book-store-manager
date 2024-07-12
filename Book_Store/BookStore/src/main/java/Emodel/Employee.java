/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Emodel;

import java.sql.Date;

/**
 *
 * @author khang
 */
public class Employee {

    private String phone;
    private String name;
    private String password;
    private String email;
    private String address;
    private Date birthday;
    private Date create;
    private String status;

    public Employee() {
    }

    public Employee(String phone, String name, String password, String email, String address, Date birthday, Date create, String status) {
        this.phone = phone;
        this.name = name;
        this.password = password;
        this.email = email;
        this.address = address;
        this.birthday = birthday;
        this.create = create;
        this.status = status;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
