<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Man Huynh
  Date: 9/28/2026
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
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


<div class="container">

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


    <div class="cart">

        <h3 class="cart-title">
            YOUR SHOPPING CART
        </h3>

        <c:if test="${empty cart.items}">
            <p class="empty-cart">
                Cart is empty!
            </p>
        </c:if>


        <c:if test="${not empty cart.items}">

            <table>

                <tr>
                    <th>Product ID</th>
                    <th>Product name</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Total</th>
                    <th>Remove</th>
                </tr>

                <c:forEach items="${cart.items}" var="i">

                    <tr>

                        <td>${i.book.id}</td>

                        <td>
                                ${i.book.title} - Tác giả: ${i.book.author}
                        </td>

                        <td>
                            1000
                        </td>

                        <td>
                                ${i.quantity}
                        </td>

                        <td>
                                ${i.quantity * 1000}
                        </td>

                        <td>
                            <form
                                    action="${pageContext.request.contextPath}/cart"
                                    method="post">

                                <input type="hidden"
                                       name="action"
                                       value="remove">

                                <input type="hidden"
                                       name="id"
                                       value="${i.book.id}">

                                <button type="submit">
                                    Remove
                                </button>

                            </form>
                        </td>

                    </tr>

                </c:forEach>


                <!-- TOTAL -->

                <tr class="cart-total">

                    <td colspan="4"></td>

                    <td>
                        Total price
                    </td>

                    <td>
                        (VNĐ) ${cart.total}
                    </td>

                </tr>

            </table>

            <div class="cart-actions">

                <a href="checkout.jsp">
                    Checkout
                </a>

                <a href="${pageContext.request.contextPath}/books">
                    Continue shopping
                </a>

            </div>

        </c:if>

    </div>

</div>
</body>
</html>
