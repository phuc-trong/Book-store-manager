/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Gcontroller;

import GCdao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import GCmodel.Customer;

/**
 *
 * @author khang
 */
public class GuestRegister extends HttpServlet {

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
            out.println("<title>Servlet GuestRegister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestRegister at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Gregister.jsp").forward(request, response);
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
        CustomerDAO cus = new CustomerDAO();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        PrintWriter out = response.getWriter();
        Date date = Date.valueOf(birthday);

        if (!cus.isPhoneExisted(phone) && !cus.isEmailExisted(email)) {
            Customer c = new Customer(phone, name, email, address, date);
            cus.add(c, password);
        } else if (cus.isPhoneExisted(phone)) {
            response.setStatus(HttpServletResponse.SC_CONFLICT);

            out.print("Phone number is already exists");
        } else {
            response.setStatus(HttpServletResponse.SC_CONFLICT);

            out.print("Email is already exists");
        }
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
