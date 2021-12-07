<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="static_components/allCss.jsp"%>
</head>
<body>
<%@include file="static_components/navbar.jsp"%>
<br><br>
 <c:if test="${not empty userobj}">
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class= "text-center">Request Product</h4>
<c:if test="${not empty succMsg}">
 <p class="text-center text-success">${succMsg}</p>
 <c:remove var="succMsg" scope="session"/>
 </c:if>
 
 <c:if test="${not empty failedMsg}">
 <p class="text-center text-danger">${failedMsg} </p>
 <c:remove var="failedMsg" scope="session"/>
 </c:if>

<form action="Req_product" method="post">
<input type="hidden"  id="uid" name="uid" value="${userobj.id}"> 
  <div class="form-group">
    <label for="Pname">Product Name</label>
    <input type="text" class="form-control" id="Pname" name="Pname">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
 
  <div class="form-group">
    <label for="brand">Vehicle Brand</label>
    <input type="text" class="form-control" id="brand" name="brand">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  
    <div class="form-group">
    <label for="model">Vehicle Model</label>
    <input type="text" class="form-control" id="model" name="model">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
    <div class="form-group">
    <label for="year">Model Year</label>
    <input type="text" class="form-control" id="year" name="year">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
 
  <div class="form-group">
    <label for="Pdec">Product Description</label>
    <textarea  class="form-control"  id="Pdec" name="Pdec" rows="4" cols="50"></textarea>
    
  </div>
    <div class="form-group">
    <label for="qty">Quantity</label>
    <input type="text" class="form-control" id="qty" name="qty">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  
<!--   <div class="form-group">
    <label for="status">Status</label>
    <select class="form-control" id="status" name="status">
      <option value="Available">Available</option>
		<option value="Not Available">Not Available</option>
    </select>
  </div> -->
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>
</c:if>
<c:if test="${empty userobj}">
<c:redirect url="Login.jsp"/>  
</c:if>
<%@include file="static_components/footer.jsp"%>
</body>
</html>