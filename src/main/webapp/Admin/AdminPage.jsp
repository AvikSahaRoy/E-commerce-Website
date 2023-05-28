<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.icon {
	color: #1DB954;
	font-size: 23px;
}

.nav-item a:hover {
	color: #1DB954 !important;
}

</style>
<body>

	
  <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px; height: 754px;">
    <a href="UserDetails.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
      
      <i class="bi bi-bag-heart-fill icon"></i>&nbsp&nbsp<span class="fs-5"><b>Shopme Admin Page</b></span>
      
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
    
      <li class="nav-item">
		  <a href="UserDetails.jsp" class="nav-link text-white">
          <i class="bi bi-table" width="16" height="16"></i>
          &nbsp User Table
        </a>
      </li>
      
      <li class="nav-item">
        <a href="UserSearchEmailForm.jsp" class="nav-link text-white">
        	<i class="bi bi-search" width="16" height="16"></i>
          &nbsp User Search
        </a>
      </li>
      
      <li class="nav-item">
		  <a href="ContactUsDetails.jsp" class="nav-link text-white">
          <i class="bi bi-person-lines-fill" width="16" height="16"></i>
          &nbsp Contact Us Table
        </a>
      </li>
      
      <li class="nav-item">
		  <a href="ProductDetails.jsp" class="nav-link text-white">
          <i class="bi bi-bag" width="16" height="16"></i>
          &nbsp Product Table
        </a>
      </li>
      
      <li class="nav-item">
		  <a href="AddToProduct.jsp" class="nav-link text-white">
          <i class="bi bi-bag-check" width="16" height="16"></i>
          &nbsp Add To Product
        </a>
      </li>
     <li class="nav-item">
		  <a href="CartTable.jsp" class="nav-link text-white">
          <i class="bi bi-cart3" width="16" height="16"></i>
          &nbsp User Cart Table
        </a>
      </li>
     <li class="nav-item">
		  <a href="UserOrders.jsp" class="nav-link text-white">
          <i class="bi bi-truck" width="16" height="16"></i>
          &nbsp User Order Table
        </a>
      </li>


    </ul>
    <hr>
    <a href="AdminLogout.jsp" type="button" class="btn btn-danger"><i class="bi bi-box-arrow-in-left"></i> Logout</a>
  </div> 


</body>
</html>