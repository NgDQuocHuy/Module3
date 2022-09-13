<%--
  Created by IntelliJ IDEA.
  User: huynd
  Date: 9/13/2022
  Time: 8:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create new customer</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
    <h1>Create new Customer</h1>
    <p>
        <c:if test="${requestScope['message'] != null}">
            <span class="message">${requestScope['message']}</span>
        </c:if>
    </p>
    <p>
        <a href="/customers">Back to customer list</a>
    </p>
    <form method="post">
        <fieldset>
            <legend>Customer information</legend>
        </fieldset>
        <table>
            <tr>
                <td>
                    Name:
                </td>
                <td>
                    <input type="text" name="name" id="name">
                </td>
            </tr>
            <tr>
                <td>
                    Email:
                </td>
                <td>
                    <input type="text" name="email" id="email">
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td>
                <td>
                    <input type="text" name="address" id="address">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Create customer">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
