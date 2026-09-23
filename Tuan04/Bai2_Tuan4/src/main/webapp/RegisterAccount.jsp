<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 9/23/2026
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration Form</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .registration-card {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            border: 2px solid #4CAF50; /* Đường viền xanh lá bo ngoài như hình */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-size: 24px;
        }
        .row-two-columns {
            display: flex;
            gap: 15px;
        }
        .form-group {
            margin-bottom: 18px;
            flex: 1;
        }
        .form-group.full-width {
            width: 100%;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 14px;
            color: #333;
            background-color: #fafafa;
            outline: none;
            transition: border-color 0.2s;
        }
        input:focus, select:focus {
            border-color: #3b82f6;
            background-color: #fff;
        }
        .section-label {
            font-size: 14px;
            color: #555;
            margin-bottom: 8px;
            display: block;
            font-weight: 500;
        }
        .birthday-row {
            display: flex;
            gap: 15px;
        }
        .gender-row {
            display: flex;
            gap: 20px;
            align-items: center;
            margin-top: 5px;
        }
        .gender-option {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: #333;
            cursor: pointer;
        }
        .gender-option input[type="radio"] {
            margin: 0;
            width: 16px;
            height: 16px;
            accent-color: #3b82f6;
        }
        .btn-submit {
            width: 100%;
            padding: 14px;
            background-color: #1877f2; /* Màu xanh dương giống nút bấm của Facebook/Hình mẫu */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.2s;
        }
        .btn-submit:hover {
            background-color: #166fe5;
        }
    </style>
</head>
<body>

<div class="registration-card">
    <h2>User Registration Form</h2>

    <form action="${pageContext.request.contextPath}/registerform" method="POST">
        <!-- Hàng 1: First Name & Last Name -->
        <div class="row-two-columns">
            <div class="form-group">
                <input type="text" name="firstname" placeholder="First Name" required />
            </div>
            <div class="form-group">
                <input type="text" name="lastname" placeholder="Last Name" required />
            </div>
        </div>

        <!-- Hàng 2: Email -->
        <div class="form-group full-width">
            <input type="email" name="email" placeholder="Your Email" required />
        </div>

        <!-- Hàng 3: Password -->
        <div class="form-group full-width">
            <input type="password" name="password" placeholder="Password" required />
        </div>

        <!-- Hàng 4: Birthday -->
        <div class="form-group full-width">
            <label class="section-label">Birthday</label>
            <div class="birthday-row">
                <select name="month" required>
                    <option value="" disabled selected>Month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <!-- Thêm các tháng khác tại đây -->
                </select>
                <select name="day" required>
                    <option value="" disabled selected>Day</option>
                    <!-- Vòng lặp ví dụ cho ngày -->
                    <% for(int i=1; i<=31; i++) { %>
                    <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
                <select name="year" required>
                    <option value="" disabled selected>Year</option>
                    <% for(int i=2026; i>=1950; i--) { %>
                    <option value="<%= i %>"><%= i %></option>
                    <% } %>
                </select>
            </div>
        </div>

        <!-- Hàng 5: Gender -->
        <div class="form-group full-width">
            <label class="section-label">Gender</label>
            <div class="gender-row">
                <label class="gender-option">
                    <input type="radio" name="gender" value="female" required />
                    Female
                </label>
                <label class="gender-option">
                    <input type="radio" name="gender" value="male" />
                    Male
                </label>
            </div>
        </div>

        <!-- Nút bấm Sign Up -->
        <button type="submit" class="btn-submit">Sign Up</button>
    </form>
</div>

</body>
</html>

