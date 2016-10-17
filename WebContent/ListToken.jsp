<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Tokens Records</title>
</head>
<body>
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/whyq"
        user="user" password="password"
    />
     
    <sql:query var="listToken"   dataSource="${myDS}">
        SELECT * FROM tokens;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Tokens</h2></caption>
            <tr>
                <th>ID</th>
                <th>Menu Item</th>
                <th>Token State</th>
                <th>Quantity</th>
                <th>Menu Id</th>
            </tr>
            <c:forEach var="token" items="${listToken.rows}">
                <tr>
                    <td><c:out value="${token.token_id}" /></td>
                    <td><c:out value="${token.menu_item}" /></td>
                    <td><c:out value="${token.token_state}" /></td>
                    <td><c:out value="${token.token_quant}" /></td>
                     <td><c:out value="${token.menu_id}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>