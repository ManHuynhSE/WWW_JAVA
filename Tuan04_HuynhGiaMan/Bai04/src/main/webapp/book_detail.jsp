<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>${book.id}</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
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


    <div class="detail">

        <p class="detail-title">
            Product details:
            ${book.title} - Tác giả : ${book.author}
        </p>

        <img
                src="${pageContext.request.contextPath}/images/${book.imgbook}"
                alt="${book.title}"
        >

        <p>Price (VNĐ): 99000</p>
        <p>Quantity: 10</p>

        <a class="back"
           href="${pageContext.request.contextPath}/books">
            Back to Product List
        </a>

    </div>

</div>

</body>
</html>