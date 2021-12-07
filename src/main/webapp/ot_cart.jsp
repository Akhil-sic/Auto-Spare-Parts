<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="static_components/allCss.jsp"%>
<link rel="stylesheet" href="static_components/cstyle.css">
</head>
<body>
<%@include file="static_components/navbar.jsp"%>

<div class="container-fluid">
    <div class="row">
        <aside class="col-lg-9">
            <div class="card">
            		<c:if test="${empty userobj}">
						<c:redirect url="Login.jsp"></c:redirect>
					</c:if>
					<c:if test="${not empty delcart}">
						<h4 class="text-center text-success">${delcart}</h4>
						<c:remove var="delcart" scope="session" />
					</c:if>

					<c:if test="${not empty dcfailed}">
						<h4 class="text-center text-danger">${dcfailed}</h4>
						<c:remove var="dcfailed" scope="session" />
					</c:if>
					<div class="table-responsive">
                    <table class="table table-borderless table-shopping-cart">
                        <thead class="text-muted">
                            <tr class="small text-uppercase">
                                <th scope="col">Product</th>
                                <th scope="col" width="120">Quantity</th>
                                <th scope="col" width="120">Price</th>
                                <th scope="col" class="text-right d-none d-md-block" width="200"></th>
                            </tr>
                        </thead>
                        <tbody>
                        <% 
                        User u=(User)session.getAttribute("userobj");
                        int uid=u.getId();
                        CartDAOImpl cdao = new CartDAOImpl(DBConnect.getConn());
                        Double ut_price=0.0;
					        List<Cart> list = cdao.getCart(uid);
					        for (Cart c : list) {	
					        %>
                            <tr>
                                <td>
                                    <figure class="itemside align-items-center">
                                        <!-- <div class="aside"><img src="static_components/not avail.png" class="img-sm"></div> -->
                                        <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true"><%=c.getP_name()%></a>
                                            <p class="text-muted small"> <br> Brand: <%=c.getP_brand()%></p>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td> <label class="form-control"><%=c.getQty()%></label> </td>
                                <td>
                                    <div class="price-wrap"> <var class="price">Rs.<%=c.getTot_price()%></var> <small class="text-muted">Rs.<%=c.getPrice()%> each </small> </div>
                                </td>
                                <td class="text-right d-none d-md-block"> <a href="Delcartservlet?pid=<%=c.getPid()%>&&uid=<%=uid%>" class="btn btn-light" data-abc="true"> Remove</a> </td>
                            </tr>
                            <% ut_price+=c.getTot_price();
                            }
                            %>
                            <tr>
									<td class="">
										<div class="price-wrap">
											<var class="price">
												Cart Total Rs.<%=ut_price%></var>
										</div>
									</td>
								</tr>
                            <!-- <tr>
                                <td>
                                    <figure class="itemside align-items-center">
                                        <div class="aside"><img src="https://i.imgur.com/hqiAldf.jpg" class="img-sm"></div>
                                        <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true">Flower Formal T-shirt</a>
                                            <p class="text-muted small">SIZE: L <br> Brand: ADDA </p>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td> <select class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select> </td>
                                <td>
                                    <div class="price-wrap"> <var class="price">$15</var> <small class="text-muted"> $12 each </small> </div>
                                </td>
                                <td class="text-right d-none d-md-block"> <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-light" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a> <a href="" class="btn btn-light btn-round" data-abc="true"> Remove</a> </td>
                            </tr>
                            <tr>
                                <td>
                                    <figure class="itemside align-items-center">
                                        <div class="aside"><img src="https://i.imgur.com/UwvU0cT.jpg" class="img-sm"></div>
                                        <figcaption class="info"> <a href="#" class="title text-dark" data-abc="true">Printed White Tshirt</a>
                                            <p class="small text-muted">SIZE:M <br> Brand: Cantabil</p>
                                        </figcaption>
                                    </figure>
                                </td>
                                <td> <select class="form-control">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select> </td>
                                <td>
                                    <div class="price-wrap"> <var class="price">$9</var> <small class="text-muted"> $6 each</small> </div>
                                </td>
                                <td class="text-right d-none d-md-block"> <a data-original-title="Save to Wishlist" title="" href="" class="btn btn-light" data-toggle="tooltip" data-abc="true"> <i class="fa fa-heart"></i></a> <a href="" class="btn btn-light btn-round" data-abc="true"> Remove</a> </td>
                            </tr> -->
                       </tbody>
                    </table>
                </div>
            </div>
        </aside>
        <aside class="col-lg-3">
            <!-- <div class="card mb-3">
                <div class="card-body">
                     <form>
                        <div class="form-group"> <label>Have coupon?</label>
                            <div class="input-group"> <input type="text" class="form-control coupon" name="" placeholder="Coupon code"> <span class="input-group-append"> <button class="btn btn-primary btn-apply coupon">Apply</button> </span> </div>
                        </div>
                    </form> 
                </div>
            </div> -->
            <div class="card">
                <div class="card-body">
						<form action="Orderservlet" method="post">
							<input type="hidden" id="usid" name="usid" value="${userobj.id}">
							<div class="form-group">
								<label for="uname">Name</label> 
								<input type="text"
									class="form-control" id="uname" name="uname" value="${userobj.name}">
								<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
							</div>

							<div class="form-group">
								<label for="email">email</label> 
								<input type="text"
									class="form-control" id="email" name="email" value="${userobj.email}">
								<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
							</div>

							<div class="form-group">
								<label for="phno">Phone no</label> 
								<input type="text"
									class="form-control" id="phno" name="phno" value="${userobj.phno}">
								<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
							</div>
							
							<div class="form-group">
								<label for="adrs">Full Address</label>
								<textarea class="form-control" id="adrs" name="adrs" rows="4"
									cols="50"></textarea>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									id="paymode" name="paymode">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>

							<dl class="dlist-align">
								<dt>Total:</dt>
								<dd class="text-right text-dark b ml-3">
									<strong>Rs.<%=ut_price%></strong>
								</dd>
							</dl>
							<hr>
							<button type="submit" class="btn btn-out btn-primary btn-square btn-main">Place Order</button>
							<!-- a href="#" class="btn btn-out btn-primary btn-square btn-main"
								data-abc="true"> Make Purchase </a> --> <a href="home.jsp"
								class="btn btn-out btn-success btn-square btn-main mt-2"
								data-abc="true">Continue Shopping</a>
						</form>
						<!-- <dl class="dlist-align">
                        <dt>Total price:</dt>
                        <dd class="text-right ml-3">$69.97</dd>
                    </dl>
                    <dl class="dlist-align">
                        <dt>Discount:</dt>
                        <dd class="text-right text-danger ml-3">- $10.00</dd>
                    </dl> -->
                    </div>
            </div>
        </aside>
    </div>
</div>
<%@include file="static_components/footer.jsp"%>
</body>
</html>