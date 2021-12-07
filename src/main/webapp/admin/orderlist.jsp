<%@page import="com.entity.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file ="allCss.jsp" %>
</head>
<body>
<%@include file ="navbar.jsp"%>
<div>
<header class="bg-dark py-0">
            <div class="container px-4 px-lg-5 my-3"  ><!-- style="padding: 2rem 0rem;" -->
                <div class="text-center text-white">
                    <h2 class="display-4 fw-bolder">Table</h2>
                    <!-- <p class="lead fw-normal text-white-50 mb-0">Product Table!!!</p> -->
                </div>
            </div>
        </header>
<div class="container table-fixed">
  <div class="row">
    <div class="col-12">
      <table class="table table-bordered table-hover">
        <thead class="thead-dark">
          <tr>
            <th scope="col">Order ID</th>
            <th scope="col">User Name</th>
            <th scope="col">E-mail</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col">Payment Type</th>
            <th scope="col">Payment Type</th>
            <th scope="col">price each.(Rs)</th>
            <!-- <th scope="col">Actions</th> -->
          </tr>
        </thead>
        <tbody>
        <% 	OrderDAOImpl dao2 = new OrderDAOImpl(DBConnect.getConn());
        List<Orders> list = dao2.getOrders();
        for (Orders p : list) {	
        %>
        <tr>
            <td><%=p.getOrder_id()%></td>
            <td><%=p.getU_name()%></td>
            <td><%=p.getU_email()%></td>
            <td><%=p.getP_name()%></td>
            <td><%=p.getQty()%></td>
            <td><%=p.getPay_type()%></td>
            <td><%=p.getPay_status()%></td>
            <td><%=p.getPrice()%></td>
           <%--  <td>
              <!-- <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button> -->
              <a class="btn btn-success" href="edit_products.jsp?id=<%=p.getPid()%>"><i class="fas fa-edit"></i></a>
            <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
            </td> --%>
          </tr>
		<%
        }
		%>
          
          
        </tbody>
      </table>
    </div>
  </div>
</div>
</div>
</body>
</html>