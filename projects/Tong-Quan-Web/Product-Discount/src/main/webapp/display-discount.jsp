<%--
  Created by IntelliJ IDEA.
  User: huynd
  Date: 9/12/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display Discount</title>
</head>
<body>
    <h1>Product: ${requestScope.product}</h1>
    <h4>Price: ${requestScope.price}</h4>
    <h4>Discount: ${requestScope.discount}</h4>
    <h3>Discount Amount: ${requestScope.discountAmount}</h3>
    <h3>Price after discount: ${requestScope.discountPrice}</h3>
</body>
</html>
