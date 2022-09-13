<%--
  Created by IntelliJ IDEA.
  User: huynd
  Date: 9/13/2022
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>View customer</title>
</head>
<body>
    <h1>View details</h1>
    <p>
        <a href="customers">Back to customer list</a>
    </p>
    <table>
        <tr>
            <td>
                Name:
            </td>
            <td>
                <input value="${requestScope['customer'].getName()}" disabled>
            </td>
        </tr>
        <tr>
            <td>
                Email:
            </td>
            <td>
                <input value="${requestScope['customer'].getEmail()}" disabled>
            </td>
        </tr>
        <tr>
            <td>
                Address:
            </td>
            <td>
                <input value="${requestScope['customer'].getAddress()}" disabled>
            </td>
        </tr>
    </table>
</body>
</html>
