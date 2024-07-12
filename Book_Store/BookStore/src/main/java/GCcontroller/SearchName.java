/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package GCcontroller;

import GCdao.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import GCmodel.Book;

/**
 *
 * @author khang
 */
public class SearchName extends HttpServlet {

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
            out.println("<title>Servlet GuestSearch</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestSearch at " + request.getContextPath() + "</h1>");
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
        BookDAO f = new BookDAO();
        String name = request.getParameter("txt");
        List<Book> books = f.searchByName(name);
        PrintWriter out = response.getWriter();
        if (!books.isEmpty()) {
            for (Book book : books) {
                String x = "";
                String b = "";
                if(book.getName().length()>15){
                    book.setName(book.getName().substring(0,14)+"...");
                }
                if (book.getSale() > 0) {
                    b = "<p class=\"original-price\">" + book.getPrice() + "</p>\n"
                            + "<p class=\"discounted-price\">" + book.getRealPrice() + "</p>\n";

                } else {
                    b = "<p class=\"discounted-price\">" + book.getPrice() + "</p>\n";
                }
                if (book.getStatus().equals("Sold Out")) {
                    x = " <button style=\"background-color: grey\">Sold Out</button>\n";
                } else {
                    x = " <button  onclick=\"addToCart('" + book.getId() + "')\"><ion-icon style=\"font-size: 22px;\" name=\"cart\"></ion-icon></button>";
                }
                out.println("   <div class=\"col-md-3\">\n" +
"                            <div class=\"best-seller\">"
                        + "\n"
                        + "                            <a href=\"#\">\n"
                        + "                                <img src=\"" + book.getImg() + "\" alt=\"\">\n"
                        + "                                <div class=\"name-book\">\n"
                        + "                                    <p>" + book.getName() + "</p>\n"
                        + "\n"
                        + "                                </div>\n"
                        + "                            </a>\n"
                        + "                            <div class=\"book-info\">\n"
                        + "                                <div class=\"price-section\">\n"
                        + "                                    <p>Price:</p>\n"
                        + b
                        + "                                </div><p>Units Sold: (15+)</p>\n"
                        + "\n"
                        + "                            </div>\n"
                        + "                            <div class=\"book-btn\">\n"
                        + x
                        + "                              <button onclick=\"viewBook('" + book.getId() + "')\">View</button>\n"
                        + "                            </div>\n"
                        + "\n"
                        + "                        </div></div>"
                );
            }
        } else {
            out.println("<style>.centered-text {\n"
                    + "  display: flex;\n"
                    + "  justify-content: center;\n"
                    + "  align-items: center; \n"
                    + "  height: 48vh;\n"
                    + "text-align:center"
                    + "} </style>"
                    + "<h1 class=\"centered-text col-12\">No book is found<h1>");
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
