<%--
  Created by IntelliJ IDEA.
  User: Man Huynh
  Date: 9/28/2026
  Time: 9:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Checkout</title>

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
    <a href="${pageContext.request.contextPath}/books">
      PRODUCTS
    </a>
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

    <p class="shopping-cart-link">
      <a href="${pageContext.request.contextPath}/cart">
        Shopping cart (${cart.size})
      </a>
    </p>

  </div>


  <!-- CHECKOUT -->
  <div class="checkout">

    <div class="checkout-title">
      Checkout - Already registered?
      <a href="#">Login</a>
    </div>

    <form action="${pageContext.request.contextPath}/checkout"
          method="post">

      <table class="checkout-table">

        <tr>
          <td class="checkout-label">
            Fullname:
          </td>

          <td>
            <input type="text"
                   name="fullname"
                   class="checkout-input small">
          </td>
        </tr>


        <tr>
          <td class="checkout-label">
            Shipping address:
          </td>

          <td>
            <input type="text"
                   name="address"
                   class="checkout-input address">
          </td>
        </tr>


        <tr>
          <td class="checkout-label">
            Total price:
          </td>

          <td>
            <input type="text"
                   name="total"
                   value="${cart.total}"
                   class="checkout-input small"
                   readonly>
          </td>
        </tr>


        <tr>
          <td class="checkout-label">
            Payment method
          </td>

          <td class="payment-method">

            <label>
              <input type="radio"
                     name="payment"
                     value="paypal">
              Paypal
            </label>

            <label>
              <input type="radio"
                     name="payment"
                     value="atm">
              ATM Debit
            </label>

            <label>
              <input type="radio"
                     name="payment"
                     value="visa">
              Visa/Master card
            </label>

          </td>
        </tr>


        <tr>
          <td></td>

          <td class="checkout-buttons">

            <button type="submit">
              Save
            </button>

            <a href="${pageContext.request.contextPath}/cart">
              Cancel
            </a>

          </td>
        </tr>

      </table>

    </form>

  </div>

</div>

</body>
</html>
