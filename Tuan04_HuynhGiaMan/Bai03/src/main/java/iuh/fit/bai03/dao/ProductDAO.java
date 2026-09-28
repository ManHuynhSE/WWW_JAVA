package iuh.fit.bai03.dao;

import iuh.fit.bai03.model.Product;
import iuh.fit.bai03.util.DBUtil;
import jakarta.annotation.Resource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private DBUtil dbUtil;

    public ProductDAO(DataSource dataSource) {
        this.dbUtil = new DBUtil(dataSource);
    }

    public List<Product> getALl() {
        List<Product> result = new ArrayList<>();
        String sql = "Select * from Products";
        try(Connection conn = dbUtil.getConnection();
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
        ) {
            while(rs.next()) {
                Integer id = rs.getInt("ID");
                String model = rs.getString("MODEL");
                Double price = rs.getDouble("PRICE");
                Integer quantity = rs.getInt("QUANTITY");
                String image = rs.getString("IMGURL");
                String description = rs.getString("DESCRIPTION");
                Product p = new Product(id,model,price,quantity,description,image);
                result.add(p);
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public Product getProduct(int id) {
        String sql = "Select * from Products where ID=?";
        try(Connection conn = dbUtil.getConnection();
            PreparedStatement preparedStatement = conn.prepareStatement(sql);

        ) {
           preparedStatement.setInt(1,id);
           try(ResultSet rs = preparedStatement.executeQuery()){
               if(rs.next()){
                   Integer prid = rs.getInt("ID");
                   String model = rs.getString("MODEL");
                   Double price = rs.getDouble("PRICE");
                   Integer quantity = rs.getInt("QUANTITY");
                   String image = rs.getString("IMGURL");
                   String description = rs.getString("DESCRIPTION");
                  return new Product(prid,model,price,quantity,description,image);
               }
           }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }


}
