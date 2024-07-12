/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mmodel;

/**
 *
 * @author Khanh
 */
public class OrderDetail {
    private String book_id;
    private String img;
    private String name_book;
    private double unit_price;
    private int quantity;
    private double total_price;

    public OrderDetail(String book_id, String img, String name_book, double unit_price, int quantity, double total_price) {
        this.book_id = book_id;
        this.img = img;
        this.name_book = name_book;
        this.unit_price = unit_price;
        this.quantity = quantity;
        this.total_price = total_price;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName_book() {
        return name_book;
    }

    public void setName_book(String name_book) {
        this.name_book = name_book;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }
    
    
}
