/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCmodel;

/**
 *
 * @author khang
 */
public class OrderDetail {

    private String id;
    private String bookName;
    private int quantity;
    private double price;

    public OrderDetail(String id, String bookName, int quantity, double price) {
        this.id = id;
        this.bookName = bookName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", bookName=" + bookName + ", quantity=" + quantity + ", price=" + price + '}';
    }

//            
//            ord_id varchar(10),
//	foo_id varchar(10) not null,
//	quantity int not null,
//	price decimal(10,2) not null,
}
