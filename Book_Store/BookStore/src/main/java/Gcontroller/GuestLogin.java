/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Gcontroller;

import GCdao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author khang
 */
public class GuestLogin extends HttpServlet {

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
            out.println("<title>Servlet GuestLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestLogin at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Glogin.jsp").forward(request, response);
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
        CustomerDAO c = new CustomerDAO();
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        if (c.isExisted(phone, password)) {
            switch (c.searchByPhone(phone).getStatus()) {
                case "Blocked":
                    response.setStatus(HttpServletResponse.SC_CONFLICT);
                    response.getWriter().println("Your account is blocked since rejected many orders. If there is misunderstanding, please contact to the manager.");
                    return;
                case "Deleted":
                    response.setStatus(HttpServletResponse.SC_CONFLICT);
                    response.getWriter().println("Your account is banned");
                    return;
                default:
                    Cookie cookie = new Cookie("phone", phone);
                    cookie.setMaxAge(-1);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    response.sendRedirect("/customer/Chome");
                    return;
            }
        } else {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            response.getWriter().println("Wrong phone number or password");
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
