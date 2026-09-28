<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Man Huynh
  Date: 9/28/2026
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<p>
    <a href="cart">View Cart</a>
</p>

<div class="product-container">
    <c:forEach items="${products}" var="p">
        <div class="product-class">
            <b>${p.model}</b>
            <img src="${p.imgurl}" class="hinh">
            <div>Price: ${p.price}</div>
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="text" size="2" value="1" name="quantity"><br/>
                <input type="hidden" name="id" value="${p.id}">
                <input type="hidden" name="price" value="${p.price}">
                <input type="hidden" name="model" value="${p.model}">
                <input type="hidden" name="action" value="add">
                <input type="submit" name="addToCart" value="Add To Cart">
            </form>
            <a href="${pageContext.request.contextPath}/product?id=${p.id}">Product Detail</a>
        </div>
    </c:forEach>
</div>

</body>
</html>
