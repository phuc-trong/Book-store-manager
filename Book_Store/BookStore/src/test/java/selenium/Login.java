/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package selenium;

import org.junit.After;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

/**
 *
 * @author MY LAPTOP
 */
public class Login {

    private WebDriver driver;

    public void setup() {
        System.setProperty("webdriver.chrome.driver", "D:\\App\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--remote-allow-origin=*");
        driver = new ChromeDriver(options);
    }

    @Test
    public void testLogin() {
        setup();
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình
        // Điền dữ liệu vào trường phone
        driver.findElement(By.name("phone")).sendKeys("0123456787");

        // Điền dữ liệu vào trường password
        driver.findElement(By.name("password")).sendKeys("password3");

        // Ấn nút Login
        driver.findElement(By.name("btnLogin")).click();
        String expectedURL = "http://localhost:8080/employee/orderList";
        String actualURL = driver.getCurrentUrl();
        assertEquals(expectedURL, actualURL);
    }

    @Test
    public void testLoginFail() {
        setup();
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình
        // Điền dữ liệu vào trường phone
        driver.findElement(By.name("phone")).sendKeys("0123456789");

        // Điền dữ liệu vào trường password
        driver.findElement(By.name("password")).sendKeys("a");

        // Ấn nút Login
        driver.findElement(By.name("btnLogin")).click();

        // Kiểm tra xem địa chỉ URL sau khi đăng nhập có chứa địa chỉ mong muốn không
        String expectedURL = "http://localhost:8080/employee/login/fail";
        String actualURL = driver.getCurrentUrl();
        assertEquals(expectedURL, actualURL);
    }

//    @After
    public void teardown(){
        driver.quit();
    }
}
