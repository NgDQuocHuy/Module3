<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
    <h2>Currency Converter</h2>
    <form method="post" action="converter.jsp">
        <label>Rate: </label><br/>
        <input type="text" name="rate" value="22000" placeholder="Rate"/><br/>
        <label>USD: </label><br/>
        <input type="text" name="usd" value="0" placeholder="USD"/><br/>
        <input type="submit" id="submit" value="Converter"/>
    </form>
</body>
</html>