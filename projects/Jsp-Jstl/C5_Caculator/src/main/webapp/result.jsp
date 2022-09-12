<%--
  Created by IntelliJ IDEA.
  User: URIGOO
  Date: 12/09/2022
  Time: 10:30 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<html>
<head>
    <title>Result</title>
</head>
<body>
    <h1>Result</h1>

    ${requestScope.first_operand} ${requestScope.operator} ${requestScope.second_operand} = ${requestScope.result}
    <br/>
    <fmt:formatNumber value="${requestScope.first_operand}" type="currency"/> ${requestScope.operator} <fmt:formatNumber value="${requestScope.second_operand}" type="currency"/> = <fmt:formatNumber value="${requestScope.result}" type="currency"/>
    <br/>
    <fmt:formatNumber value="${requestScope.first_operand}" pattern="###,###,### VNĐ"/>
    <br/>
    <fmt:formatNumber type="number" pattern="(+84) ### ### ###" value="${requestScope.first_operand}" />

    <h6>Ngay tao</h6>
    <fmt:formatDate pattern="dd-MM-yyyy" type="both" value="${requestScope.date}" />
</body>
</html>
