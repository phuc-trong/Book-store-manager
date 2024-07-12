/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Ccontroller;

import GCdao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import GCmodel.Order;

/**
 *
 * @author khang
 */
public class CustomerUpdateHistory extends HttpServlet {

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
            out.println("<title>Servlet CustomerUpdateHistory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerUpdateHistory at " + request.getContextPath() + "</h1>");
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
        String phone = GCCookie.ECookie.getCustomerPhone(request, response);
        OrderDAO or = new OrderDAO();
        List<Order> orders = or.getAll(phone);
        PrintWriter out = response.getWriter();
        if (orders != null) {
            for (Order o : orders) {
                String a = "";
                String b = "";
                if (o.getStatus().equals("Waiting")) {
                    a = "<button onclick=\"cancelOrder('" + o.getId() + "')\">Cancel</button>\n";
                }
                if (o.getStatus().equals("Waiting") || o.getStatus().equals("Preparing")) {
                    b = "<div style=\"color: #0397d1;\" class=\"status\">" + o.getStatus() + "</div>\n";
                }else
                if (o.getStatus().equals("Cancelled") || o.getStatus().equals("Rejected")) {
                    b = "<div style=\"color: #C21010;\" class=\"status\">" + o.getStatus() + "</div>\n";
                } else {
                    b = "<div style=\"color: #1ec708;\" class=\"status\">" + o.getStatus() + "</div>\n";
                }
                out.println("  <tr>\n"
                        + "                                        <td>" + o.getId() + "</td>\n"
                        + "                                        <td class=\"status\">\n"
                        + b
                        + "                                        <td>" + o.getOrderDate() + "</td>\n"
                        + "                                        <td>" + o.getPay() + "</td>\n"
                        + "                                        <td>" + o.getTotal() + "$</td>\n"
                        + "                                        <td>\n"
                        + "                                            <button onclick=\"viewOrder('" + o.getId() + "')\">\n"
                        + "                                                View\n"
                        + "                                            </button>\n"
                        + a
                        + "                                        </td>\n"
                        + "                                    </tr>");
            }
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
