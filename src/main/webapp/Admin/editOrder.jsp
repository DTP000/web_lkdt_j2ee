<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Model.Order" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="UpdateOrder?categoryId=${rs.getId()}" method="post">
		
		<input type="text" name="name" value="${ rs.getFullName()}"><br><br>
		<input type="text" name="phone" value="${ rs.getPhone()}"><br><br>
		<input type="text" name="address" value="${ rs.getAddress()}"><br><br>
		<input type="text" name="uid" value="${ rs.getUid()}"><br><br>
		<input type="submit" value="Send">
	</form>
	<h2>${name}</h2>
</body>
</html>