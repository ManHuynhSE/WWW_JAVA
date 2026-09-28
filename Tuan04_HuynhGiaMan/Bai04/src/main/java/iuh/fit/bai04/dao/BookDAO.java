package iuh.fit.bai04.dao;

import iuh.fit.bai04.model.Book;
import iuh.fit.bai04.util.DBUtil;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    private DBUtil dbUtil;
    public BookDAO(DataSource dataSource) {
        this.dbUtil = new DBUtil(dataSource);
    }

    public List<Book> getALl() {
        List<Book> rs = new ArrayList<>();
        Connection conn = dbUtil.getConnection();
        String sql = "select * from BOOKS";
        try(
                Statement stmt = conn.createStatement();
                ResultSet resultSet = stmt.executeQuery(sql);
                ){
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("tittle");
                String author = resultSet.getString("author");
                String imgbookRaw = resultSet.getString("imgbook");
                String imgbook = "";
                for(Character c: imgbookRaw.toCharArray()) {
                    if(c!='_') {
                        imgbook+=c;
                    }
                }
                rs.add(new Book(id,title,author,imgbook));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return rs;
    }
    public Book getBook(int id) {
        Connection conn = dbUtil.getConnection();
        String sql = "select * from BOOKS where id=?";
        try(
                PreparedStatement stmt = conn.prepareStatement(sql);
//                ResultSet resultSet = stmt.executeQuery(sql);
        ){
            stmt.setInt(1,id);
            try(
                    ResultSet resultSet = stmt.executeQuery();
                    ){
                if(resultSet.next()) {
                    int idBook = resultSet.getInt("id");
                    String title = resultSet.getString("tittle");
                    String author = resultSet.getString("author");
                    String imgbookRaw = resultSet.getString("imgbook");
                    String imgbook = "";
                    for(Character c: imgbookRaw.toCharArray()) {
                        if(c!='_') {
                            imgbook+=c;
                        }
                    }
                    return new Book(idBook,title,author,imgbook);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
