/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCmodel;

/**
 *
 * @author khang
 */
public class Cart {

    String phone;
    Book book;
    int quantity;

    public Cart(String phone, Book book, int quantity) {
        this.phone = phone;
        this.book = book;
        this.quantity = quantity;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "phone=" + phone + ", book=" + book + ", quantity=" + quantity + '}';
    }
    
    
}
