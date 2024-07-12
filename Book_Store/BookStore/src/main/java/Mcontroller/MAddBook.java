/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Mcontroller;

import Mdao.CategoryDAO;
import Mdao.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

import Mmodel.Book;

/**
 *
 * @author Admin
 */
public class MAddBook extends HttpServlet {

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
            out.println("<title>Servlet MAddBook</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MAddBook at " + request.getContextPath() + "</h1>");
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
            BookDAO dao = new BookDAO();
            String bookId = dao.getIDForNewBook();
            request.setAttribute("book_id", bookId);
            request.getRequestDispatcher("MaddBook.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("addBook" + ex);
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
        try {
            CategoryDAO categoryDao = new CategoryDAO();
            BookDAO bookDao = new BookDAO();
            String bookId = request.getParameter("book_id");
            String categoryId = categoryDao.getCategoryID(request.getParameter("category_name"));
            String bookName = request.getParameter("book_name");
            double price = Double.parseDouble(request.getParameter("price"));
            double sale = Double.parseDouble(request.getParameter("sale"));
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            String imageSrc = request.getParameter("imageSrc");
            String imageUrl = request.getParameter("imageUrl");
            Book book;
            if (imageUrl.length() > 0) {
                book = new Book(bookId, categoryId, bookName, price, sale, description, status, imageUrl);
            } else {
                book = new Book(bookId, categoryId, bookName, price, sale, description, status, imageSrc);
            }
            bookDao.add(book);
            response.sendRedirect("/MbookDetails?bid=" + bookId);
        } catch (Exception ex) {
            System.out.println("addBookPost" + ex);
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
