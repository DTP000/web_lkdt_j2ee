<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<%@ include file="head.jsp"%>
<title><c:out value="${query}"/> | DTP000</title>
<!--  -->
<%@ include file="header.jsp"%>

<!-- breadcrumb -->
<div class="bread-crumb">
	<div class="container">
		<div class="row">
			<div class="mt-2" style="-bs-breadcrumb-divider: '&gt;&gt;';"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Trang chủ</li>
					<li class="breadcrumb-item">Tìm kiếm</li>
					<li class="breadcrumb-item active text-primary" aria-current="page">${name}</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb -->

<!-- Chuyên mục sản phẩm -->
    <div class="search">
        <div class="container">

            <div class="row">
                <div class="my-3">
                    <p>Có <b>${num}</b> kết quả tìm kiếm cho <b><c:out value="${query}"/></b></p>
                </div>
            </div>

			<!-- pagination -->
            <div class="d-flex justify-content-center" id="pagi">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                      <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item active"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
            </div>
            <!-- end pagination -->
            
            <div class="row mt-4">
            <c:forEach items="${prdList}" var="prdC1">
                <div class="col-md-3 col-sm-6 col-6">
                    <div class="row">
                        <div class="card h-100 product">
                            <a href="./product?id=${prdC1.getId()}&q=${prdC1.getUrl()}" class="product-url" title="${prdC1.getName()}">
                                <img src="${prdC1.getImage()}" alt="${prdC1.getName()}">
                            </a>
                            <div class="card-body product-info">
                                <h3 class="product-name text-truncate ">
                                    <a class="text-decoration-none text-primary" href="./product?id=${prdC1.getId()}&q=${prdC1.getUrl()}">${prdC1.getName()}</a>
                                </h3>
                                <div class="product-price">
                                    <span class="text-primary fw-bold">${prdC1.getPriceVND()}₫</span>
                                </div>
                                <div class="review">
                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                    <small class="text-secondary">(9 đánh giá)</small></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>          
               
               
            </div>
            <div class="mt-4 d-flex justify-content-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                      <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item active"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
            </div>
        </div>
    </div>

    <!-- end chuyên mục sản phẩm -->
    
    
    <%@ include file="footer.jsp"%>
<%@ include file="login.jsp"%>
<%@ include file="script_default.jsp"%>
