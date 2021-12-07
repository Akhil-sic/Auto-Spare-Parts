<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="home.jsp"><img src="static_components/logo1.png" style="border-radius:50px !important;" alt="lvmbt" width="40px" height="40px"/>  Spare Garage</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>  
  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#"></a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="req_product.jsp">Request Product</a>
      </li>
    </ul>
  	<form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form> 
    <ul class="navbar-nav ml-auto">
    
	<c:if test="${not empty userobj}">
	<li class="nav-item">
        <a class="nav-link">Welcome, ${userobj.name}</a>

      </li> 
      <li class="nav-item">
        <a class="nav-link" href="ot_cart.jsp"><i class="fas fa-cart-plus fa-1x"></i><span class="badge badge-pill badge-light">9</span></a>
      </li>    
      <li class="nav-item">
        <!-- <a class="btn btn-outline-light btn-md" href="../Logout">Logout</a> -->
        <button type="button" class="btn btn-outline-light btn-md" data-toggle="modal" data-target="#exampleModalCenter">
  	Logout
	</button>
      </li> 
      
</c:if>
<c:if test="${empty userobj}">
<li class="nav-item">
    <!-- <button class ="btn btn-default navbar-btn" href="~/Register.jsp">Register</button> -->
		<a class="nav-link" href="Register.jsp">Register</a>
	</li>
<li class="nav-item">
		<a class="btn btn-outline-light btn-md" href="Login.jsp">Login</a>
	</li>
</c:if>
      </ul>
  </div>
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Logout Now</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- <div class="modal-body">
       
      </div> -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Don't</button>
        <a class="btn btn-outline-dark" href="Logout">Logout</a>
      </div>
    </div>
  </div>
</div>
</nav>
 