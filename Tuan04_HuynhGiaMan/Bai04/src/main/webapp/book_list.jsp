<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>IUH BOOKSTORE</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<!-- HEADER -->
<div class="header">

    <div class="logo">
        IUH BOOKSTORE
    </div>
    <div class="menu">
        <a href="#">HOME</a>
        <a href="#">EXAMPLES</a>
        <a href="#">SERVICES</a>
        <a href="#">PRODUCTS</a>
        <a href="#">CONTACT</a>
    </div>
</div>

<!-- MAIN -->
<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">

        <div class="about">
            <h3>ABOUT US</h3>

            <p>
                About us information will be here...
                <a href="#">Read More »</a>
            </p>
        </div>

        <div class="search">
            <h3>SEARCH SITE</h3>

            <input type="text">
        </div>

    </div>


    <!-- BOOK LIST -->
    <div class="book_container">

        <c:forEach items="${books}" var="b">

            <div class="book">

                <p>
                        ${b.title} - Tác giả: ${b.author}
                </p>

                <img
                        src="${pageContext.request.contextPath}/images/${b.imgbook}"
                        alt="${b.title}"
                >

                <p>Price: 1000$</p>

                <p>Quantity: 10</p>

                <a href="${pageContext.request.contextPath}/book?id=${b.id}">
                    Product details
                </a>

                <br>

                <form action="${pageContext.request.contextPath}/cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="${b.id}">
                    <button type="submit">Add to cart</button>
                </form>

            </div>

        </c:forEach>

    </div>

</div>

</body>
</html>