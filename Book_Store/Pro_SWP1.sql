-- Category Table
CREATE TABLE Category(
    cat_id VARCHAR(10),
    cat_name NVARCHAR(20) NOT NULL,
    cat_status VARCHAR(10) NOT NULL,
    PRIMARY KEY (cat_id)
);

-- Book Table
CREATE TABLE Book(
    boo_id VARCHAR(10),
    cat_id VARCHAR(10) NOT NULL,
    boo_name NVARCHAR(50) NOT NULL,
    boo_price DECIMAL(10,2) NOT NULL,
    boo_sale DECIMAL(10,2) NOT NULL,
    boo_description NVARCHAR(200) NOT NULL,
    boo_status VARCHAR(10) NOT NULL,
    boo_img VARCHAR(255) NOT NULL,
    PRIMARY KEY (boo_id),
    FOREIGN KEY (cat_id) REFERENCES Category(cat_id)
);

-- Customer Table
CREATE TABLE Customer (
    cus_phone VARCHAR(10),
    cus_name NVARCHAR(50) NOT NULL,
    cus_password VARCHAR(32) NOT NULL,
    cus_email VARCHAR(50) NOT NULL,
    cus_address NVARCHAR(50) NOT NULL,
    cus_birthday DATE NOT NULL,
    cus_create DATE NOT NULL,
    cus_status VARCHAR(10) NOT NULL,
    PRIMARY KEY (cus_phone)
);

-- Employee Table
CREATE TABLE Employee (
    emp_phone VARCHAR(10),
    emp_name NVARCHAR(50) NOT NULL,
    emp_password VARCHAR(32) NOT NULL,
    emp_email VARCHAR(50) NOT NULL,
    emp_address NVARCHAR(50) NOT NULL,
    emp_birthday DATE NOT NULL,
    emp_create DATE NOT NULL,
    emp_status VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_phone)
);

-- Order Table
CREATE TABLE [Order] (
    ord_id VARCHAR(10),
    cus_phone VARCHAR(10) NOT NULL,
    emp_phone VARCHAR(10),
    ord_date DATE NOT NULL,
    ord_type VARCHAR(10) NOT NULL,
    ord_status VARCHAR(10) NOT NULL,
    ord_pay VARCHAR(7) NOT NULL,
    ord_note NVARCHAR(200) NOT NULL,
    ord_total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (ord_id),
    FOREIGN KEY (cus_phone) REFERENCES Customer(cus_phone),
    FOREIGN KEY (emp_phone) REFERENCES Employee(emp_phone)
);

-- OrderDetail Table
CREATE TABLE OrderDetail(
    ord_id VARCHAR(10),
    boo_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ord_id) REFERENCES [Order](ord_id),
    FOREIGN KEY (boo_id) REFERENCES Book(boo_id)
);

-- Manager Table
CREATE TABLE Manager(
    username VARCHAR(20),
    password VARCHAR(32) NOT NULL,
    PRIMARY KEY (username)
);

-- Cart Table
CREATE TABLE Cart(
    cus_phone VARCHAR(10),
    boo_id VARCHAR(10),
    quantity INT,
    FOREIGN KEY (cus_phone) REFERENCES Customer(cus_phone),
    FOREIGN KEY (boo_id) REFERENCES Book(boo_id)
);

-- Delivery Table
CREATE TABLE Delivery (
    del_id VARCHAR(10),
    ord_id VARCHAR(10) NOT NULL,
    del_date DATE NOT NULL,
    del_status VARCHAR(10) NOT NULL,
    del_address NVARCHAR(50) NOT NULL,
    PRIMARY KEY (del_id),
    FOREIGN KEY (ord_id) REFERENCES [Order](ord_id)
);

-- Voucher Table
CREATE TABLE Voucher (
    vou_id VARCHAR(10),
    cus_phone VARCHAR(10) NOT NULL,
    vou_code NVARCHAR(20) NOT NULL,
    vou_discount DECIMAL(5,2) NOT NULL,
    vou_status VARCHAR(10) NOT NULL,
    vou_expiry DATE NOT NULL,
    PRIMARY KEY (vou_id),
    FOREIGN KEY (cus_phone) REFERENCES Customer(cus_phone)
);