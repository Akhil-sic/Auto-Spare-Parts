<%@page import="com.entity.User"%>
<%@page import="com.entity.Products"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<%@include file="static_components/allCss.jsp"%>
<link rel="stylesheet" href="static_components/style.css">
</head>
<body>
<%@include file="static_components/navbar.jsp"%>
<div class="super_container">
<%User u=(User)session.getAttribute("userobj");%>
<%
 int id=Integer.parseInt(request.getParameter("pid"));  
 ProductDAOImpl pdao=new ProductDAOImpl(DBConnect.getConn());
 Products p=pdao.getProductsByid(id);
 
 %>
		<div class="single_product">
			<div class="container-fluid"
				style="background-color: #fff; padding: 11px;">
				<div class="row">
					<div class="col-lg-2 order-lg-1 order-2">
						<ul class="image_list">

						<li data-image="static_components/not avial.png"><img
							src="images/<%=p.getPimg2()%>" alt="#"></li>
						<li data-image="static_components/not avial.png"><img
							src="images/<%=p.getPimg3()%>"alt=""></li>
						</ul>
					</div>
					<div class="col-lg-4 order-lg-2 order-1">
						<div class="image_selected">
						<img src="images/<%=p.getPimg1()%>" alt="#" />
						</div>			
					</div>
					<div class="col-lg-6 order-3">
						<div class="product_description">
							<!-- <nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item"><a href="#">Products</a></li>
									<li class="breadcrumb-item active">Accessories</li>
								</ol>
							</nav> -->
							<div class="product_name">
								<b><%=p.getPname()%></b>
							</div>
							<div class="proNameView"><%=p.getManuf_no()%></div>
							<div class="proNameView"><%=p.getBname()%></div>
							<div class="proNameView"><%=p.getVmname()%> <%=p.getVmyear()%></div>
							<div class="product_name"><%=p.getPescription()%></div>
							<div class="product-rating">
								<span class="badge badge-success"><i class="fa fa-star"></i>
									4.5 Star</span> <span class="rating-review">35 Ratings & 45
									Reviews</span>
							</div>
							<div>
								<span class="product_price">Rs.<%=p.getSprice()%></span> <strike
									class="product_discount"> <span style='color: black'><%=p.getCprice()%></span></strike>
							</div>
							<div>
								<span class="product_saved">You Saved</span> <span
									style='color: black'><%=p.getCprice()-p.getSprice()%></span>
							</div>
							<hr class="singleline">
							<div>
								<span class="product_info">EMI starts at $ 2,000. No Cost
									EMI Available</span><br> <span class="product_info">Warranty:
											6 months warranty</span><br> <span
												class="product_info">7 Days easy return policy</span><br>
														<span class="product_info">7 Days easy return
															policy</span><br> <span class="product_info">In
																	Stock: 25 units sold this week</span>
							</div>
							<div>
								<div class="row">
									<div class="col-md-5">
										<div class="br-dashed">
											<div class="row">
												<div class="col-md-3 col-xs-3">
													<img
														src="https://img.icons8.com/color/48/000000/price-tag.png">
												</div>
												<div class="col-md-9 col-xs-9">
													<div class="pr-info">
														<span class="break-all">Get 5% instant discount +
															10X rewards @ RENTOPC</span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-7"></div>
								</div>
								<!-- <div class="row" style="margin-top: 15px;">
									<div class="col-xs-6" style="margin-left: 15px;">
										<span class="product_options">Color Options</span><br>
										<button class="btn btn-primary btn-sm">White</button>
										<button class="btn btn-primary btn-sm">Grey</button>
										<button class="btn btn-primary btn-sm">Black</button>
									</div>
									<div class="col-xs-6" style="margin-left: 55px;">
										<span class="product_options">Side</span><br>
										<button class="btn btn-primary btn-sm">Left</button>
										<button class="btn btn-primary btn-sm">Right</button>
									</div>
								</div>
							</div>
							<hr class="singleline">
							<div class="order_info d-flex flex-row">
						
							</div> -->
							<form action="#">
							<div class="row">
								<!-- <div class="col-xs-6" style="margin-left: 13px;">
									<div class="product_quantity">
										<span>QTY: </span> <input id="quantity_input" type="text"
											pattern="[0-9]*" value="1">
										<div class="quantity_buttons">
											<div id="quantity_inc_button"
												class="quantity_inc quantity_control">
												<i class="fas fa-chevron-up"></i>
											</div>
											<div id="quantity_dec_button"
												class="quantity_dec quantity_control">
												<i class="fas fa-chevron-down"></i>
											</div>
										</div>
									</div>
								</div> -->
								<div class="col-xs-6">
								<%if(u==null){
									
								%>
								<a class="btn btn-primary btn-lg" href="Login.jsp">Add
											to Cart</a>
								<%}else{
									%>
									<a class="btn btn-primary btn-lg" href="Cartservlet?pid=<%=p.getPid()%>&&uid=<%=u.getId()%>">Add
											to Cart</a>
								<%} %>
									
									<a class="btn btn-success btn-lg">Shop</a>
									<div class="product_fav">
										<i class="fas fa-heart"></i>
									</div>
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<%@include file="static_components/footer.jsp" %>
</body>
</html>