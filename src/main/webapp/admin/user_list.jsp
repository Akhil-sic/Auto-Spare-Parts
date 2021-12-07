<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file ="allCss.jsp"%>

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
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">ph no</th>
            <th scope="col">Gender</th>
            <th scope="col">User Type</th>
            <!-- <th scope="col">Availability</th> -->
           <!--  <th scope="col">Actions</th> -->
          </tr>
        </thead>
        <tbody>
        <% UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
        List<User> list = dao.get_users();
        for (User u : list) {	
        %>
        <tr>
            <td><%=u.getId()%></td>
            <td><%=u.getName()%></td>
            <td><%=u.getEmail()%></td>
            <td><%=u.getPhno()%></td>
            <td><%=u.getGender()%></td>
            <td><%=u.getUsertype()%></td>
            <!-- <td>
              <button type="button" class="btn btn-primary"><i class="far fa-eye"></i></button>
              <a class="btn btn-success" href=""><i class="fas fa-edit"></i></a>
            <button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
            </td> -->
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