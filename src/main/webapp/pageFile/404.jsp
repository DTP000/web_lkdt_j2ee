<%@ page language="java" contentType="text/html"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%@ include file="head.jsp" %>
<title>404 | DTP000</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Maven+Pro:400,900">
<link rel="stylesheet" href="./assets/css/style_404.css">
<%@ include file="header.jsp" %>

<div id="notfound">
    <div class="notfound">
        <div class="notfound-404">
            <h1>404</h1>
        </div>
        <h2>Trang không tìm thấy!</h2>
        <p>Trang bạn đang tìm kiếm đang tìm kiếm đã bị xoá, đổi tên, hoặc tạm thời không hoạt động</p>
        <a href="./home">Trở về trang chủ</a>
    </div>
</div>

<%@ include file="footer.jsp" %>
<%@ include file="login.jsp" %>
<%@ include file="script_default.jsp" %>
<%@ include file="js_index.jsp" %>
<%@ include file="end_html.html" %>
