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
    <title>Deleting customer</title>
</head>
<body>
    <h1>Delete customer</h1>
    <p>
        <a href="/customers">Back to customer list</a>
    </p>
    <form method="post">
        <h3>Are you sure ?</h3>
        <fieldset>
            <legend>Customer information</legend>
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
                <tr>
                    <td>
                        <input type="submit" value="Delete customer">
                    </td>
                    <td>
                        <a href="/customers">Back to customer list</a>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</body>
</html>
