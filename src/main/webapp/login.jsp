<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<%@ include file="pageFile/head.jsp"%>
<title>Đăng nhập | DTP000</title>
<%@ include file="pageFile/header.jsp"%>

<div class="container">
	<form action="./loginProccess" method="post">
		<div class="mb-3">
			<label for="userName" class="form-label">Tên đăng nhập hoặc
				Email: (*)</label> <input class="form-control" type="text" name="email"
				required>
			<div class="invalid-feedback">
				<%=session.getAttribute("error_email")%>
			</div>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Mật khẩu: (*)</label> <input
				class="form-control" type="password" name="password" required>
			<div class="invalid-feedback">
				<%=session.getAttribute("error_password")%>
			</div>
		</div>
		<div class="mb-3">
			<button type="submit" class="btn btn-primary">Đăng nhập</button>
		</div>
	</form>
</div>
<div class="invalid-feedback">
	<%=session.getAttribute("error_login")%>
</div>
<%@ include file="pageFile/footer.jsp"%>
<%-- <%@ include file="login.jsp"%> --%>
<%@ include file="pageFile/script_default.jsp"%>
<%@ include file="pageFile/end_html.html"%>
