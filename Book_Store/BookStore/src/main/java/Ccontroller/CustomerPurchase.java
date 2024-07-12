/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Ccontroller;

import GCdao.CartDAO;
import GCdao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import GCmodel.Cart;
import GCmodel.Customer;

/**
 *
 * @author khang
 */
public class CustomerPurchase extends HttpServlet {

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
            out.println("<title>Servlet CustomerPurchase</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerPurchase at " + request.getContextPath() + "</h1>");
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
        CustomerDAO c = new CustomerDAO();
        CartDAO ca = new CartDAO();
        String phone = GCCookie.ECookie.getCustomerPhone(request, response);
        Customer customer = c.searchByPhone(phone);
        List<Cart> carts = ca.searchByPhone(phone);
        if (!carts.isEmpty()) {
            double sum = 0;
            for (int i = 0; i < carts.size(); i++) {
                sum += (double) carts.get(i).getQuantity() * carts.get(i).getBook().getRealPrice();
            }
            request.setAttribute("customer", customer);
            request.setAttribute("carts", carts);
            request.setAttribute("total", (double) Math.round(sum * 100) / 100);
            request.getRequestDispatcher("Cpurchase.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("error/Error.html").forward(request, response);
        }
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
        processRequest(request, response);
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
