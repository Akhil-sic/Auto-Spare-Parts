<%@page import="com.entity.Req_productentity"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
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
</head>
<body>
<%@include file ="navbar.jsp" %>
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
            <th scope="col">User name</th>
            <th scope="col">Product name</th>
            <th scope="col">Brand</th>
            <th scope="col">Model</th>
            <th scope="col">Model Year</th>
            <th scope="col">Qty</th>
            <th scope="col">Status</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
        <% UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
        List<Req_productentity> list = dao.get_reqProducts();
        for (Req_productentity p : list) {	
        %>
        <tr>
            <td><%=p.getReqid()%></td>
            <td><%=p.getName()%></td>
            <td><%=p.getPname()%></td>
            <td><%=p.getBrand()%></td>
            <td><%=p.getModel()%></td>
            <td><%=p.getYear()%></td>
            <td><%=p.getQantity()%></td>
            <td><%=p.getStatus()%></td>
            <td>
              <!-- <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button> -->
              <a class="btn btn-success" href="edit_products.jsp?id=<%=p.getReqid()%>"><i class="fas fa-edit"></i></a>
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