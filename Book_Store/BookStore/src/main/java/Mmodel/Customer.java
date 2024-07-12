/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mmodel;

import java.sql.Date;

/**
 *
 * @author ddand
 */
public class Customer {

    private String phone;
    private String name;
    private String email;
    private String address;
    private Date birthday;
    private Date create_date;
    private int cancel_count;
    private int numberOrder;
    private double totalSpending;
    private String cus_status;
    private String time_ago;

    public Customer(String name, String phone, String address, Date birthday, Date create_date, int cancel_count) {

        this.phone = phone;
        this.name = name;
        this.address = address;
        this.birthday = birthday;
        this.create_date = create_date;
        this.cancel_count = cancel_count;
    }


    public Customer(String name, String phone, String email, String address, Date birthday, Date create_date, int cancel_count, int numberOrder, double totalSpending, String cus_status) {

        this.phone = phone;
        this.name = name;
        this.email = email;
        this.address = address;
        this.birthday = birthday;

        this.create_date = create_date;
        this.cancel_count = cancel_count;
        this.numberOrder = numberOrder;
        this.totalSpending = totalSpending;
        this.cus_status = cus_status;
    }
    
    public Customer(String name, String phone, int numberOrder, double totalSpending) {
        this.phone = phone;
        this.name = name;
        this.numberOrder = numberOrder;
        this.totalSpending = totalSpending;
    }

    public Customer(String name, String phone, String status, int numberOrder, int cancel_count) {
        this.name = name;
        this.phone = phone;
        this.cus_status = status;
        this.numberOrder = numberOrder;
        this.cancel_count = cancel_count;
    }

    public Customer(String name, String phone, String address, Date birthday) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.birthday = birthday;
    }

    public Customer(String name, String time_ago, String phone) {
        this.name = name;
        this.time_ago = time_ago;
        this.phone = phone;
    }
    
     public Customer(String name, String phone, String address, int a) {
        this.name = name;
        this.phone = phone;
        this.address = address;
     }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
     
    public String getTime_ago() {
        return time_ago;
    }

    public void setTime_ago(String time_ago) {
        this.time_ago = time_ago;
    }

    public String getCus_status() {
        return cus_status;
    }

    public void setCus_status(String cus_status) {
        this.cus_status = cus_status;
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

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }


    public int getNumberOrder() {
        return numberOrder;
    }

    public void setNumberOrder(int numberOrder) {
        this.numberOrder = numberOrder;
    }

    public double getTotalSpending() {
        return totalSpending;
    }

    public void setTotalSpending(double totalSpending) {
        this.totalSpending = totalSpending;
    }


    public int getCancel_count() {
        return cancel_count;
    }

    public void setCancel_count(int cancel_count) {
        this.cancel_count = cancel_count;
    }

    @Override
    public String toString() {
        return "Customer{" + "phone=" + phone + ", name=" + name + ", address=" + address + ", birthday=" + birthday + ", create_date=" + create_date + ", cancel_count=" + cancel_count + '}';
    }


}
