<%--
  Created by IntelliJ IDEA.
  User: huynd
  Date: 9/12/2022
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
    <title>Display Discount</title>
</head>
<body>
    <h1>Product: ${requestScope.product}</h1>
    <h4>Price: <fmt:formatNumber value="${requestScope.price}" pattern="###,###,### VND"/></h4>
    <h4>Discount: ${requestScope.discount}</h4>
    <h3>Discount Amount: <fmt:formatNumber value="${requestScope.discountAmount}" pattern="###,###,### VND"/></h3>
    <h3>Price after discount: <fmt:formatNumber value="${requestScope.discountPrice}" pattern="###,###,### VND"/></h3>
</body>
</html>
