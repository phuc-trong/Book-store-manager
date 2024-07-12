/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Ccontroller;

import GCdao.CustomerDAO;
import GCdao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import GCmodel.Customer;
import GCmodel.Order;
import GCmodel.OrderDetail;

/**
 *
 * @author khang
 */
public class CustomerUpdateHistoryDetail extends HttpServlet {

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
            out.println("<title>Servlet ControllerUpdateHistoryDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerUpdateHistoryDetail at " + request.getContextPath() + "</h1>");
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
        String orderID = request.getParameter("id");
        OrderDAO o = new OrderDAO();
        List<OrderDetail> orders = o.getOrderDetail(orderID);
        Order order = o.getOrderByID(orderID);
        CustomerDAO c = new CustomerDAO();
        Customer cus = c.searchByPhone(order.getCus_phone());
        PrintWriter out = response.getWriter();
        String s
                = "                <div class=\"header\">\n"
                + "                    <div class=\"name-tittle\">\n"
                + "                        Order Information\n"
                + "                    </div>\n"
                + "                </div>\n"
                + "                <!-- Orders Book Information Table -->\n"
                + "\n"
                + "                <!-- End of Book Order Information Orders -->\n"
                + "                <div class=\"history-order row\">\n"
                + "                    <div class=\"col-md-8\">\n"
                + "                        <div class=\"orders-table\">\n"
                + "                            <h2 style=\"font-weight: 600; text-align: center;\" class=\"order-list\">Order Details</h2>\n"
                + "                            <table>\n"
                + "                                <thead  style=\"text-align: center\">\n"
                + "                                    <tr >\n"
                + "                                        <th>Book</th>\n"
                + "                                        <th>Unit Price</th>\n"
                + "                                        <th>Quantity</th>\n"
                + "                                    </tr>\n"
                + "                                </thead>\n"
                + "\n"
                + "                                <tbody>";
        for (OrderDetail od : orders) {
            s += "  <tr>\n"
                    + "                                            <td>" + od.getBookName() + "</td>\n"
                    + "                                            <td>" + od.getPrice() + "$</td>\n"
                    + "                                            <td>" + od.getQuantity() + "</td>\n"
                    + "                                        </tr>";
        }
        s += "       </tbody>\n"
                + "                            </table>\n"
                + "                            <div class=\"total-order\">Total Order: " + order.getTotal() + "$</div>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "                    <div style=\"height: 340px; background-color: #c7c6c6;\" class=\"col-md-4 order-info\">\n"
                + "                        <h2 style=\"font-weight: 600; padding-bottom: 10px; text-align: center;\" class=\"customer-info\">\n"
                + "                            Invoice Information</h2>\n"
                + "                        <hr>\n"
                + "                        <span>\n"
                + "                            <p><span class=\"bold-numbers\">Order ID: </span>  " + order.getId() + "</p>\n"
                + "                            <p><span class=\"bold-numbers\">Order Status: </span>  " + order.getStatus() + " </p>\n"
                + "                            <p><span class=\"bold-numbers\">Payment Methods: </span>  " + order.getPay() + " </p>\n"
                + "                            <p><span class=\"bold-numbers\">Order Date: </span> " + order.getOrderDate() + " </p>\n"
                + "                            <p><span class=\"bold-numbers\">Address: </span>" + cus.getAddress() + " </p>\n"
                + "                            <p><span class=\"bold-numbers\">Note: </span> " + order.getNote() + "</p>\n"
                + "                        </span>\n"
                + "                    </div>\n"
                + "                </div> ";
        if (order.getStatus().equals("Waiting") && order.getPay().equals("Banking")) {
            s += " <div style=\"display: flex;\">\n"
                    + "                            <div style=\"width: 450px; padding: 20px; background-color: #c2c2c2; margin-top: 20px; border-radius: 5px;\">\n"
                    + "                                <p style=\"margin-top: 5px; font-size: 20px; font-weight: 500;\">Please pay to proceed with the order\n"
                    + "                                </p><p style=\"font-size: 20px; font-weight: 500;\" >(If you have already paid, please skip)</p>\n"
                    + "                                <p style=\"font-size: 20px; font-weight: 500;\">Scan the QR code below:</p>\n"
                    + "                                <img style=\"width: 200px; margin-top: 20px;\" src=\"../img/qrcode.jpg\" alt=\"\">\n"
                    + "                            </div>\n"
                    + "\n"
                    + "                            <div class=\"cancel-order\">\n"
                    + "                                <button onclick=\"cancelOrder('" + order.getId() + "')\">Cancel Order</button>\n"
                    + "                            </div>\n"
                    + "                        </div>";
        } else if (order.getStatus().equals("Waiting")) {
            s += "<div style=\"display: flex;\">\n"
                    + "                            <div  class=\"cancel-order\">\n"
                    + "                                <button style=\"margin:0\" onclick=\"cancelOrder('" + order.getId() + "')\">Cancel Order</button>\n"
                    + "                            </div>\n"
                    + "                        </div>";
        }
        out.print(s);
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
