<%--
  Created by IntelliJ IDEA.
  User: huynd
  Date: 9/11/2022
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
    <h2> Currency Converter</h2>
<form method="get" action="/convert">
    <label>Rate: </label><br/>
    <input type="text" name="rate" value="22000" placeholder="Rate" disabled/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" value="0" placeholder="USD"/><br/>
    <input type="submit" id="submit" value="Converter"/>
</form>
</body>
</html>
