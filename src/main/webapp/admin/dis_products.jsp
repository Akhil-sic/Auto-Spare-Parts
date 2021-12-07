<%@page import="com.entity.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file ="allCss.jsp" %>


<style type="text/css">
 .container {
  padding: 2rem 0rem;
}  

h4 {
  margin: 2rem 0rem 1rem;
}

.table-image {td, th { vertical-align: middle;}
}
</style>
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
        <c:if test="${not empty succMsg}">
 <p class="text-center text-success">${succMsg} </p>
 <c:remove var="succMsg" scope="session"/>
 </c:if>
 
 <c:if test="${not empty failedMsg}">
 <p class="text-center text-danger">${failedMsg} </p>
 <c:remove var="failedMsg" scope="session"/>
 </c:if>
<div class="container table-fixed">
  <div class="row">
    <div class="col-12">
      <table class="table table-bordered table-hover">
        <thead class="thead-dark">
          <tr>
            <th scope="col">PID</th>
            <th scope="col">Img</th>
            <th scope="col">Product name</th>
            <th scope="col">Manuf no</th>
            <th scope="col">Brand</th>
            <th scope="col">Model</th>
            <th scope="col">Model Year</th>
            <th scope="col">Cost price(Rs)</th>
            <th scope="col">Selling price(Rs)</th>
            <!-- <th scope="col">Discount</th> -->
            <!-- <th scope="col">P Category</th> -->
            <th scope="col">Qty</th>
            <th scope="col">Status</th>
            <!-- <th scope="col">Availability</th> -->
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
        <% ProductDAOImpl pdao=new ProductDAOImpl(DBConnect.getConn());
        List<Products> list = pdao.getProducts();
        for (Products p : list) {	
        %>
        <tr>
            <td><%=p.getPid()%></td>
            <td><img alt="" src="../images/<%=p.getPimg1()%>" width="50px" height="50px"></td>
            <td><%=p.getPname()%></td>
            <td><%=p.getManuf_no()%></td>
            <td><%=p.getBname()%></td>
            <td><%=p.getVmname()%></td>
            <td><%=p.getVmyear()%></td>
            <td><%=p.getCprice()%></td>
            <td><%=p.getSprice()%></td>
            <td><%=p.getQantity()%></td>
            <td><%=p.getStatus()%></td>
            <td>
              <!-- <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button> -->
              <a class="btn btn-success" href="edit_products.jsp?id=<%=p.getPid()%>"><i class="fas fa-edit"></i></a>
            <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
            </td>
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