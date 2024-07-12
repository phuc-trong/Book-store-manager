/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Econtroller;

import Edao.CustomerDAO;
import Edao.EmployeeDAO;
import Edao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import Emodel.Customer;
import Emodel.Employee;

/**
 *
 * @author MY LAPTOP
 */
public class EmployeeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EmployeeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EmployeeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String folder = "/EmployeePage";
        String path = request.getRequestURI();
        OrderDAO ordDAO = new OrderDAO();
        String phone = request.getSession().getAttribute("phone") + "";
        if (path.endsWith("/employee/Elogin")) {
            request.getRequestDispatcher(folder + "/Elogin.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EorderList")) {
            ResultSet rs = ordDAO.getOrderByEmployeePhone(phone);
            request.setAttribute("rs", rs);
            request.getRequestDispatcher(folder + "/EorderList.jsp").forward(request, response);
        } else if (path.startsWith("/employee/EcustomerInfo")) {
            String[] data = path.split("/");
            String customerPhone = data[data.length - 1];
            String orderDetailId = data[data.length - 2];
            CustomerDAO cusDAO = new CustomerDAO();
            ResultSet order = ordDAO.getOrderByCustomerPhone(customerPhone);
            request.setAttribute("order", order);
            Customer customerInfo = cusDAO.searchByPhone(customerPhone);
            request.setAttribute("customerInfo", customerInfo);
            request.setAttribute("orderDetailId", orderDetailId);
            request.getRequestDispatcher(folder + "/EcustomerInfo.jsp").forward(request, response);
        } else if (path.startsWith("/employee/EsearchByOrderId")) {
            try {
                String orderId = request.getParameter("orderId");
                ResultSet rs = ordDAO.getOrderById(orderId, phone);
                String searchResultHtml = "<tbody id=\"itemList\">";
                while (rs.next()) {
                    searchResultHtml += "<tr align=\"center\">";
                    searchResultHtml += "<td>" + rs.getString("ord_id") + "</td>";
                    String status = rs.getString("ord_status");
                    searchResultHtml += "<td>";
                    if (status.equals("Preparing")) {
                        searchResultHtml += "<div class=\"btn btn-primary\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Completed")) {
                        searchResultHtml += "<div class=\"btn btn-success\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Waiting")) {
                        searchResultHtml += "<div class=\"btn btn-warning\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Rejected")) {
                        searchResultHtml += "<div class=\"btn btn-secondary\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    } else if (status.equals("Cancelled")) {
                        searchResultHtml += "<div class=\"btn btn-danger\" style=\"font-weight: bold; font-size: 25px\">" + rs.getString("ord_status") + "</div>";
                    }
                    searchResultHtml += "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_date") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("cus_name") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("cus_phone") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_type") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_pay") + "</td>";
                    searchResultHtml += "<td>" + rs.getString("ord_total") + "</td>";
                    searchResultHtml += "<td><a class=\"btn btn-outline-primary\" id=\"btnView\" href=\"/EorderDetail/" + rs.getString("ord_id") + "\" style=\"font-weight: bold; font-size: 25px\">View</a></td>";
                    searchResultHtml += "</tr>";
                }
                searchResultHtml += "</tbody>";
                response.setContentType("text/html");
                response.getWriter().write(searchResultHtml);
            } catch (SQLException ex) {
                Logger.getLogger(EmployeeController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (path.endsWith("/employee/Elogout")) {
            session.removeAttribute("phone");
            session.removeAttribute("fullname");
            session.invalidate();
            request.getRequestDispatcher(folder + "/Elogin.jsp").forward(request, response);
        } else if (path.endsWith("/employee/login/fail")) {
            String loginError = "The phone or password is incorrect!";
            request.setAttribute("loginError", loginError);
            request.getRequestDispatcher(folder + "/Elogin.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EupdateProfile")) {
            request.getRequestDispatcher(folder + "/EupdateProfile.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EupdateProfileSuccess")) {
            request.setAttribute("result", "Update Profile Successfully!");
            request.getRequestDispatcher(folder + "/EupdateProfile.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EupdateProfileFail")) {
            request.setAttribute("result", "Update Profile Fail!");
            request.getRequestDispatcher(folder + "/EupdateProfile.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EnewOrderList")) {
            request.getRequestDispatcher(folder + "/EnewOrderList.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EchangePassword")) {
            request.getRequestDispatcher(folder + "/EchangePassword.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EchangePasswordSuccess")) {
            request.setAttribute("result", "Password is changed successfully!");
            request.getRequestDispatcher(folder + "/EchangePassword.jsp").forward(request, response);
        } else if (path.endsWith("/employee/EchangePasswordFail")) {
            request.setAttribute("result", "Old password is incorrect! Please Try Again!");
            request.getRequestDispatcher(folder + "/EchangePassword.jsp").forward(request, response);
        } else if (path.startsWith("/employee/EtakeOrder/")) {
            String[] data = path.split("/");
            String orderId = data[data.length - 1];
            ordDAO.setPhoneForOrder(phone, orderId);
            response.sendRedirect("/employee/EorderList");
        } else if (path.endsWith("/employee/EforgotPass")) {
            request.getRequestDispatcher(folder + "/EenterEmailForgotPass.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String folder = "/EmployeePage";
        String btnLogin = request.getParameter("btnLogin");
        String btnSearch = request.getParameter("btnSearch");
        String btnUpdateStatus = request.getParameter("btnUpdateStatus");
        String btnUpdateProfile = request.getParameter("btnUpdateProfile");
        String btnChangePassword = request.getParameter("btnChangePassword");
        String btnForgotPass = request.getParameter("btnForgot");
        EmployeeDAO empDAO = new EmployeeDAO();
        OrderDAO ordDAO = new OrderDAO();
        if (btnLogin != null && btnLogin.equals("login")) {
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            Employee emp = empDAO.login(phone, password);
            if (emp != null) {
                request.getSession().setAttribute("fullname", emp.getName());
                request.getSession().setAttribute("phone", phone);
                response.sendRedirect("/employee/EorderList");
            } else {
                response.sendRedirect("/employee/Elogin/fail");
            }
        }
        if (btnSearch != null && btnSearch.equals("Search")) {
            String employeePhone = request.getSession().getAttribute("phone") + "";
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            ResultSet searchList = ordDAO.searchOrderByDate(startDate, endDate, employeePhone);
            request.setAttribute("rs", searchList);
            request.setAttribute("startDate", startDate);
            request.setAttribute("endDate", endDate);
            request.getRequestDispatcher(folder + "/EorderList.jsp").forward(request, response);
        }
        if (btnUpdateStatus != null && btnUpdateStatus.equals("Update")) {
            String[] statusValues = request.getParameterValues("status");
            String orderId = request.getParameter("orderId");
            String selectedStatus = "";
            if (statusValues != null) {
                selectedStatus = statusValues[0];
            }
            int kq = ordDAO.updateOrderStatus(orderId, selectedStatus);
            if (kq != 0) {
                response.sendRedirect("/EorderDetail/updateSuccess/" + orderId);
            } else {
                response.sendRedirect("/EorderDetail/updateFail/" + orderId);
            }
        }
        if (btnUpdateProfile != null && btnUpdateProfile.equals("Update")) {
            int kq = 0;
            String txtPhone = request.getParameter("txtPhone");
            String txtName = request.getParameter("txtName");
            String txtEmail = request.getParameter("txtEmail");
            String txtAddress = request.getParameter("txtAddress");
            String txtBirthday = request.getParameter("txtBirthday");
            String txtCreateDay = request.getParameter("txtCreateDay");
            kq = empDAO.updateProfile(txtPhone, txtName, txtEmail, txtAddress, txtBirthday, txtCreateDay);
            if (kq != 0) {
                request.getSession().setAttribute("fullname", txtName);
                response.sendRedirect("/employee/EupdateProfileSuccess");
            } else {
                response.sendRedirect("/employee/EupdateProfileFail");
            }
        }
        if (btnChangePassword != null && btnChangePassword.equals("ChangePassword")) {
            String oldPassword = request.getParameter("txtOldPassword");
            String newPassword = request.getParameter("txtNewPassword");
            String phone = (String) request.getSession().getAttribute("phone");
            Employee correctOldPass = empDAO.login(phone, oldPassword);
            if (correctOldPass != null) {
                empDAO.changePassword(phone, newPassword);
                response.sendRedirect("/employee/EchangePasswordSuccess");
            } else {
                response.sendRedirect("/employee/EchangePasswordFail");
            }
        }
        if (btnForgotPass != null && btnForgotPass.equals(("forgotPass"))) {
            String pass = ramdomPassword();
            String email = request.getParameter("email");
            Employee c = empDAO.checkEmployeeEmail(email);
            if (c != null) {
                String to = email;
                String subject = "New Password";
                String body = "<html><body>"
                        + "<p>Dear " + c.getName() + " ,</p>"
                        + "<p>We've received a request to reset your password for your account. "
                        + "<p>Your new password is: " + pass + "</p>"
                        + "<p>Thanks,<br>"
                        + "Store team</p>"
                        + "</body></html>";
                empDAO.updateEmployeePass(pass, email);
                boolean result = sendEmail(to, subject, body);
                if (result) {
                    request.setAttribute("success", "Password has been updated. Please check your email!!!");
                    request.getRequestDispatcher(folder + "/Elogin.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher(folder + "/EenterEmailForgotPass.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Your email is not registed! Please try again!");
                request.getRequestDispatcher(folder + "/EenterEmailForgotPass.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private boolean sendEmail(String to, String subject, String body) {
        String host = "smtp.gmail.com";
        String port = "587";
        String username = "bookstoremanager607@gmail.com";
        String password = "fqmzbyeqrjiovabw";
        final String finalUsername = username;
        final String finalPassword = password;
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(finalUsername, finalPassword);
            }
        };
        Session s = Session.getInstance(props, authenticator);
        try {
            MimeMessage message = new MimeMessage(s);
            message.setFrom(new InternetAddress(username));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject, "UTF-8");
            message.setContent(body, "text/html; charset=UTF-8");
            Transport.send(message);
            return true;
        } catch (MessagingException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private String ramdomPassword() {
        Random rd = new Random();
        String c = "12356789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 9; i++) {
            int rdIndex = rd.nextInt(c.length());
            char rdChar = c.charAt(rdIndex);
            sb.append(rdChar);
        }
        return sb.toString();
    }
}
