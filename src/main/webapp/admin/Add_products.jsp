<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add product</title>
<%@include file ="allCss.jsp" %>
<%@include file ="navbar.jsp" %>
</head>
<!-- <body align= "center"> -->
<br><br>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class= "text-center">Add Product</h4>
<c:if test="${not empty succMsg}">
 <p class="text-center text-success">${succMsg} </p>
 <c:remove var="succMsg" scope="session"/>
 </c:if>
 
 <c:if test="${not empty failedMsg}">
 <p class="text-center text-danger">${failedMsg} </p>
 <c:remove var="failedMsg" scope="session"/>
 </c:if>
<form action="../Addproductservlet" method="post" enctype="multipart/form-data"> <!--  -->
  <div class="form-group">
    <label for="Pname">Product Name</label>
    <input type="text" class="form-control" id="Pname" name="Pname">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
 <!--  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div> -->
  <div class="form-group">
    <label for="manuf_no">Manufacturer No</label>
    <input type="text" class="form-control" id="manuf_no" name="manuf_no">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="Bname">Brand Name</label>
    <select class="form-control" id="Bname" name="Bname">
      <option>--Select--</option>

    </select>
  </div>
  
  <div class="form-group">
    <label for="VMname">Model Name</label>
    <select class="form-control" id="VMname" name="VMname">
     <option>Select Model</option>
    </select>
  </div>
    <div class="form-group">
    <label for="cprice">Cost Price</label>
    <input type="text" class="form-control" id="cprice" name="cprice">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
    <div class="form-group">
    <label for="sprice">Selling Price</label>
    <input type="text" class="form-control" id="sprice" name="sprice">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
 
  <div class="form-group">
    <label for="Pdec">Product Description</label>
    <textarea  class="form-control"  id="Pdec" name="Pdec" rows="4" cols="50"></textarea>
  </div>
  <div class="form-group">
    <label for="Pdetail">Product Detail</label>
    <textarea type="text" class="form-control" id="Pdetail" name="Pdetail" rows="4" cols="50"></textarea>
  </div>
   <div class="form-group">
    <label for="qty">Quantity</label>
    <input type="text" class="form-control" id="qty" name="qty">
  </div>
  
  
  <div class="form-group">
    <label for="Pimg1">Product Img 1</label>
    <input type="file" class="form-control-file" id="Pimg1" name="Pimg1">
  </div>
   <div class="form-group">
    <label for="Pimg2">Product Img 2</label>
    <input type="file" class="form-control-file" id="Pimg2" name="Pimg2">
  </div>
   <div class="form-group">
    <label for="Pimg3">Product Img 3</label>
    <input type="file" class="form-control-file" id="Pimg3" name="Pimg3">
  </div>
  <div class="form-group">
    <label for="status">Status</label>
    <select class="form-control" id="status" name="status">
      <option value="Available">Available</option>
		<option value="Not Available">Not Available</option>
    </select>
  </div>
  
 <!--  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div> -->
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>
</div>
</div>
</div>
<%@include file ="footer.jsp" %>
<script type="text/javascript">
$(document).ready(function () {
	$('#Bname').find('option').remove();
	$('#Bname').append('<option>Select Brand</option>'); 
    $.ajax({
        url: "../getbrandnDetails",
        method: "GET",
        data: {operation: 'brand'},
        success: function (data, textStatus, jqXHR) {
            
            console.log(data);
            let obj = $.parseJSON(data);
            
            $.each(obj, function (key, value) {
            	
            
                $('#Bname').append('<option value="' + value.Bid + '">' + value.bname + '</option>')
            });
              //$('#Brandname').formSelect(); 
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#Bname').append('<option>Brand Unavailable</option>'); 
        },
        cache: false
    });
});

$('#Bname').change(function () {
    $('#VMname').find('option').remove();
   

    let bid = $('#Bname').val();
    let data = {
        operation: "vmodel",
        id: bid
    };

    $.ajax({
        url: "../getbrandnDetails",
        method: "GET",
        data: data,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            let obj = $.parseJSON(data);
            $.each(obj, function (key, value) {
                $('#VMname').append('<option value="' + value.vmid + '">' + value.vmname + '</option>')
            });
           /*  $('select').formSelect(); */
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#VMname').append('<option>Model Unavailable</option>');
        },
        cache: false
    });
});
</script>
</body>
</html>