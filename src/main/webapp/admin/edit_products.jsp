<%@page import="com.entity.Products"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Products</title>
<%@include file ="allCss.jsp"%>
<%@include file ="navbar.jsp"%>
</head>
<body>
<br><br>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class= "text-center">Add Product</h4>

 <%
 int id=Integer.parseInt(request.getParameter("id"));  
 ProductDAOImpl pdao=new ProductDAOImpl(DBConnect.getConn());
 Products p=pdao.getProductsByid(id);
 
 %>
<form action="../Editproductservlet" method="post" > <!--  -->
	<input type="hidden"  id="Pid" name="Pid" value="<%=p.getPid()%>">
  <div class="form-group">
    <label for="Pname">Product Name</label>
    <input type="text" class="form-control" id="Pname" name="Pname" value="<%=p.getPname()%>">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
 <!--  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div> -->
  <div class="form-group">
    <label for="manuf_no">Manufacturer No</label>
    <input type="text" class="form-control" id="manuf_no" name="manuf_no" value="<%=p.getManuf_no()%>">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
  <div class="form-group">
    <label for="Bname">Brand Name</label>
    <select class="form-control" id="Bname" name="Bname">
      <option value="<%=p.getBr_id()%>"><%=p.getBname()%></option>
    </select>
  </div>
  
  
  <div class="form-group">
    <label for="VMname">Model Name</label>
    <select class="form-control" id="VMname" name="VMname">
     <option value="<%=p.getVm_id()%>"><%=p.getVmname()%></option>
    </select>
  </div>
    <div class="form-group">
    <label for="cprice">Cost Price</label>
    <input type="text" class="form-control" id="cprice" name="cprice" value="<%=p.getCprice()%>">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
    <div class="form-group">
    <label for="sprice">Selling Price</label>
    <input type="text" class="form-control" id="sprice" name="sprice" value="<%=p.getSprice()%>">
    <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
  </div>
 
  <div class="form-group">
    <label for="Pdec">Product Description</label>
    <textarea  class="form-control"  id="Pdec" name="Pdec" rows="4" cols="50"><%=p.getPescription()%></textarea>
  </div>
  <div class="form-group">
    <label for="Pdetail">Product Detail</label>
    <textarea class="form-control" id="Pdetail" name="Pdetail" rows="4" cols="50"><%=p.getPdetail()%></textarea>
  </div>
   <div class="form-group">
    <label for="qty">Quantity</label>
    <input type="text" class="form-control" id="qty" name="qty" value="<%=p.getQantity()%>">
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
<%@include file ="footer.jsp"%>
<script type="text/javascript" src="ajaxdd_load.js">
</script>

</body>
</html>