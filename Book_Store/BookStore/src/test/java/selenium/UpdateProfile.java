/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package selenium;

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
public class UpdateProfile {
    private WebDriver driver;

    @Before
    public void setup() {
        System.setProperty("webdriver.chrome.driver", "D:\\App\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--remote-allow-origin=*");
        driver = new ChromeDriver(options);
        driver.get("http://localhost:8080/");
        driver.manage().window().maximize(); // Mở cửa sổ trình duyệt ở chế độ toàn màn hình
        login();
    }
    
    public void login() {
        // Điền dữ liệu vào trường phone
        driver.findElement(By.name("phone")).sendKeys("0123456789");

        // Điền dữ liệu vào trường password
        driver.findElement(By.name("password")).sendKeys("password1");

        // Ấn nút Login
        driver.findElement(By.name("btnLogin")).click();
    }

    @Test
    public void testUpdateProfile() {
        driver.get("http://localhost:8080/employee/updateProfile");
    }
}
