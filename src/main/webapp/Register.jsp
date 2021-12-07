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
<link href="static_components/Custome.css" rel="stylesheet" />
<link href="static_components/reg_style.css" rel="stylesheet" />
<style>
    body {background-color: black;} 
</style>

</head>
<body>
<%@include file="static_components/navbar.jsp"%>


         
                <div class="form-body">
                    <div class="row justify-content-center">
                        <div class="form-holder">
                            <div class="form-content">
                                <div class="form-items">
                                    <!-- <label ID="lblMsg" class="invalid-feedback"></label> -->

                                    <!-- <%--<asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>--%> -->
                                    <h3>Register</h3>
                                    <p>Fill in the data below.</p>
                                    <c:if test="${not empty succMsg}">
                                    <p class="text-center text-success">${succMsg} </p>
                                    <c:remove var="succMsg" scope="session"/>
                                    </c:if>
                                    
                                    <c:if test="${not empty failedMsg}">
                                    <p class="text-center text-danger">${failedMsg} </p>
                                    <c:remove var="failedMsg" scope="session"/>
                                    </c:if>
                                    <!-- <form class="requires-validation"> -->
                                    <form id="reg" name="reg" action="Register" method="post">
                                        <div class="col-md-12">
                                            <input id="txtname"  class="form-control" name="fname" type="text" placeholder="Full Name" />
                               
                                        </div>
                                        <div class="col-md-12">
                                            <input id="txtemail"  class="form-control" name="email" type="email" name="email" placeholder="E-mail Address" required="required"/>
                                            <!-- <%--<input class="form-control" type="email" name="email" placeholder="E-mail Address" required>--%> -->
                         
                                        </div>
                                        
                                         <div class="col-md-12">
								<input id="txtphone" class="form-control" name="phone"
									type="text" placeholder="Phone Number" required="required"
									pattern="[1-9]{1}[0-9]{9}" maxlength="10" />


							</div>
                                        <div class="col-md-12">
                                         
                                            <input class="form-control" id="txtpass" type="password" name="password" placeholder="Password" required="required" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{6,15}$"/>
                                            
                                        </div>
                                        <div class="col-md-12">
                                            
                                            <input class="form-control" id="txtconpass" type="password" name="confirmpassword" placeholder="Confirm Password" required="required"/>
                                            
                                        </div>
                                        
                                        
                                        <div class="col-md-12 mt-3">
                                            <label class="mb-3 mr-1" for="gender" aria-selected="undefined">gender:</label>
                                            
                                           <label class="radio-inline"><input id="rd1" type="radio" name="gender" value="Male" checked/>Male</label>
                                            
                                        
                                            <label class="radio-inline"><input id="rd2" type="radio" name="gender" value="Female"/>Female</label>

                                            
                                            <label class="radio-inline"><input id="rd3" type="radio" name="gender" value="Others"/>Others</label>
                                            
                                        </div>
                                        <p id="lbl" class="text-center text-danger"></p>

                                         <div class="form-button mt-3">
                                            
                                            <button id="submit" type="submit" class="btn btn-primary">Register</button>
                                            <br />
                                            <a href="~/Login.jsp" class="forgot-password">I have an Account</a>
                                            
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<script>
    function checkPasswordMatch() {
        var password = $("#txtpass").val();
        var confirmPassword = $("#txtconpass").val();
        if (password != confirmPassword)
            $("#lbl").html("Passwords does not match!");
        else
            $("#lbl").html("Passwords match.");
    }
    $(document).ready(function () {
       $("#txtConfirmPassword").keyup(checkPasswordMatch);
    });
    </script>
	

<%@include file="static_components/footer.jsp" %>
<!-- <script type="text/javascript" src="static_components/script3/formvalidate.js"> 
</script>-->
</body>
</html>