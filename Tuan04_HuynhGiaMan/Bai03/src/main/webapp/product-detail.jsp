<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Man Huynh
  Date: 9/28/2026
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<h2>Product Detail</h2>
<c:if test="${not empty product}">
    <ul>
        <li>Id: ${product.id}</li>
        <li>Model: ${product.model}</li>
        <li>Description: ${product.description}</li>
        <li>Quantity: ${product.quantity}</li>
        <li>Price: ${product.price}</li>
        <img src="${product.imgurl}"
             alt="${product.model}" width="150"/>
        <br/>
    </ul>
</c:if>

<p>
    <a href="${pageContext.request.contextPath}/product">Back to Product List</a>
</p>
</body>
</html>
