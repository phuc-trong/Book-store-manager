/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCmodel;

/**
 *
 * @author khang
 */
public class Book {

    private String id;
    private Category category;
    private String name;
    private double price;
    private double sale;
    private String description;
    private String status;
    private String img;
    private double realPrice;

    public Book(String id, Category category, String name, double price, double sale, String description, String status, String img) {
        this.id = id;
        this.category = category;
        this.name = name;
        this.price = (double) Math.round(price * 100) / 100;
        this.sale = sale;
        this.description = description;
        this.status = status;
        this.img = img;
        realPrice = price - (price * sale/100);
        realPrice = (double) Math.round(realPrice * 100) / 100;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSale() {
        return sale;
    }

    public void setSale(double sale) {
        this.sale = sale;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getRealPrice() {
        return realPrice;
    }

    public void setRealPrice(double realPrice) {
        this.realPrice = realPrice;
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", category=" + category + ", name=" + name + ", price=" + price + ", sale=" + sale + ", description=" + description + ", status=" + status + ", img=" + img + ", realPrice=" + realPrice + '}';
    }
    
    

}
