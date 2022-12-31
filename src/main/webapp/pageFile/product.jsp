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
					<li class="breadcrumb-item">${category}</li>
					<li class="breadcrumb-item active text-primary" aria-current="page">${prd.getName()}</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!-- end breadcrumb -->

<div class="contents">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-12 col-sm-12 col-12">
				<div class="row">
					<div class="product-img col-12 col-sm-6 col-md-6 col-lg-6">
						<div id="slider" class="owl-carousel product-slider">
							<c:forEach items="${prdImgs}" var="prdImg">
								<div class="item">
									<a href="#"> <img class="img-fluid" src="${prdImg.getUrl()}"
										alt="${prdImg.getUrl()}">
									</a>
								</div>
							</c:forEach>
                         </div>
						<div id="thumb" class="owl-carousel product-thumb">
							<c:forEach items="${prdImgs}" var="prdImg">
								<div class="item">
									<a href="#"> <img class="img-fluid" src="${prdImg.getUrl()}"
										alt="${prdImg.getUrl()}">
									</a>
								</div>
							</c:forEach>
                         </div>
					</div>
					<!-- end img left -->
					<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 product-info">
						<h1 class="title-product text-primary">${prd.getName()}</h1>
						<div class="product-status">
							<span class="status-title"> Thương hiệu: <span
								class="status-name text-primary">Đang cập nhật</span>
							</span> <span> | </span> <span class="status-title"> Tình trạng:
								<span class="status-name text-primary">Còn hàng</span>
							</span>
						</div>
						<div class="product-review">
							<span class="active"> <i class="fa fa-star-o"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							</span> <span class="active"> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star-o"
								aria-hidden="true"></i>
							</span> <span class="active"> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star-o"
								aria-hidden="true"></i>
							</span> <span class="deactive"> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star-o"
								aria-hidden="true"></i>
							</span> <span class="deactive"> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star-o"
								aria-hidden="true"></i>
							</span> <small class="text-secondary">(9 đánh giá)</small>
						</div>
						<div class="product-price">
							<span>${prd.getPrice()}₫</span>
						</div>
						<div class="product-detail">
						${prd.getShortDesc() }
						</div>
						<div class="product-form mt-3">
							<form class="row" action="./addToCard" method="post">

								<div class="col-auto">
									<div class="input-number d-inline-block clearfix">
										<button class="btn-num"
											onclick="var result = document.getElementById('qtym'); var qtypro = result.value; if( !isNaN( qtypro ) &amp;&amp; qtypro > 1 ) result.value--;return false;"
											type="button">-</button>
										<input class="outline-none" type="text" id="qtym"
											name="quantity" value="1" onkeyup="valid(this,'numbers')"
											onkeypress="validate(event)"
											class="form-control prd_quantity">
										<button class="btn-num"
											onclick="var result = document.getElementById('qtym'); var qtypro = result.value; if( !isNaN( qtypro )) result.value++;return false;"
											type="button">+</button>
									</div>
								</div>
								<div class="col-auto">
									<div class="input-submit d-inline-block">
										<input class="hidden" type="hidden" name="productID"
											value="${prd.getId()}">
										<button class="btn btn-buy bg-primary">
											<span class="btn-img"> <img class="img-fliud"
												src="./assets/img/shopping_cart.png" alt="">
											</span> <span class="btn-content text-white">Cho vào giỏ hàng</span>
										</button>
									</div>
								</div>



							</form>
						</div>
						<div class="contacts">
							<span>Hotline: <a class="text-decoration-none fw-bold"
								href="#">0865914142</a>
							</span>
						</div>
						<div class="share-icon mt-2">
							<span>Chia sẻ: <a class="icon" href="#"> <i
									class="fa fa-facebook"></i>
							</a> <a class="icon" href="#"> <i class="fa fa-twitter"></i>
							</a> <a class="icon" href="#"> <i class="fa fa-pinterest"></i>
							</a> <a class="icon" href="#"> <i class="fa fa-google-plus"></i>
							</a>
							</span>
						</div>
					</div>
				</div>
				<div class="mt-5 product-detail border">
					<p>
					${prd.getDesc()}
					
					</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
				<div class="right-contents mb-5">
					<div class="dich-vu">
						<ul class="list-group border border-primary">
							<li class="list-group-item">
								<div class="row align-items-center">
									<div class="col-3">
										<img class="img-icon-center img-fluid"
											src="./assets/img/shiper.png" alt="">
									</div>
									<div class="col-9">
										<p class="text-primary fw-bold mb-0 py-0">Giao hàng tận
											nơi</p>
										<span class="text-secondary">Cam kết giao hàng tận nhà</span>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="row align-items-center">
									<div class="col-3">
										<img class="img-icon-center img-fluid"
											src="./assets/img/change.png" alt="">
									</div>
									<div class="col-9">
										<p class="text-primary fw-bold mb-0 py-0">Đổi trả nhanh
											chóng</p>
										<span class="text-secondary">Đổi trả trong 7 ngày đầu
											tiên</span>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="row align-items-center">
									<div class="col-3">
										<img class="img-icon-center img-fluid"
											src="./assets/img/pay.png" alt="">
									</div>
									<div class="col-9">
										<p class="text-primary fw-bold mb-0 py-0">Bảo hành chính
											hãng</p>
										<span class="text-secondary">Cam kết 100% chính hãng</span>
									</div>
								</div>

							</li>
							<li class="list-group-item">
								<div class="row align-items-center">
									<div class="col-3">
										<img class="img-icon-center img-fluid"
											src="./assets/img/phone.png" alt="">
									</div>
									<div class="col-9">
										<p class="text-primary fw-bold mb-0 py-0">Đặt hàng online</p>
										<span class="text-secondary">Gọi ngay 0975581779</span>
									</div>
								</div>
							</li>
							<li class="list-group-item">
								<div class="row align-items-center">
									<div class="col-3">
										<img class="img-icon-center img-fluid"
											src="./assets/img/saving.png" alt="">
									</div>
									<div class="col-9">
										<p class="text-primary fw-bold mb-0 py-0">Mua hàng tiết
											kiệm</p>
										<span class="text-secondary">Giảm giá ưu đãi tới hơn
											50%</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="product-new mt-4">
						<ul class="list-group">
							<li class="list-group-item active">
								<h2 class="mb-0 text-uppercase fs-6">Hàng mới về</h2>
							</li>
						<c:forEach items="${prdNew}" var="prd2">
							<li class="list-group-item">
								<div class="row">
									<div class="col-md-5 my-2 img-product-new">
										<img class="img-fluid"
											src="${prd2.getImage()}" alt="${prd2.getName()}">
									</div>
									<div class="col-md-7 my-2 info-product-new">
										<h3 class="product-title">
											<a class="text-decoration-none"
												href="./product?id=${prd2.getId()}&q=${prd2.getUrl()}">${prd2.getName()}</a>
										</h3>
										<div class="product-review">
											<span class="active"> <i class="fa fa-star-o"
												aria-hidden="true"></i> <i class="fa fa-star"
												aria-hidden="true"></i>
											</span> <span class="active"> <i class="fa fa-star"
												aria-hidden="true"></i> <i class="fa fa-star-o"
												aria-hidden="true"></i>
											</span> <span class="active"> <i class="fa fa-star"
												aria-hidden="true"></i> <i class="fa fa-star-o"
												aria-hidden="true"></i>
											</span> <span class="deactive"> <i class="fa fa-star"
												aria-hidden="true"></i> <i class="fa fa-star-o"
												aria-hidden="true"></i>
											</span> <span class="deactive"> <i class="fa fa-star"
												aria-hidden="true"></i> <i class="fa fa-star-o"
												aria-hidden="true"></i>
											</span>
										</div>
										<span class="price">${prd2.getPriceVND()}₫</span>
									</div>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- new product -->
    <div id="new-product" class="new-product mt-5">
        <div class="container-md">
            <div class="row">
                <div class="col ">
                    <div class="border">
                        <span class="icon_tags d-inline-block bg-primary p-3 text-white">
                            <i class="fa fa-tags" aria-hidden="true"></i>
                        </span>
                        <h2 class="title text-uppercase d-inline-block ms-3"><a href="./san-pham-moi">Sản phẩm mới</a></h2>
                        
                    </div>
                    
                    <div class="border-top-0 border">
                        
                        <div class="row">
                            <div class="owl-carousel owl-theme">
                            <c:forEach items="${prdCarousel}" var="prd3">
                                <div class="item">
                                    <div class="card h-100 product">
                                        <a href="./product?id=${prd3.getId()}&q=${prd3.getUrl()}" class="product-url">
                                            <img src="${prd3.getImage()}" alt="${prd3.getName()}">
                                        </a>
                                        <div class="card-body product-info">
                                            <h3 class="product-name text-truncate ">
                                                <a class="text-decoration-none text-primary" 
                                                href="./product?id=${prd3.getId()}&q=${prd3.getUrl()}">${prd3.getName()}</a>
                                            </h3>
                                            <div class="product-price">
                                                <span class="text-primary fw-bold">${prd3.getPriceVND()}₫</span>
                                            </div>
                                            <div class="review">
                                                <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star" aria-hidden="true"></i></span>
                                                <span class="deactive"><i class="fa fa-star" aria-hidden="true"></i></span>
                                                <span class="deactive"><i class="fa fa-star" aria-hidden="true"></i>
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

<%@ include file="footer.jsp"%>
<%@ include file="login.jsp"%>
<%@ include file="script_default.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	var slider = $("#slider");
    var thumb = $("#thumb");
    var slidesPerPage = 4; //globaly define number of elements per page
    var syncedSecondary = true;
    slider.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: false,
        autoplay: false,
        dots: false,
        loop: true,
        responsiveRefreshRate: 200
    }).on('changed.owl.carousel', syncPosition);
    thumb
        .on(
            'initialized.owl.carousel',
            function() {
                thumb.find(".owl-item").eq(0)
                    .addClass("current");
            })
        .owlCarousel({
            items: slidesPerPage,
            dots: false,
            nav: true,
            item: 4,
            smartSpeed: 200,
            slideSpeed: 500,
            slideBy: slidesPerPage,
            navText: [
                '<svg width="18px" height="18px" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>',
                '<svg width="25px" height="25px" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'
            ],
            responsiveRefreshRate: 100
        }).on('changed.owl.carousel',
            syncPosition2);

    function syncPosition(el) {
        var count = el.item.count - 1;
        var current = Math.round(el.item.index -
            (el.item.count / 2) - .5);
        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }
        thumb.find(".owl-item").removeClass("current")
            .eq(current).addClass("current");
        var onscreen = thumb.find('.owl-item.active').length - 1;
        var start = thumb.find('.owl-item.active')
            .first().index();
        var end = thumb.find('.owl-item.active').last()
            .index();
        if (current > end) {
            thumb.data('owl.carousel').to(current, 100,
                true);
        }
        if (current < start) {
            thumb.data('owl.carousel').to(
                current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            slider.data('owl.carousel').to(number, 100,
                true);
        }
    }
    thumb.on("click", ".owl-item", function(e) {
        e.preventDefault();
        var number = $(this).index();
        slider.data('owl.carousel').to(number, 300,
            true);
    });

    $(".qtyminus").on("click", function() {
        var now = $(".qty").val();
        if ($.isNumeric(now)) {
            if (parseInt(now) - 1 > 0) {
                now--;
            }
            $(".qty").val(now);
        }
    })
    $(".qtyplus").on("click", function() {
        var now = $(".qty").val();
        if ($.isNumeric(now)) {
            $(".qty").val(parseInt(now) + 1);
        }
    });
    
    
    $('#new-product .owl-carousel').owlCarousel({
        // loop:true,
        margin:0,
        nav:true,
        // items: 2,
        mouseDrag: true,
        touchDrag: true,
        pullDrag: true,
        dots: false,
        responsive:{
            0:{
                items:1
            },
            400: {
                items:2
            },
            600:{
                items:3
            },
            1000:{
                items:4
            }
        }
    });
});
</script>

<%@ include file="end_html.html"%>
