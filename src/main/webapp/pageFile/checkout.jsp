<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Product_image" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<!--  -->

<%@ include file="head.jsp"%>
<title>${prd.getName()} | DTP000</title>
<%@ include file="header.jsp"%>

<!-- breadcrumb -->
<div class="bread-crumb">
	<div class="container">
		<div class="row">
			<div class="mt-2" style="-bs-breadcrumb-divider: '&gt;&gt;';"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Trang chủ</li>
					<li class="breadcrumb-item active text-primary" aria-current="page">Thanh toán</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb -->


<div id="thanh-toan">
        <div class="container mt-4">
            <div class="row">
                <h4 class="text-center">Thanh toán</h4>
            </div>
            <div class="row">
                
                        <form action="./checkOut" method="post">
                            <div class="mb-3">
                                <select class="form-select" name="ship_unit" aria-label="Default select example">
                                    <option selected>Vui lòng chọn đơn vị vận chuyển</option>
                                    <option value="1">Ninja Van</option>
                                    <option value="J&T">J&T</option>
                                    <option value="Viettel Post">Viettel Post</option>
                                    <option value="VNPOST">VNPOST</option>
                                    <option value="GHTK">GHTK</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Tên người nhận</label>
                                 <input class="form-control" type="text" name="full_name" value="${ad.getFullName() }" required>
                               
                            </div>
                            <div class="mb-3">
                                <label for="userName" class="form-label">Số điện thoại</label> 
                                <input class="form-control" type="text" value="${ad.getPhone()}" name="phone" required>
                                
                            </div>
                            <div class="mb-3">
                                <label for="userName" class="form-label">Địa chỉ</label> 
                                <input class="form-control" type="text" name="address" value="${ad.getAddress()}" required>
                            </div>
                            <div class="mb-3">
                                <label for="userName" class="form-label">Thành tiền</label> 
                                <input class="form-control" type="text" value="${totalPrice }" disabled>
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">Đăng nhập</button>
                            </div>
                        </form>
                   
            </div>
        </div>
    </div>


<%@ include file="footer.jsp"%>
<%@ include file="login.jsp"%>
<%@ include file="script_default.jsp"%>



<%@ include file="end_html.html"%>
