package com.example.bai05.dao;

import com.example.bai05.Util.DBUtil;
import com.example.bai05.model.Employee;

import javax.sql.DataSource;
 import java.sql.Connection;
 import java.sql.PreparedStatement;
 import java.sql.ResultSet;
 import java.util.ArrayList;
 import java.util.List;



         public class EmployeeDAO {
 private DBUtil dbutil;
         public EmployeeDAO(DataSource dataSource) {
             dbutil = new DBUtil(dataSource);
             }
                 public List<Employee> getAllEmployees() {
             List<Employee> emplist = new ArrayList<>();
             String sql = "select * from employees";
             try {
                 Connection con = dbutil.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery();
                 while (rs.next()) {
                     Employee emp = new Employee();
                     emp.setId(rs.getInt("id"));
                     emp.setName(rs.getString("name"));
                     emp.setSalary(rs.getDouble("salary"));
                     emp.setDept_id(rs.getInt("department_id"));

                     emplist.add(emp);
//                     System.out.println(emp);
                     }

                 } catch (Exception e) {
                 throw new RuntimeException(e);
                 }

             return emplist;

             }

         public List<Employee> getAllByDepartment(int deptId) {
             List<Employee> list = new ArrayList<>();
             String sql = "SELECT * FROM employees WHERE department_id=?";
             try (Connection conn = dbutil.getConnection();
 PreparedStatement ps = conn.prepareStatement(sql)) {
                 ps.setInt(1, deptId);
                 try (ResultSet rs = ps.executeQuery()) {
                     while (rs.next()) {
                         list.add(new Employee(
                                 rs.getInt("id"),
                                 rs.getString("name"),
                                 rs.getInt("department_id"),
                                 rs.getDouble("salary")
                                 ));
                         }
                     }
                 } catch (Exception e) {
                 e.printStackTrace();
                 }
             return list;
             }

         public void save(Employee emp) {
             String sql = "INSERT INTO employees(name, salary, department_id) VALUES (?,?,?)";
             try (Connection conn = dbutil.getConnection();
 PreparedStatement ps = conn.prepareStatement(sql)) {
                 ps.setString(1, emp.getName());
                 ps.setDouble(2, emp.getSalary());
                 ps.setInt(3, emp.getDept_id());
                 ps.executeUpdate();
                 } catch (Exception e) {
                 e.printStackTrace();
                 }

             }

         public void update(Employee emp) {
             String sql = "UPDATE employees SET name=?, salary=?, department_id=? WHERE id=?";
             try (Connection conn = dbutil.getConnection();
 PreparedStatement ps = conn.prepareStatement(sql)) {
                 ps.setString(1, emp.getName());
                 ps.setDouble(2, emp.getSalary());
                 ps.setInt(3, emp.getDept_id());
                 ps.setInt(4, emp.getId());
                 ps.executeUpdate();
                 } catch (Exception e) {
                 e.printStackTrace();
                 }
             }

         public void delete(int id) {
             String sql = "DELETE FROM employees WHERE id=?";
             try (Connection conn = dbutil.getConnection();
 PreparedStatement ps = conn.prepareStatement(sql)) {
                 ps.setInt(1, id);
                ps.executeUpdate();
                 } catch (Exception e) {
                 e.printStackTrace();
                 }
             }

    }
