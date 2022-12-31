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
			<label for="userName" class="form-label">Tên đăng nhập: (*)</label> <input
				class="form-control" type="text" name="userName"
				aria-describedby="userNameHelp" required>
			<div class="invalid-feedback">Vui lòng nhập Tên đăng nhập.</div>
		</div>
		<div class="mb-3">
			<label for="phone" class="form-label">Số điện thoại: (*)</label> <input
				class="form-control" type="text" name="phone" required>
			<div class="invalid-feedback">Vui lòng nhập Số điện thoại.</div>
		</div>
		<div class="mb-3">
			<label for="Email" class="form-label">Email: (*)</label> <input
				class="form-control" type="email" name="email" required>
			<div class="invalid-feedback">Vui lòng nhập Email.</div>
		</div>
		<div class="mb-3">
			<label for="password" class="form-label">Mật khẩu: (*)</label> <input
				class="form-control" type="password" name="password" required>
			<div class="invalid-feedback">Vui lòng nhập mật khẩu.</div>
		</div>
		<div class="mb-3">
			<button type="submit" class="btn btn-primary">Đăng ký</button>
		</div>
	</form>
</div>
<div class="invalid-feedback">
	<%=session.getAttribute("error_register")%>
</div>
<%@ include file="pageFile/footer.jsp"%>
<%-- <%@ include file="login.jsp"%> --%>
<%@ include file="pageFile/script_default.jsp"%>
<%@ include file="pageFile/end_html.html"%>
