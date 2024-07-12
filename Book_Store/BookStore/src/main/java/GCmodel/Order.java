/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCmodel;

import java.sql.Date;
import java.util.List;

public class Order {

    private String id;
    private String cus_phone;
    private String emp_phone;
    private Date orderDate;
    private String type, status, pay, note;
    private double total;
    private List<OrderDetail> orderDetail;

    public Order(String id, String cus_phone, String emp_phone, Date orderDate, String type, String status, String pay, String note, double total, List<OrderDetail> orderDetail) {
        this.id = id;
        this.cus_phone = cus_phone;
        this.emp_phone = emp_phone;
        this.orderDate = orderDate;
        this.type = type;
        this.status = status;
        this.pay = pay;
        this.note = note;
        this.total = (double) Math.round(total * 100) / 100;
        this.orderDetail = orderDetail;
    }

    public Order(String cus_phone, String type, String pay, String note, double total) {
        this.cus_phone = cus_phone;
        this.type = type;
        this.pay = pay;
        this.note = note;
        this.total = (double) Math.round(total * 100) / 100;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPay() {
        return pay;
    }

    public void setPay(String pay) {
        this.pay = pay;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(List<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", cus_phone=" + cus_phone + ", emp_phone=" + emp_phone + ", orderDate=" + orderDate + ", type=" + type + ", status=" + status + ", pay=" + pay + ", note=" + note + ", total=" + total + ", orderDetail=" + orderDetail + '}';
    }

}
