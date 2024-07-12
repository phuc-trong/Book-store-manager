/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Edao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Emodel.Book;

/**
 *
 * @author khang
 */
public class BookDAO extends DBContext {

    /**
     * Test function
     *
     * @param args
     */
    public static void main(String[] args) {
        BookDAO f = new BookDAO();
        List<Book> books = f.searchByName("f");
        for (int i = 0; i < books.size(); i++) {
            System.out.println(books.get(i).toString());
        }
    }

    /**
     * check book is existed in book table before
     *
     * @param id
     * @return
     */
    public boolean isExisted(String id) {
        try {
            String sql = "select * from book  "
                    + "where boo_id  = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * add book to book table
     *
     * @param book
     */
    public void add(Book book) {
        try {
            String sql = "insert into Book values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, book.getId());
            ps.setString(2, book.getCategoryId());
            ps.setString(3, book.getName());
            ps.setDouble(4, book.getPrice());
            ps.setDouble(5, book.getSale());
            ps.setString(6, book.getDescription());
            ps.setString(7, book.getStatus());
            ps.setString(8, book.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update book which has before from book table
     *
     * @param book
     */
    public void update(Book book) {
        try {
            String sql = "update Book set cat_id = ?, "
                    + "boo_name = ?, "
                    + "boo_price = ? , "
                    + "boo_sale = ? , "
                    + "boo_desription =?, "
                    + "boo_status = ?, "
                    + "boo_img =? "
                    + "where boo_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(8, book.getId());
            ps.setString(1, book.getCategoryId());
            ps.setString(2, book.getName());
            ps.setDouble(3, book.getPrice());
            ps.setDouble(4, book.getSale());
            ps.setString(5, book.getDescription());
            ps.setString(6, book.getStatus());
            ps.setString(7, book.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update book status by id in book table
     *
     * @param id
     * @param status
     */
    public void updateStatus(String id, String status) {
        try {
            String sql = "update Book set"
                    + "boo_status = ?, "
                    + "where boo_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * remove book which has before from book table
     *
     * @param id
     */
    public void remove(String id) {
        try {
            String sql = "delete Employee where boo_id  = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * get all book from book table
     *
     * @return
     */
    public List<Book> getAll() {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search book by name from book table
     *
     * @param name
     * @return
     */
    public List<Book> searchByName(String name) {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book  where boo_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search by cateID from book table
     *
     * @param cateID
     * @return
     */
    public List<Book> searchByCateID(String cateID) {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book  where cat_id = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
