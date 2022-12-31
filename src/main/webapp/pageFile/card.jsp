<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList" %>
<%@page import="Model.Product_image" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<%@ include file="head.jsp"%>
<title>Giỏ hàng | DTP000</title>
<style>
.owl-nav button {
            position: absolute;
            top: 50%;
            transform: translate(0, -50%);
            outline: none;
            height: 25px;
        }
        
        .owl-nav button svg {
            width: 25px;
            height: 25px;
        }
        
        .owl-nav button.owl-prev {
            left: 25px;
        }
        
        .owl-nav button.owl-next {
            right: 25px;
        }
        
        .owl-nav button span {
            font-size: 45px;
        }
        
        .product-thumb .item img {
            height: 100px;
        }
        
</style>
<%@ include file="header.jsp"%>

<!-- breadcrumb -->
<div class="bread-crumb">
	<div class="container">
		<div class="row">
			<div class="mt-2" style="-bs-breadcrumb-divider: '&gt;&gt;';"
				aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Trang chủ</li>
					<li class="breadcrumb-item active text-primary" aria-current="page">Giỏ hàng</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb -->

<div id="gio-hang">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 title">
                    <h3 class="ten-gio-hang">
                        Giỏ hàng của bạn có ${prdNum} sản phẩm
                    </h3>
                </div>
                <div class="col-sm-12 gio-hang-noi-dung mt-3 ">
                    
                    <div class="gh-table">
                        <form class="product-form" action="./checkout" method="post">

                            <table class="table table-light table-bordered border-primary table-responsive mb-2">
                                <thead>
                                    <tr>
                                        <th scope="col" class="ct">Ảnh sản phẩm</th>
                                        <th scope="col" class="ct">Tên sản phẩm</th>
                                        <th scope="col" class="ct">Đơn giá</th>
                                        <th scope="col" class="ct">Số lượng</th>
                                        <th scope="col" class="ct">Thành tiền</th>
                                        <th scope="col" class="ct">Xoá</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${prdCardList}" var="prdC1">
                                    <tr>
                                        <td class="ct">
                                            <div class="anh-sp spp">
                                                <a href="./product?id=${prdC1.getPrd_id()}&q=${prdC1.getUrl()}" class="img-sp" title="${prdC1.getName()}">
                                                    <img src="${prdC1.getImage()}" alt="${prdC1.getName()}">
                                                </a>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="ten-sp spp">
                                                <h2 class="product-name">
                                                    <a href="./product?id=${prdC1.getPrd_id()}&q=${prdC1.getUrl()}" title="${prdC1.getName()}">
                                                        ${prdC1.getName()}
                                                    </a>
                                                </h2>
                                            </div>
                                        </td>
                                        <td class="ct">
                                            <div class="dongia-sp spp">
                                                <span class="gia">${prdC1.getPriceVN()}₫</span>
                                            </div>
                                        </td>
                                        <td class="ct">
                                            <div class="soluong-sp spp">
                                                <div class="input-number d-inline-block clearfix">
                                                    <button class="btn-num" onclick="giamSL(qtymb-${prdC1.getPrd_id()})" type="button">-</button>
                                                    <input class="outline-none" type="text" id="qtymb-${prdC1.getPrd_id()}" name="quantity" value="${prdC1.getQuantity()}" onkeyup="valid(this,'numbers')" onkeypress="validate(event)" class="form-control prd_quantity">
                                                    <button class="btn-num" onclick="tangSL(qtymb-${prdC1.getPrd_id()})" type="button">+</button>
                                                </div>                              
                                            </div>
                                        </td>
                                        <td class="ct">
                                            <div class="thanhtien-sp spp">
                                                <span class="gia">${prdC1.getTotalVN()}₫</span>
                                            </div>
                                        </td>
                                        <td class="ct">
                                            <div class="xoa-sp spp">
                                                <a class="remove-item" href="#">
                                                    <span>
                                                        <i class="fa fa-times" aria-hidden="true"></i>
                                                    </span>
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>    
                                    <tr>
                                        <td colspan="5">
                                            <div class="text-end">
                                                <span>Tổng tiền: </span>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="tong-tien">
                                                <span class="fw-bold text-primary pe-4">
                                                    ${totalPrice }đ
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
                <div class="card-submit row mt-4">
                    <div class="col-sm-12">
                        <div class="total">
                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="text-end">
                                        <span>Tổng tiền: </span>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="tong-tien">
                                        <span class="fw-bold text-primary pe-4">
                                            ${totalPrice }đ
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="check-out mt-4">
                            <div class="text-end">
                                <a class="btn btn-secondary text-uppercase fs-6" href="./home">
                                    Tiếp tục mua hàng
                                </a>
                                <a class="btn btn-primary text-uppercase fs-6" href="./checkOut">
                                    Thực hiện thanh toán
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>










<%@ include file="footer.jsp"%>
<%@ include file="login.jsp"%>
<%@ include file="script_default.jsp"%>


<script>

function giamSP(id) {
	var result = document.getElementById(id);
	var qtypro = result.value;
	if (!isNaN(qtypro) || qtypro > 1) result.value--;
	return false;
}
function tangSP(id) {
	var result = document.getElementById(id);
	var qtypro = result.value;
	if (!isNaN(qtypro)) result.value++;
	return false;
}
</script>