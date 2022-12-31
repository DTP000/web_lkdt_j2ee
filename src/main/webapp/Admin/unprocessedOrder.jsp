<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Model.Order"%>
<%@page import="Dao.OrderDAO"%>
<%@page import= "java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin - Tables</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="header.html"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="topbar.html"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Danh Sách Đơn Hàng Cần Xử Lí</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<!-- <table id="example" class="display" style="width: 100%">
									<thead>
										<tr>
											<th></th>
											<th>First name</th>
											<th>Last name</th>
											<th>Position</th>
											<th>Office</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th></th>
											<th>First name</th>
											<th>Last name</th>
											<th>Position</th>
											<th>Office</th>
										</tr>
									</tfoot>
								</table>
 -->
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<!-- <th>ID</th> -->
											<th>Mã Vận Chuyển</th>
											<th>Tên</th>
											<th>Số Điện Thoại</th>
											<th>Địa Chỉ</th>
											<th>Chú Thích</th>
											<th>Ngày Đặt</th>
											<th>Tổng Tiền</th>
											<th>Xem</th>
											<th>Duyệt</th>
											<th>Hủy</th>
											<!-- <th>button</th> -->
										</tr>
									</thead>
									<tbody>
									<% List<Order> list = (List<Order>)request.getAttribute("rs");%>
									<% for (Order o : list) {%>
										<tr>
											<%-- <td><%=o.getId()%></td> --%>
											<td><%=o.getShipCode()%></td>
											<td><%=o.getFullName()%></td>
											<td><%=o.getPhone()%></td>
											<td><%=o.getAddress()%></td>
											<% if (o.getNote() != null) {%>
												<td><%=o.getNote() %></td>
											<%} else { %>
												<td></td>
											<%} %>
											<td><%=o.getCreatedAt()%></td>
											<td><%=o.getTotalPrice()%></td>
											<%-- <td><%=o.getAddress()%></td> --%>
											<td><button title="Product Information" data-toggle="modal" data-target="#productDetailsModal" data-id="<%=o.getId() %>" id="productDetails" class="btn btn-warning" style="border-radius:50px;"><i class="fa fa-eye"></i></button></td>
											<td>
											
											<a href="./UpdateOrder?id=<%=o.getId()%>" title="Submit" style="border-radius:60px;" 
												class="btn btn-info"><i class="fa fa-check"></i></a>
											<td>
								
												<button title="Cancel Order" data-toggle="modal" data-target="#noteOrder" data-id="<%=o.getId() %>" id="cancelOrder"
                                           class="btn btn-danger" style="border-radius:60px;"><i class="fa fa-times" alt="delete"></i></button>
											</td>							
																				
										</tr>
									<%} %>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.html"></jsp:include>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>
	
	 <div id="productDetailsModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
               		 <h4 class="modal-title text-center"><b>Orders Detail</b></h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    
                </div>
                <div class="modal-body ">
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="table table-responsive table-bordered" id="productTable">
                                <tr>
									<th scope="col">Number</th>
									<th scope="col">Product Name</th>
									<th scope="col">Quantity</th>
									<th scope="col">Price</th>
									<th scope="col">Note</th>
								</tr>
                                <!-- <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Detail</th>
                                </tr>
                                </thead> -->
                                <!-- <tbody>
                                <tr>
                                    <td><b>Customer Name</b></td>
                                    <td id="customer_name"></td>
                                </tr>
                                <tr>
                                    <td><b>Contact Number</b></td>
                                    <td id="customer_contact_no"></td>
                                </tr>
                                <tr>
                                    <td><b>Email</b></td>
                                    <td id="customer_email"></td>
                                </tr>
                                <tr>
                                    <td><b>ID Card Type</b></td>
                                    <td id="customer_id_card_type"></td>
                                </tr>
                                <tr>
                                    <td><b>ID Card Number</b></td>
                                    <td id="customer_id_card_number"></td>
                                </tr>
                                <tr>
                                    <td><b>Address</b></td>
                                    <td id="customer_address"></td>
                                </tr>
                                <tr>
                                    <td><b>Remaining Amount</b></td>
                                    <td id="remaining_price"></td>
                                </tr>
                                </tbody> -->
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<div id="noteOrder" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                	<h4 class="modal-title">Cancel Order</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>   
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <form id="noteCancelOrder" data-toggle="validator" role="form">
                                <div class="edit_response"></div>
                                <div class="form-group">
                                    <label>Comment</label>
                                    <input class="form-control" placeholder="let others know why you canceled the order" id="edit_room_no" required
                                           data-error="Enter Room No">
                                    <div class="help-block with-errors"></div>
                                </div>
                                <input type="hidden" id="idOrder">
                                <div class="d-flex justify-content-between">
                                	<div width="1"></div>	
	                            <button class="btn btn-success pull-right">Submit</button> 
                                </div>
                                  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- Bootstrap core JavaScript-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/style.js"></script>
	<!-- <script src="vendor/jquery/jquery.min.js"></script> -->
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>

</body>

</html>
