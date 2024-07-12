/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Emodel;

import java.sql.Date;

/**
 *
 * @author ddand
 */
public class Customer {
    private String phone;
    private String name;
    private String password;
    private String email;
    private String address;
    private Date birthday;
    private Date create_date;
    private String status;
    private int cancel_count;

    public Customer() {
    }

    public Customer(String phone, String name, String password, String email, String address, Date birthday, Date create_date, String status, int cancel_count) {
        this.phone = phone;
        this.name = name;
        this.password = password;
        this.email = email;
        this.address = address;
        this.birthday = birthday;
        this.create_date = create_date;
        this.status = status;
        this.cancel_count = cancel_count;
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

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCancel_count() {
        return cancel_count;
    }

    public void setCancel_count(int cancel_count) {
        this.cancel_count = cancel_count;
    }

    

}
