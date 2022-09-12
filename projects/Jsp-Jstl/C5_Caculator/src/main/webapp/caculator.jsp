<%--
  Created by IntelliJ IDEA.
  User: URIGOO
  Date: 12/09/2022
  Time: 10:11 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Simple Caculator</h1>
    <form action="/caculator" method="post">
        <label>First Operand</label> <input name="first_operand" />
        <label>Operator</label> <select name="operator">
            <option value="+"> Add</option>
            <option value="-"> Sub</option>
            <option value="*"> Mul</option>
            <option value="/"> Div</option>
        </select>
        <label>Second Operand</label> <input name="second_operand" />
        <button type="submit">Caculate</button>
    </form>
</body>
</html>
