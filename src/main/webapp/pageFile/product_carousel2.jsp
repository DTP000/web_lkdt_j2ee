<%@ page language="java" contentType="text/html"
    pageEncoding="UTF-8"%>
    <%@page import="Model.Products" %>
    <%@page import="Dao.ProductsDAO" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="static utils.func.showPrice" %>
    <%! String productShowName = "Sản phẩm nổi bật"; %>
    <%! String productShowNameClass = "prd-new"; %>
    <%! ArrayList<Products> prds = ProductsDAO.getProducts(0, 8);%>
    <!-- new product -->
    <div id="new-product" class="new-product mt-5">
        <div class="container-md">
            <div class="row">
                <div class="col ">
                    <div class="border">
                        <span class="icon_tags d-inline-block bg-primary p-3 text-white">
                            <i class="fa fa-tags" aria-hidden="true"></i>
                        </span>
                        <h2 class="title text-uppercase d-inline-block ms-3"><%=productShowName%></h2>
                    </div>

                    <div class="border-top-0 border">

                        <div class="row">
                            <div class="owl-carousel owl-theme <%=productShowNameClass%>">
                            
                            <%
	                            request.setCharacterEncoding("UTF-8");
	                            response.setCharacterEncoding("UTF-8");
	                            
	                            for (Products p : prds) {
	                            
                        	%>
                            
                                <div class="item">
                                    <div class="card h-100 product">
                                        <a href="./product?id=<%=p.getId()%>&q=<%=p.getUrl()%>"
                                            title="<%=p.getName() %>"
                                            class="product-url">
                                            <img src="<%=p.getImage() %>"
                                                alt="<%=p.getName()%>">
                                        </a>
                                        <div class="card-body product-info">
                                            <h3 class="product-name text-truncate ">
                                                <a class="text-decoration-none text-primary"
                                                    href="./product?id=<%=p.getId()%>&q=<%=p.getUrl()%>"
                                                    title="<%=p.getName() %>"><%=p.getName() %></a>
                                            </h3>
                                            <div class="product-price">
                                                <span class="text-primary fw-bold"><%=showPrice(p.getPrice()) %>₫</span>
                                            </div>
                                            <div class="review">
                                                <span class="active"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="active"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="deactive"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="deactive"><i class="fa fa-star"
                                                        aria-hidden="true"></i></span>
                                                <span class="deactive"><i class="fa fa-star" aria-hidden="true"></i>
                                                    <small class="text-secondary">(9 đánh giá)</small></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

							<% } %>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end new product -->