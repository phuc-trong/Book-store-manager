/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mmodel;

import java.sql.Date;

/**
 *
 * @author MY LAPTOP
 */
public class Order {

    private String ord_id;
    private String cus_phone;
    private String emp_phone;
    private String emp_name;
    private Date ord_date;
    private String ord_type;
    private String ord_pay;
    private String ord_status;
    private String ord_note;
    private double ord_total;

    public Order() {
    }

    public Order(String ord_id, String cus_phone, String emp_phone, Date ord_date, String ord_type, String ord_status, String ord_note, double ord_total) {
        this.ord_id = ord_id;
        this.cus_phone = cus_phone;
        this.emp_phone = emp_phone;
        this.ord_date = ord_date;
        this.ord_type = ord_type;
        this.ord_status = ord_status;
        this.ord_note = ord_note;
        this.ord_total = ord_total;
    }

    public Order(String ord_id, String ord_status, Date ord_date, String cus_phone, String ord_pay, double ord_total) {
        this.ord_id = ord_id;
        this.cus_phone = cus_phone;
        this.ord_date = ord_date;
        this.ord_pay = ord_pay;
        this.ord_status = ord_status;
        this.ord_total = ord_total;
    }

    public Order(String ord_id, String cus_phone, Date ord_date, String ord_status) {
        this.ord_id = ord_id;
        this.cus_phone = cus_phone;
        this.ord_date = ord_date;
        this.ord_status = ord_status;
    }

    public Order(String ord_id, String ord_status, Date ord_date) {
        this.ord_id = ord_id;
        this.ord_status = ord_status;
        this.ord_date = ord_date;
    }

    public Order(String ord_status, String emp_name, String ord_type, String ord_pay, Date ord_date,  String ord_note) {
        this.ord_status = ord_status;
        this.emp_name = emp_name;
        this.ord_type = ord_type;
        this.ord_pay = ord_pay;
        this.ord_date = ord_date;
        this.ord_note = ord_note;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getOrd_pay() {
        return ord_pay;
    }

    public void setOrd_pay(String ord_pay) {
        this.ord_pay = ord_pay;
    }

    public String getOrd_id() {
        return ord_id;
    }

    public void setOrd_id(String ord_id) {
        this.ord_id = ord_id;
    }

    public String getCus_phone() {
        return cus_phone;
    }

    public void setCus_phone(String cus_phone) {
        this.cus_phone = cus_phone;
    }

    public String getEmp_phone() {
        return emp_phone;
    }

    public void setEmp_phone(String emp_phone) {
        this.emp_phone = emp_phone;
    }

    public Date getOrd_date() {
        return ord_date;
    }

    public void setOrd_date(Date ord_date) {
        this.ord_date = ord_date;
    }

    public String getOrd_type() {
        return ord_type;
    }

    public void setOrd_type(String ord_type) {
        this.ord_type = ord_type;
    }

    public String getOrd_status() {
        return ord_status;
    }

    public void setOrd_status(String ord_status) {
        this.ord_status = ord_status;
    }

    public String getOrd_note() {
        return ord_note;
    }

    public void setOrd_note(String ord_note) {
        this.ord_note = ord_note;
    }

    public Double getOrd_total() {
        return ord_total;
    }

    public void setOrd_total(double ord_total) {
        this.ord_total = ord_total;
    }

}
