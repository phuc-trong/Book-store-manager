/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Mdao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Mmodel.Book;


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
        // List<Book> books = f.searchByName("b");
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
            String sql = "update Book set cat_id = ?, \n"
                    + "boo_name = ?, \n"
                    + "boo_price = ? , \n"
                    + "boo_sale = ? , \n"
                    + "boo_description =?, \n"
                    + "boo_status = ?, \n"
                    + "boo_img =? \n"
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

    public Book getBookDetails(String id) {
        try {
            String sql = "SELECT f.boo_id, f.boo_name, f.boo_price, f.boo_sale, f.boo_description, f.boo_status, f.boo_img, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered, c.cat_name, c.cat_id\n"
                    + "FROM Book f\n"
                    + "LEFT JOIN OrderDetail od ON f.boo_id = od.boo_id\n"
                    + "LEFT JOIN Category c ON f.cat_id = c.cat_id\n"
                    + "where f.boo_id = ?\n"
                    + "GROUP BY f.boo_id, f.boo_name, f.boo_price, f.boo_sale, f.boo_description, f.boo_status, f.boo_img, c.cat_name, c.cat_id";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getIDForNewBook() {
        try {
            String maxID;
            String sql = "select max(boo_id) from Book";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            maxID = rs.getString(1);
            String prefix = maxID.substring(0, 4); // "FOOD"
            String numberPart = maxID.substring(4); // "016"
            int number = Integer.parseInt(numberPart); // 16
            number++; // Tăng giá trị lên một đơn vị
            String newID = prefix + String.format("%03d", number); // "FOOD017"
            return newID;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Book> getListBestSeller() {
        try {
            List<Book> listBestSeller = new ArrayList<>();
            String sql = "SELECT TOP 8 f.boo_id, f.boo_name, f.boo_img, f.boo_price, f.boo_sale, f.boo_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Book f\n"
                    + "LEFT JOIN OrderDetail od ON f.boo_id = od.boo_id\n"
                    + "WHERE f.boo_status != 'Deleted'\n"
                    + "GROUP BY f.boo_id, f.boo_name, f.boo_price, f.boo_sale, f.boo_img, f.boo_status\n"
                    + "ORDER BY total_quantity_ordered DESC;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listBestSeller.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return listBestSeller;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Book> getListMenu() {
        try {
            List<Book> listMenu = new ArrayList<>();
            String sql = "SELECT f.boo_id, f.boo_name, f.boo_img, f.boo_price, f.boo_sale, f.cat_id, f.boo_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Book f\n"
                    + "LEFT JOIN OrderDetail od ON f.boo_id = od.boo_id\n"
                    + "WHERE f.boo_status != 'Deleted'\n"
                    + "GROUP BY f.boo_id, f.boo_name, f.boo_img, f.boo_price, f.boo_sale, f.cat_id, f.boo_status";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listMenu.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            return listMenu;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Book> getListSuggest(String cateId) {
        List<Book> list = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.boo_id, f.boo_name, f.boo_img, f.boo_price, f.boo_sale, f.boo_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Book f\n"
                    + "LEFT JOIN OrderDetail od ON f.boo_id = od.boo_id\n"
                    + "WHERE f.cat_id = ? AND f.boo_status != 'Deleted'\n"
                    + "GROUP BY f.boo_id, f.boo_name, f.boo_price, f.boo_sale, f.boo_img, f.boo_status\n"
                    + "order by(total_quantity_ordered) desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteBook(String bookId) {
        try {
            String sql = "update Book set boo_status = 'Deleted' where boo_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, bookId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Book getBookUpdate(String id) {
        try {
            String sql = "select a.boo_id, a.boo_name, a.boo_price, a.boo_sale, a.boo_description, a.boo_status, a.boo_img, b.cat_name, b.cat_id from Book a\n"
                    + "join Category b on a.cat_id=b.cat_id\n"
                    + "where boo_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Book(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateBook(Book book) {
        try {
            String sql = "UPDATE Book\n"
                    + "SET cat_id = ?, \n"
                    + "    boo_name = ?, \n"
                    + "    boo_price = ?, \n"
                    + "    boo_sale = ?,  \n"
                    + "    boo_description = ?,\n"
                    + "    boo_status = ?,\n"
                    + "    boo_img = ? \n"
                    + "WHERE boo_id = ?";
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
}
