/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mmodel;

import java.text.DecimalFormat;

/**
 *
 * @author khang
 */
public class Book {

    private String id;
    private String categoryId;
    private String name;
    private double price;
    private double sale;
    private String description;
    private String status;
    private String img;
    private String realPrice;
    private int numOrder;
    private String caterogyName;

    public Book() {
    }

    public Book(String id, String name, double price, double sale, String description, String status, String img, int numOrder, String caterogyName, String categoryId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.status = status;
        this.img = img;
        this.numOrder = numOrder;
        this.caterogyName = caterogyName;
        this.categoryId = categoryId;
     }
    
    public Book(String id, String name, double price, double sale, String description, String status, String img, String caterogyName, String categoryId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.status = status;
        this.img = img;
        this.caterogyName = caterogyName;
        this.categoryId = categoryId;
     }
    
    public Book(String id, String name, String img, double price, double sale, String status, int numOrder) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.img = img;
        this.status = status;
        this.numOrder = numOrder;
    }

    public Book(String id, String name, String img, double price, double sale, String categoryId, String status, int numOrder) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.categoryId = categoryId;
        this.sale = sale;
        this.img = img;
        this.status = status;
        this.numOrder = numOrder;
    }

    
    
    public Book(String id, String categoryId, String name, double price, double sale, String description, String status, String img) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.status = status;
        this.img = img;
    }
    
    

    public Book(String id, String categoryId, String name, double price, double sale, String description, String status, String img, int numOrder) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.price = price;
        this.sale = sale;
        this.description = description;
        this.status = status;
        this.img = img;
        this.numOrder = numOrder;
    }
    
    
    public String getCaterogyName() {
        return caterogyName;
    }

    public void setCaterogyName(String caterogyName) {
        this.caterogyName = caterogyName;
    }

    public int getNumOrder() {
        return numOrder;
    }

    public void setNumOrder(int numOrder) {
        this.numOrder = numOrder;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
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

    DecimalFormat df = new DecimalFormat("#.##");
    
    public String getRealPrice() {
        return df.format(getPrice()-(getPrice()*(getSale()/100))); 
    }
    
    public void setRealPrice(String realPrice){
        this.realPrice = df.format(getPrice()-(getPrice()*(getSale()/100))); 
    }

    @Override
    public String toString() {
        return "Book{" + "id=" + id + ", categoryId=" + categoryId + ", name=" + name + ", price=" + price + ", sale=" + sale + ", description=" + description + ", status=" + status + ", img=" + img + '}';
    }

}
