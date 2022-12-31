<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!-- hot-product -->
    <div class="hot-product mt-5 pt-3">
        <div class="container-md">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-lg-4 col-8">
                            <h2>
                                <a class="title text-decoration-none text-uppercase fs-5" data-bs-toggle="collapse"
                                    href="#ls-mach-amply" role="button" aria-expanded="false"
                                    aria-controls="ls-mach-amply">
                                    <i class="fa fa-list text-primary pe-3" aria-hidden="true"></i>Mạch Amply - Main
                                </a>
                            </h2>
                        </div>
                        <div class="col-lg-8 col-4 d-flex align-items-center justify-content-end">
                            <!-- <a class="" href="#"> -->
                            <div class="pull-right">

                                <i class="fa fa-bars text-primary ls-nav-icon fs-1" data-bs-toggle="collapse"
                                    href="#ls-mach-amply" role="button" aria-expanded="false"
                                    aria-controls="ls-mach-amply" aria-hidden="true"></i>
                                <ul id="ls-mach-amply" class="list-group ls-nav collapse" role="tablist">
                                    <li class="list-group-item" role="presentation">
                                        <a class="url active" id="home-tab" data-bs-toggle="tab" href="#machtienCS"
                                            role="tab" aria-controls="home" aria-selected="true">
                                            Mạch PRE Tiền Công Suất
                                        </a>
                                    </li>
                                    <li class="list-group-item" role="presentation">
                                        <a class="url" id="profile-tab" data-bs-toggle="tab" href="#machCSLon"
                                            role="tab" aria-controls="profile" aria-selected="false">
                                            Mạch công suất lớn hàng công ty
                                        </a>
                                    </li>
                                    <li class="list-group-item" role="presentation">
                                        <a class="url" id="contact-tab" data-bs-toggle="tab" href="#machCSgiare"
                                            role="tab" aria-controls="contact" aria-selected="false">
                                            Mạch CS Âm Thanh Giá Rẻ
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <!-- </a> -->

                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="machtienCS" role="tabpanel"
                            aria-labelledby="home-tab">
                            <div class="row">
                            <c:forEach items="${prd_machTienCS}" var="prd2">
                                <div class="col-lg-3 col-md-4 col-sm-6 p-4 col-6">
                                    <div class="row bg-white">
                                        <div class="col-sm-12">
                                            <div class="product-thumnail">
                                                <a class="product-url product-tab"
                                                    href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}"
                                                    title="${prd2.getName()}">
                                                    <img class=""
                                                        src="${prd2.getImage()}"
                                                        alt="${prd2.getName()}">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="product-info">
                                                <h3 class="product-name text-truncate">
                                                    <a class="text-decoration-none text-primary"
                                                        href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}"
                                                        title="${prd2.getName()}">${prd2.getName()}</a>
                                                </h3>
                                                <div class="product-price">
                                                    <span class="text-primary fw-bold">${prd2.getPriceVND()}₫</span>
                                                </div>
                                                <div class="review">
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                        <small class="text-secondary">(9 đánh giá)</small> </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="machCSLon" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row">
                            	<c:forEach items="${prd_machCSLon}" var="prd2">
                                <div class="col-lg-3 col-md-4 col-sm-6 p-4 col-6">
                                    <div class="row bg-white">
                                        <div class="col-sm-12">
                                            <div class="product-thumnail">
                                                <a class="product-url product-tab"
                                                    href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}"
                                                    title="${prd2.getName()}">
                                                    <img class=""
                                                        src="${prd2.getImage()}"
                                                        alt="${prd2.getName()}">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="product-info">
                                                <h3 class="product-name text-truncate">
                                                    <a class="text-decoration-none text-primary"
                                                        href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}"
                                                        title="${prd2.getName()}">${prd2.getName()}</a>
                                                </h3>
                                                <div class="product-price">
                                                    <span class="text-primary fw-bold">${prd2.getPriceVND()}₫</span>
                                                </div>
                                                <div class="review">
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                        <small class="text-secondary">(9 đánh giá)</small> </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="machCSgiare" role="tabpanel" aria-labelledby="contact-tab">
                            <div class="row">
                               <c:forEach items="${prd_machCSgiare}" var="prd2">
                                <div class="col-lg-3 col-md-4 col-sm-6 p-4 col-6">
                                    <div class="row bg-white">
                                        <div class="col-sm-12">
                                            <div class="product-thumnail">
                                                <a class="product-url product-tab"
                                                    href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}"
                                                    title="${prd2.getName()}">
                                                    <img class=""
                                                        src="${prd2.getImage()}"
                                                        alt="${prd2.getName()}">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="product-info">
                                                <h3 class="product-name text-truncate">
                                                    <a class="text-decoration-none text-primary"
                                                        href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}"
                                                        title="${prd2.getName()}">${prd2.getName()}</a>
                                                </h3>
                                                <div class="product-price">
                                                    <span class="text-primary fw-bold">${prd2.getPriceVND()}₫</span>
                                                </div>
                                                <div class="review">
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    </span>
                                                    <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                        <small class="text-secondary">(9 đánh giá)</small> </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end hot-product -->