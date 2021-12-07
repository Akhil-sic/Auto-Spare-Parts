<%@page import="com.entity.Vmodel"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<h4 class= "text-center">Add Vehicle Model</h4>
<c:if test="${not empty succMsg}">
 <p class="text-center text-success">${succMsg} </p>
  <c:remove var="succMsg" scope="session"/>
 </c:if>
 
 <c:if test="${not empty failedMsg}">
 <p class="text-center text-danger">${failedMsg} </p>
 <c:remove var="failedMsg" scope="session"/>
 </c:if> 
<form action="../Addvmodelservlet" method="post">
  <div class="form-group">
    <label for="Modelname">Model Name</label>
    <input type="text" class="form-control" id="Modelname" name="Modelname">
  </div>
  <div class="form-group">
    <label for="Modelyear">Year</label>
    <input type="text" class="form-control" id="Modelyear" name="Modelyear">
  </div>
  <div class="form-group">
    <label >Brand Name</label>
    <select class="form-control" id="Brandname" name="Brandname">
      <option>--Select--</option>
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
                    <h2 class="display-4 fw-bolder">Model Table</h2>
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
            
            <th scope="col">VMID</th>
            <th scope="col">Brand name</th>
            <th scope="col">Model Name</th>
            <th scope="col">Model Year</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
         <% ProductDAOImpl pdao=new ProductDAOImpl(DBConnect.getConn());
        List<Vmodel> list = pdao.getVmodelall();
        for (Vmodel vm : list) {	
        %>
        <tr>
            <!-- <th scope="row">1</th> -->
            <td><%=vm.getVmid()%></td>
            <td><%=vm.getBname()%></td>
            <td><%=vm.getVmname()%></td>
            <td><%=vm.getVmyear()%></td>
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
<%@include file ="footer.jsp" %>
<script type="text/javascript">
$('#Brandname').click(function () {
    $.ajax({
        url: "../getbrandnDetails",
        method: "GET",
        data: {operation: 'brand'},
        success: function (data, textStatus, jqXHR) {
            console.log("data from servlet");
            console.log(data);
            let obj = $.parseJSON(data);
            $('#Brandname').find('option').remove();
            $.each(obj, function (key, value) {
            	
            	console.log("key ",key);
            	console.log("value ",value);
            	
                $('#Brandname').append('<option value="' + value.Bid + '">' + value.bname + '</option>')
            });
              //$('#Brandname').formSelect(); 
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $('#Brandname').append('<option>Brand Unavailable</option>'); 
        },
        cache: false
    });
});

</script>
</body>
</html>