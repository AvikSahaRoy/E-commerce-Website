<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Change Password</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>
.form-signinn {
	 background-color: #152733 !important;
	 border-radius: 10px;
}

.ff {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 85vh;
}

.form-signinn {
  max-width: 450px;
  width: 100%;
  padding: 35px;
  margin: auto;
  border: 3px solid #ffc107;
}

.cp {
	text-align: center;
	font-size: 35px;
	color: white;
}

.home a{
	text-decoration: none;
	font-weight: bold;
	color: white;
	font-size: 20px;
}

</style>

<body>
<!-- Navbar Start ------------------------------------------->
<%@ include file="Navbar.jsp"%>
<div class="container ff">
	<main class="form-signinn">
	  <form action="ChangePassword2.jsp" method="post">
	    <h1 class="mb-4 fw-bold cp text-warning">Change Password</h1>
	
	    <div class="form-floating mb-2">
	      <input  class="form-control" id="floatingInput" name="cpass" placeholder="Current Password" required>
	      <label for="floatingInput">Current Password</label>
	    </div>
	    
	    <div class="form-floating mb-2">
	      <input class="form-control" id="password" name="newpass" placeholder="New Password"
	      type="password"
		  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{8,19}"
		  title="Must contain at least one number, one special character, one uppercase, lowercase letter, and at least 8 or more characters"
		  required>
	      <label for="floatingPassword">New Password</label>
	    </div>
	    
	    <div class="form-floating mb-4">
	      <input  class="form-control" placeholder="Confirm New Password" 
	      type="password" name="confirmpassword" id="confirmpassword" required>
	      <label for="floatingPassword">Confirm New Password</label>
	    </div>
	
	    <button class="w-100 btn btn-lg btn-outline-warning mb-2" type="submit">Update</button>
	  </form>
	</main>
</div>
	<!-- Footer Start ------------------------------------------->
	<%@ include file="Footer.jsp"%>
</body>
<script>
// Password and Confirm Password Matching -------------------
var password = document.getElementById("password"), confirm_password = document
		.getElementById("confirmpassword");

function validatePassword() {
	if (password.value != confirm_password.value) {
		confirm_password.setCustomValidity("Passwords Don't Match");
	} else {
		confirm_password.setCustomValidity('');
	}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
</script>
</html>