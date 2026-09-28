<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%-- Khai báo thư viện JSTL chuẩn cho Jakarta EE 10 / Tomcat 10 --%>
<html>
<head>
    <title>Account List</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            margin: 0;
            padding: 40px 20px;
        }
        .list-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 900px; /* Mở rộng chiều rộng để hiển thị dạng bảng */
            border: 2px solid #4CAF50; /* Giữ nguyên đường viền xanh lá đồng bộ */
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
            font-size: 24px;
        }
        /* Style cho bảng danh sách */
        .account-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            font-size: 14px;
        }
        .account-table th {
            background-color: #f8f9fa;
            color: #555;
            font-weight: 600;
            text-align: left;
            padding: 12px;
            border-bottom: 2px solid #e0e0e0;
        }
        .account-table td {
            padding: 12px;
            border-bottom: 1px solid #eeeeee;
            color: #333;
        }
        /* Hiệu ứng đổi màu khi di chuột qua các dòng */
        .account-table tr:hover {
            background-color: #f9f9f9;
        }
        /* Định dạng cột giới tính */
        .gender-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            text-transform: capitalize;
            font-weight: 500;
            background-color: #e2e8f0;
            color: #4a5568;
        }
        .btn-add {
            display: inline-block;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #1877f2; /* Màu xanh dương đồng bộ nút bấm trước */
            color: white;
            border-radius: 6px;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .btn-add:hover {
            background-color: #166fe5;
        }
        .actions-bar {
            display: flex;
            justify-content: flex-end;
            margin-top: 15px;
        }
    </style>
</head>
<body>

<div class="list-container">
    <h2>Registered Accounts List</h2>

    <table class="account-table">
        <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Birthday</th>
            <th>Gender</th>
        </tr>
        </thead>
        <tbody>
        <%-- Duyệt qua danh sách tài khoản bằng thẻ c:forEach --%>
        <c:forEach var="acc" items="${accounts}">
            <tr>
                <td>${acc.firstname}</td>
                <td>${acc.lastname}</td>
                <td>${acc.email}</td>
                <td>${acc.dateOfBirth}</td>

            </tr>
        </c:forEach>

        <%-- Hiển thị thông báo nếu danh sách rỗng --%>
        <c:if test="${empty accounts}">
            <tr>
                <td colspan="5" style="text-align: center; color: #999; padding: 30px;">
                    No accounts found.
                </td>
            </tr>
        </c:if>
        </tbody>
    </table>

    <!-- Nút quay lại trang thêm mới tài khoản -->
    <div class="actions-bar">
        <a href="register.jsp" class="btn-add">+ Add New Account</a>
    </div>
</div>

</body>
</html>
