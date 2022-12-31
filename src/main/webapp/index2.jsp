<%@ page language="java" contentType="text/html"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%@ include file="pageFile/head.jsp" %>
<title>Trang chủ | DTP000</title>
<%@ include file="pageFile/header.jsp" %>
<%@ include file="pageFile/slider.jsp" %>
<%@ include file="pageFile/banner.jsp" %>

<!-- jsp san pham moi -->
<%@ include file="pageFile/product_carousel.jsp" %>

<!-- jsp san pham noi bat -->
<%@ include file="pageFile/hot_prd.jsp" %>

<!-- phần ads -->
    <div class="container-md mt-5">
        <div class="row">
            <div class="col-md-12">
                <img class="img-fluid" src="./assets/img/banner_qc.jpg" alt="">
            </div>
        </div>
    </div>
<!-- end phần ads -->

<%@ include file="pageFile/cam_ket.jsp" %>



<%@ include file="pageFile/footer.jsp" %>
<%@ include file="pageFile/login.jsp" %>
<%@ include file="pageFile/register.jsp" %>
<%@ include file="pageFile/script_default.jsp" %>
<%@ include file="pageFile/js_index.jsp" %>
<%@ include file="pageFile/end_html.html" %>
