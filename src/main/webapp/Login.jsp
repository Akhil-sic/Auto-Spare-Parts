<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="static_components/allCss.jsp"%>
<link href="static_components/Custome.css" rel="stylesheet"/>
<link href="static_components/reg_style.css" rel="stylesheet"/>
<style>
    body {background-color: black;} 
</style>

</head>
<body>
<%@include file="static_components/navbar.jsp" %>
<script src="static_components/script3/formvalidate.js"></script>

         
                <div class="form-body">
                    <div class="row justify-content-center">
                        <div class="form-holder">
                            <div class="form-content">
                                <div class="form-items">
                                    <!-- <label ID="lblMsg" class="invalid-feedback"></label> -->

                                    <!-- <%--<asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>--%> -->
                                    <h3>Login</h3>
                                    <p>Enter your Credentials</p>
                                    <c:if test="${not empty failedMsg}">
                                    <p class="text-center text-danger">${failedMsg} </p>
                                    <c:remove var="failedMsg" scope="session"/>
                                    </c:if>
                                    <!-- <form class="requires-validation"> -->
                                    <form onsubmit ="return UserValid()" action="Login" method="post">
                                        
                                        <div class="col-md-12">
                                            <input id="txtemail"  class="form-control" name="email" type="email" name="email" placeholder="E-mail Address" required="required"/>
                                            <!-- <%--<input class="form-control" type="email" name="email" placeholder="E-mail Address" required>--%> -->
                         				</div>
                                        
                                        <div class="col-md-12">
                                         
                                            <input class="form-control" id="txtpass" type="password" name="password" placeholder="Password" required="required"/>
                                            
                                        </div>
                                        
                                        

                                         &nbsp &nbsp<div class="form-button mt-3">

                                            <button id="submit" type="submit" class="btn btn-primary">Login</button>
                                            <br>
                                            <a href="~/Register.jsp" class="forgot-password">Register</a>
                                            
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           
	

<%@include file="static_components/footer.jsp" %>
</body>
</html>