<%--
  Created by IntelliJ IDEA.
  User: huynd
  Date: 9/12/2022
  Time: 12:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<style type="text/css">
    .login {
        height: 180px;
        width: 260px;
        margin: 0;
        padding: 10px;
        border: 1px solid #CCC;
    }
    .login input {
        padding: 5px;
        margin: 5px;
    }
</style>
<body>
<form class="login" method="get" action="/login">
    <h2>Login</h2>
    <input type="text" name="username" size="30" placeholder="Username"/>
    <input type="password" name="password" size="30" placeholder="Password"/>
    <input type="submit" value="Sign in"/>
</form>
</body>
</html>
