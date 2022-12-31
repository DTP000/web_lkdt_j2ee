<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
    <!-- new product -->
    <div id="new-product" class="new-product mt-5">
        <div class="container-md">
            <div class="row">
                <div class="col ">
                    <div class="border">
                        <span class="icon_tags d-inline-block bg-primary p-3 text-white">
                            <i class="fa fa-tags" aria-hidden="true"></i>
                        </span>
                        <h2 class="title text-uppercase d-inline-block ms-3">${prdName}</h2>
                    </div>

                    <div class="border-top-0 border">

                        <div class="row">
                            <div class="owl-carousel owl-theme">
                            
                            <c:forEach items="${prdCarousel}" var="prdC1">                            
                                <div class="item">
                                    <div class="card h-100 product">
                                        <a href="./product?id=${prdC1.getId()}&q=${prdC1.getUrl()}"
                                            title="${prdC1.getName()}"
                                            class="product-url">
                                            <img src="${prdC1.getImage()}"
                                                alt="${prdC1.getName()}">
                                        </a>
                                        <div class="card-body product-info">
                                            <h3 class="product-name text-truncate ">
                                                <a class="text-decoration-none text-primary"
                                                    href="./product?id=${prdC1.getId()}&q=${prdC1.getUrl()}"
                                                    title="${prdC1.getName()}">${prdC1.getName()}</a>
                                            </h3>
                                            <div class="product-price">
                                                <span class="text-primary fw-bold">${prdC1.getPriceVND()}₫</span>
                                            </div>
                                            <div class="review">
                                                <span class="active"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star" aria-hidden="true"></i>
                                                    <small class="text-secondary">(9 đánh giá)</small></span>
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
    <!-- end new product -->