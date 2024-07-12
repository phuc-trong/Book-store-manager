/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package GCdao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import GCmodel.Category;
import GCmodel.Book;

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
//        BookDAO f = new BookDAO();
//        List<Book> books = f.searchByCateID("b");
//        for (int i = 0; i < books.size(); i++) {
//            System.out.println(books.get(i).toString());
//        }
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
            ps.setString(2, book.getCategory().getId());
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

    public List<Book> getTopFourSeller() {
        List<Book> books = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.boo_id, COALESCE(SUM(od.quantity), 0) AS so_lan_dat\n"
                    + "FROM book f\n"
                    + "LEFT JOIN orderdetail od ON f.boo_id = od.boo_id\n"
                    + "where f.boo_status <> 'Deleted'\n"
                    + "GROUP BY f.boo_id\n"
                    + "order by so_lan_dat desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(searchByID(rs.getString(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return books;
    }

    public List<Book> getTopFourLastest() {
        List<Book> books = new ArrayList<>();
        try {
            String sql = "Select top(4) boo_id from Book\n"
                    + "where boo_status<>'Deleted'\n"
                    + "order by boo_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                books.add(searchByID(rs.getString(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return books;
    }

    public Category getCategory(String categoryID) {
        try {
            String sql = "select * from category  where cat_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryID);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Category(rs.getString(1), rs.getString(2), rs.getString(3));
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Book searchByID(String id) {
        try {
            String sql = "select * from Book  where boo_id = ? and boo_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Book(rs.getString(1),
                        getCategory(rs.getString(2)),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Book> getAll() {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book where boo_status<>'Deleted'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        getCategory(rs.getString(2)),
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

    public List<Book> searchByName(String name) {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book  where boo_name LIKE ? and boo_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        getCategory(rs.getString(2)),
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

    public List<Book> searchByCateID(String cateID) {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "select * from Book  where cat_id = ? and boo_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        getCategory(rs.getString(2)),
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
