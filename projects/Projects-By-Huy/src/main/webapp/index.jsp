<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
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