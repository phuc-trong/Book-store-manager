/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Mcontroller;


import Mdao.CustomerDAO;
import Mdao.OrderDAO;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import Mmodel.Customer;
import Mmodel.Order;


/**
 *
 * @author Admin
 */
public class MCustomerDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");

            out.println("<title>Servlet MCustomerDetails</title>");

            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MCustomerDetails at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            CustomerDAO customerDao = new CustomerDAO();
            OrderDAO orderDao = new OrderDAO();
            List<Order> listOrderCus = new ArrayList<>();

            String phone = request.getParameter("bid");
            request.setAttribute("phoneCus", phone);
            Customer infoCustomer = customerDao.getCustomerDetail(phone);
            request.setAttribute("infoCus", infoCustomer);
            String dateBirthday = formatTime(infoCustomer.getBirthday());
            String dateCreate = formatTime(infoCustomer.getCreate_date());
            request.setAttribute("birthday", dateBirthday);
            request.setAttribute("dateCreate", dateCreate);
            request.setAttribute("statusAcc", infoCustomer.getCus_status());

            listOrderCus = orderDao.getOrderHistory(phone);
            request.setAttribute("historyOrder", listOrderCus);

            request.getRequestDispatcher("McustomerDetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public String formatTime(Date time) {
        SimpleDateFormat outputFormat = new SimpleDateFormat("MM/dd/yyyy");
        Date date = time;
        String formatted = outputFormat.format(date);
        return formatted;

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
