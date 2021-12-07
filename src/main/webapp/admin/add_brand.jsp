<%@page import="com.entity.Brand"%>
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
<%@include file ="navbar.jsp" %>
<style type="text/css">
 /* .container {
  padding: 2rem 0rem;
}  */

h4 {
  margin: 2rem 0rem 1rem;
}

.table-image {td, th { vertical-align: middle;}
}
</style>
</head>
<body>
<br><br>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class= "text-center">Add Brand</h4>
<c:if test="${not empty succMsg}">
 <p class="text-center text-success">${succMsg} </p>
 <c:remove var="succMsg" scope="session"/>
 </c:if>
 
 <c:if test="${not empty failedMsg}">
 <p class="text-center text-danger">${failedMsg} </p>
 <c:remove var="failedMsg" scope="session"/>
 </c:if>
<form action="../Addbrand" method="post">
  <div class="form-group">
    <label for="brandname">Brand Name</label>
    <input type="text" class="form-control" id="brandname" name="brandname">
   <!--  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="brandtype">Brand Type</label>
    <select class="form-control" id="brandtype" name="brandtype">
      <option value="OEM" >OEM</option>
      <option value="Aftermarket" >Aftermarket</option>
    </select>
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>
<div>
<header class="bg-dark py-0">
            <div class="container px-4 px-lg-5 my-5"  ><!-- style="padding: 2rem 0rem;" -->
                <div class="text-center text-white">
                    <h2 class="display-4 fw-bolder"> Brand Table</h2>
                    <!-- <p class="lead fw-normal text-white-50 mb-0">Product Table!!!</p> -->
                </div>
            </div>
        </header>
<div class="container table-responsive py-3">
  <div class="row">
    <div class="col-12">
      <table class="table table-bordered table-hover">
        <thead class="thead-dark">
          <tr>
            
            <th scope="col">PID</th>
            <th scope="col">Brand name</th>
            <th scope="col">Brand Type</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
         <% ProductDAOImpl pdao=new ProductDAOImpl(DBConnect.getConn());
        List<Brand> list = pdao.getBrandall();
        for (Brand b : list) {	
        %>
        <tr>
            <!-- <th scope="row">1</th> -->
            <td><%=b.getBid()%></td>
            <td><%=b.getBname()%></td>
            <td><%=b.getBtype()%></td>
            <td>
              <!-- <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button> -->
              <button type="button" class="btn btn-success"><i class="fas fa-edit"></i></button>
            <!-- <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button> -->
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