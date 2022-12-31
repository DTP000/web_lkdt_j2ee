<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    
<%@page import="Model.Users"%>
<%@page import="Dao.UsersDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	Users userCurrent = (Users) UsersDAO.getUserFromCookie(request.getCookies(), session);
	System.out.println("header: " + userCurrent);
	if (session.getAttribute("userCurrent") != null){	
		System.out.println("user: " + session.getAttribute("userCurrent"));
	}
	System.out.println("not user: " + session.getAttribute("userCurrent"));
%>
    
</head>
<body>

	<header>
        <!-- top-header -->
        <div class="top-header border-bottom">
            <div class="container">
                <div class="row py-2">
                    <div class="col ">
                        Hotline: <a class="text-decoration-none text-primary fw-bold url" href="tel:+901174550">090 117 4550</a>
                    </div>
                    
                    <div class="col">
                        <div class="text-end">
                            <ul class="list-inline mb-0">
                            <%
	                            request.setCharacterEncoding("UTF-8");
	                        	response.setCharacterEncoding("UTF-8");
                            	if (userCurrent == null) {
                            
                            %>
                                <li class="list-inline-item"><a class="text-decoration-none url" href="#" data-bs-toggle="modal" data-bs-target="#register">Đăng ký</a></li>
                                <li class="list-inline-item"><a class="text-decoration-none url" href="#" data-bs-toggle="modal" data-bs-target="#login">Đăng nhập</a></li>
                            
                            <% } else { %>
                            	<li class="list-inline-item"><a class="text-decoration-none url" href="./profile"><%=userCurrent.getUsername()%></a></li>
                                <li class="list-inline-item"><a class="text-decoration-none url" href="./signout">Đăng xuất</a></li>
                            
                            <% } %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end top-header -->


        <!-- header-main -->
        <div class="container py-4 header-lg">
            <div class="row">
                <div class="col-md-3">
                    <a href="./home">
                        <img class="img-fluid" src="./assets/img/logo.png" alt="">
                    </a>
                </div>
                <div class="col-md-6 mt-4">
                    <div class="search">
                        <form action="./search" method="GET">
                            <div class="input-group border border-primary border-2">
                                <input name="q" type="text" value="${query}" class="form-control border-0" placeholder="Bạn đang tìm sản phẩm gì...?">
                                <button type="submit" class="input-group-text border-primary br-0 bg-primary text-white" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-3 mt-4">
                    <div class="text-end icon-card">
                        <a class="text-primary text-decoration-none" href="./card">
                            <i class="fa fa-shopping-cart pe-2" aria-hidden="true"></i>                        
                            <span class="align-top badge bg-primary">0</span>
                            <span class="d-block text-secondary text-end">Giỏ hàng</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid py-4 header-md">
            <div class="row">
                <div class="col-3">
                    <a class="" data-bs-toggle="offcanvas" href="#offcanvasMobile" role="button" aria-controls="offcanvasMobile">
                        <img data-bs-toggle="offcanvas" href="#offcanvasMobile" role="button" aria-controls="offcanvasMobile" src="https://bizweb.dktcdn.net/100/184/656/themes/821115/assets/i_menubar.png?1623059007493" alt="">
                        <!-- <i class="fa fa-bars" aria-hidden="true"></i> -->
                        
                    </a>
                    <!-- <a class="btn btn-primary" data-bs-toggle="offcanvas" href="#offcanvasMobile" role="button" aria-controls="offcanvasMobile">
                        Link with href
                    </a> -->
                    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasMobile" aria-labelledby="offcanvasMobileTitle">
                        <div class="offcanvas-header py-2  border-bottom bg-white pe-1">
                          <h5 class="offcanvas-title" id="offcanvasMobileTitle"></h5>
                          <button type="button" class="btn-closef" data-bs-dismiss="offcanvas" aria-label="Close">
                            <i class="fa fa-times" aria-hidden="true"></i>
                          </button>
                        </div>
                        <div class="offcanvas-body p-0">
                            <div class="logo-offcanvas my-2 m-auto bg-white">
                                <img class="img-fluid" src="./assets/img/logo.png" alt="">
                                <!-- <img class="img-fluid" src="https://bizweb.dktcdn.net/100/184/656/themes/821115/assets/logo.png?1623058866094" alt=""> -->
                            </div>
                            <div class="offcanvas-contents mt-2 bg-primary">
                                <ul class="list-group">
                                    <li class="border-bottom border-1 border-white">
                                        <a class="url text-decoration-none text-white" href="./home">Trang chủ</a>
                                        <!-- <i class="fa fa-plus" role="button" id="btdm" data-bs-toggle="dropdown" aria-expanded="false" aria-hidden="true"></i> -->
                                        
                                        
                                    </li>
                                    <li class="border-bottom border-1 border-white">
                                        <a class="url text-decoration-none text-white" href="./tat-ca-san-pham">Tất cả sản phẩm</a>

                                        <i class="fa fa-plus" data-bs-toggle="collapse" href="#tatcasp" role="button" aria-expanded="false" aria-controls="tatcasp" aria-hidden="true"></i>
                                        <!-- <i class="fa fa-plus" aria-hidden="true"></i> -->
                                        <ul id="tatcasp" class="collapse list-group border-top border-white">
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./san-pham-khuyen-mai" class="url ls-item text-white">Sản phẩm khuyến mãi</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./san-pham-noi-bat" class="url ls-item text-white">Sản phẩm nổi bật</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./san-pham-moi" class="url ls-item text-white">Sản phẩm mới</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./do-cu-thanh-ly" class="url ls-item text-white">Đồ cũ, thanh lý</a>
                                            </li>
                                            <li class="">
                                                <a href="./ban-buon" class="url ls-item text-white">Bán buôn</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="border-bottom border-1 border-white">
                                        <a class="url text-decoration-none text-white" href="#">Linh kiện</a>
                                        <i class="fa fa-plus" data-bs-toggle="collapse" href="#linhkien" role="button" aria-expanded="false" aria-controls="linhkien" aria-hidden="true"></i>
                                        <!-- <i class="fa fa-plus" aria-hidden="true"></i> -->
                                        <ul id="linhkien" class="collapse list-group border-top border-white">
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./dien-tro" class="url ls-item text-white">Điện trở</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./ic-cac-loai" class="url ls-item text-white">IC các loại</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./tu-dien" class="url ls-item text-white">Tụ điện</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./diode" class="url ls-item text-white">Diode (Đi ốt)</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./transistor" class="url ls-item text-white">Transistor BJT</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./thiet-bi-do" class="url ls-item text-white">Thiết bị đo</a>
                                            </li>
                                            <li class="">
                                                <a href="./bien-ap-nguon-xung" class="url ls-item text-white">Biến áp, nguồn xung</a>
                                            </li>
                                        </ul>

                                    </li>
                                    <li class="border-bottom border-1 border-white">
                                        <a class="url text-decoration-none text-white" href="#">Mạch điện tử</a>
                                        <i class="fa fa-plus" data-bs-toggle="collapse" href="#machdientu" role="button" aria-expanded="false" aria-controls="machdientu" aria-hidden="true"></i>
                                        <!-- <i class="fa fa-plus" aria-hidden="true"></i> -->
                                        <ul id="machdientu" class="collapse list-group border-top border-white">
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./mach-cong-suat-am-ly" class="url ls-item text-white">Mạch công suất Amply</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./mach-dien-diy" class="url ls-item text-white">Mạch điện DIY</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./mach-inverter-kich-dien" class="url ls-item text-white">Mạch Inverter (Kích điện)</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./ky-thuat-dien-tu" class="url ls-item text-white">Kỹ thuật điện tử</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="border-bottom border-1 border-white">
                                        <a class="url text-decoration-none text-white" href="./thanh-toan-va-van-chuyen">Thanh toán và vận chuyển</a>
                                    </li>
                                    <li class="border-bottom border-1 border-white">
                                        <a class="url text-decoration-none text-white" href="#">Blog</a>
                                        <i class="fa fa-plus" data-bs-toggle="collapse" href="#blog" role="button" aria-expanded="false" aria-controls="blog" aria-hidden="true"></i>
                                        <!-- <i class="fa fa-plus" aria-hidden="true"></i> -->
                                        <ul id="blog" class="collapse list-group border-top border-white">
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./tin-tuc" class="url ls-item text-white">Tin tức</a>
                                            </li>
                                            <li class="border-bottom border-1 border-white">
                                                <a href="./ky-thuat-dien-tu" class="url ls-item text-white">Kỹ thuật điện tử</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6 text-center">
                    <a href="./home">
                        <img class="img-fluid logo" src="./assets/img/logo.png" alt="">
                    </a>
                </div>
                <div class="col-3">
                    <div class="text-end icon-card">
                        <a class="text-primary text-decoration-none" href="./card">
                            <i class="fa fa-shopping-cart pe-2" aria-hidden="true"></i>                        
                            <span class="align-top badge bg-primary">0</span>
                            <span class="d-block text-secondary text-end">Giỏ hàng</span>
                        </a>
                    </div>
                </div>
                <div class="col-12 mt-3">
                    <div class="search">
                        <form action="./search" method="GET">
                            <div class="input-group border border-primary border-2">
                                <input name="q" type="text" value="${query}"  class="form-control border-0" placeholder="Bạn đang tìm sản phẩm gì...?">
                                <button type="submit" class="input-group-text border-primary br-0 bg-primary text-white" id="basic-addon1"><i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="danh-muc-san-pham bg-light header-lg header-mdd">
            <div class="container">
                <div class="row fw-bold">
                    <nav class="navbar navbar-expand-md">
                        <div class="container ps-0">
                            <!-- <a class="navbar-brand" href="#">Danh mục sản phẩm</a> -->
                            <!-- <button class="danhmuc border-0 btn btn-primary dropdown-toggle btn-lg me-4" type="button" id="btdm" data-bs-toggle="dropdown" aria-expanded="false">
                                Danh mục sản phẩm
                                <i class="ps-5 fa fa-bars text-end" aria-hidden="true"></i>
                            </button> -->
                            <div class="nav-item nav-danhmuc">
                                
                                <a class="py-3 danhmuc br-0 bg-primary text-white text-decoration-none dropdown-toggle btn-lg me-4" href="#" id="btdm" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Danh mục sản phẩm
                                    <i class="ps-5 fa fa-bars text-end" aria-hidden="true"></i>
                                </a>
                                <ul class="danhmucul dropdown-menu me-4 border border-primary br-0" aria-labelledby="btdm">
                                    <li class="border-bottom py-1"><a class="dropdown-item" href="./mach-dien-tu">Mạch điện tử</a></li>
                                    <li class="border-bottom py-1"><a class="dropdown-item" href="./linh-kien">Linh kiện</a></li>
                                    <li class="py-1"><a class="dropdown-item" href="./xem-them">Xem thêm</a></li>
                                </ul>
                            </div>
                            
                            
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                    <li class="nav-item px-2">
                                        <a class="nav-link url" href="./home">Trang chủ</a>
                                    </li>
                                    <li class="nav-item abcds px-2 dropdown">
                                        <a class="nav-link url dropdown-toggle" href="#" id="dropa" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Tất cả sản phẩm
                                        </a>
                                        <ul class="dropdown-menu border border-primary br-0 mt-2" aria-labelledby="dropa">
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./san-pham-khuyen-mai">Sản phẩm khuyến mãi</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./san-pham-noi-bat">Sản phẩm nổi bật</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./san-pham-moi">Sản phẩm mới</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./do-cu-thanh-ly">Đồ cũ, thanh lý</a></li>
                                            <li class=" py-1"><a class="dropdown-item" href="./ban-buon">Bán buôn</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item px-2 dropdown">
                                        <a class="nav-link url dropdown-toggle" href="#" id="dropb" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Linh kiện
                                        </a>
                                        <ul class="dropdown-menu border border-primary br-0 mt-2" aria-labelledby="dropb">
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./dien-tro">Điện trở</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./ic-cac-loai">IC Các Loại</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./tu-dien">Tụ điện</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./dong-co">Động cơ</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./diode">Diode (Đi ốt)</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./transistor">Transistor BJT</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./day-jack-bus">Dây Jack - Bus</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./tan-nhiet">Tản nhiệt</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./thiet-bi-do">Thiết bị đo</a></li>
                                            <li class=" py-1"><a class="dropdown-item" href="./bien-ap-nguon-xung">Biến áp - Nguồn xung</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item px-2 dropdown">
                                        <a class="nav-link url dropdown-toggle" href="#" id="dropc" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            Mạch điện tử
                                        </a>
                                        <ul class="dropdown-menu border border-primary br-0 mt-2" aria-labelledby="dropc">
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./mach-cong-suat-amply">Mạch công suất Amply</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./mach-dien-diy">Mạch điện DIY</a></li>
                                            <li class="border-bottom py-1"><a class="dropdown-item" href="./mach-inverter-kich-dien">Mạch Inverter (Kích điện)</a></li>
                                            <li class="py-1"><a class="dropdown-item" href="./ky-thuat-dien-tu">Kỹ thuật điện tử</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item px-1">
                                        <a class="nav-link url" href="./thanh-toan-va-vn-chuyen">Thanh toán và vận chuyển</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- end header-main -->
    </header>
