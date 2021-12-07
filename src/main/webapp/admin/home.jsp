<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
<%@include file="navbar.jsp"%>
<style type="text/css">
.card-body:hover
{
	transform: scale(1.2);
}
</style>
</head>
<body>
<br><br>
    <div class="col-sm-12">
      <div class="well">
       <font color="black"> <h4>Admin Dashboard</h4>
        <p>WELCOME to Spare Garage</p></font>
      </div>
      <br><br><br><br>
      <div class="container md-auto">
      <div class="row justify-content-center">
      <div class="col-sm-2">
          <div class="card-body text-center">
           <a href="Add_products.jsp">        
            <img src="../static_components/addicon1.png" alt="lvmbt" width="90" height="90">          
           </a>
           <h6>Add Products</h6>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="card-body text-center">
      <a href="dis_products.jsp">
     <img src="../static_components/productlisticon1.png" alt="lvmbt" width="90" height="90">
     </a>
     <h6>List Products</h6>
     </div>
    </div>
      </div>
      <br>
      <div class="row justify-content-center">
      <div class="col-sm-2">
          <div class="card-body text-center">
      <a href="orderlist.jsp">
     <img src="../static_components/orderlist1.png" alt="lvmbt" width="90" height="90"> 
     </a>
     <h6>Order List</h6>
          </div>
        </div>
      <div class="col-sm-2">
          <div class="card-body text-center">
      <a href="user_list.jsp">
     <img src="../static_components/users.png" alt="lvmbt" width="90" height="90">  
       </a>
       <h6>Users</h6>
          </div>
        </div>
      </div>
      </div>
     </div>       
<br><br>
<%@include file="footer.jsp"%>
</body>
</html>