<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <title>Shopme - User Login</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
<!-- Font Awsome link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

</head>
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap")
	;

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
	transition: ease 0.5s;
}

body, html {
	height: 100%;
	
}

/* ----------------------------------------- Username / Password? Create your Account
------------------------------------------------------------------------------------------ */
h6 a {
	font-size: 17px;
	color: #666666;
	margin: 0px;
}

h6 a:hover {
	text-decoration: none;
	color: #57b846;
}
/* ---------------------------------------------------------------- Login
------------------------------------------------------------------------------------------ */
.limiter {
	width: 100%;
	margin: 0 auto;
}

:root {
  --main-blue: #71b7e6;
  --main-purple: #9b59b6;
  --main-grey: #ccc;
  --sub-grey: #d9d9d9;
}

.container-login100 {
	width: 100%;
	min-height: 95vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 15px; /* Form left right padding */
	background: linear-gradient(135deg, var(--main-blue), var(--main-purple));
}

.wrap-login100 {
	width: 950px;
	background: #fff;
	border-radius: 10px;
	display: flex;
	justify-content: space-between;
	padding: 50px 100px 50px 60px;
}
/* ---------------------------------------------------------------- Login Image
------------------------------------------------------------------------------------------ */
.login100-pic {
	
	width: 420px;
}

.login100-pic img {
	max-width: 100%;
	height: 405px;
}

/* -------------form-title--------------------------------------- */
.login100-form {
	width: 290px;
}

.login100-form-title {
	font-family: "Poppins", sans-serif;
	font-size: 30px;
	color: #333333;
	line-height: 1.2;
	text-align: center;
	font-weight: bold;
	width: 100%;
	display: block;
	padding-bottom: 54px;
}

/* -------------input filed--------------------------------------- */
.wrap-input100 {
	position: relative;
	width: 100%;
	z-index: 1;
	margin-bottom: 10px;
}

.input100 {
	font-family: "Poppins", sans-serif;
	font-size: 15px;
	line-height: 1.5;
	color: #666666;
	display: block;
	width: 100%;
	background: #e6e6e6;
	height: 50px;
	border-radius: 25px;
	padding: 0 30px 0 68px;
	border: none;
}

/*------------------------------------------------------------------
[ Button ]*/
.container-login100-form-btn {
	width: 100%;
	padding-top: 20px;
}

.login100-form-btn {
	font-family: "Poppins", sans-serif;
	font-size: 15px;
	color: #fff;
	text-transform: uppercase;
	width: 100%;
	height: 50px;
	border-radius: 25px;
	background: #57b846;
	border: none;
}

.login100-form-btn:hover {
	background: #333333;
}

/* --------------------------------------------------Symbol Email & Password 
-------------------------------------------------------------------------------------*/
.symbol-input100 {
	font-size: 15px;
	display: flex;
	align-items: center;
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 100%;
	padding-left: 35px;
	pointer-events: none;
	color: #666666;
	transition: all 0.4s;
}

.input100:focus+.focus-input100+.symbol-input100 {
	color: #57b846;
	padding-left: 28px;
}
/*------------------------------------------------------------------
[ Responsive ]*/
@media ( max-width : 992px) {
	.wrap-login100 {
		padding: 177px 90px 33px 85px;
	}
	.login100-pic {
		width: 35%;
	}
	.login100-form {
		width: 50%;
	}
}

@media ( max-width : 768px) {
	.wrap-login100 {
		padding: 100px 80px 33px 80px;
	}
	.login100-pic {
		display: none;
	}
	.login100-form {
		width: 100%;
	}
}

@media ( max-width : 576px) {
	.wrap-login100 {
		padding: 100px 15px 33px 15px;
	}
}

.pass-txt {
	padding-top: 50px;
	text-align: center;
}

.sign-txt {
	padding-top: 10px;
	text-align: center;
}

.swal-text {
	font-size:25px;
	font-weight: bold;
}
</style>

<body>
<%@ include file="Navbar.jsp"%>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="Images/login.jpg" class="rounded" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="UserLogin2.jsp" method="post">
					<span class="login100-form-title"> User Login </span>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="email" name="email"
							placeholder="Email" required> 
							
						
							
						<span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pass"
							placeholder="Password" required> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">Login</button>
					</div>

					<div class="pass-txt">
						<h6><a href="forgotPassword.jsp?action=forgot">Forgot password?</a></h6>
					</div>
					<div class="sign-txt">
						<h6>Don't have an account? <a href="forgotPassword.jsp?action=regis">Register here</a></h6>
					</div>
					<!-- <div><center><h6><a href="Home.jsp">Go To Home</a></h6></center></div> -->
				</form>
			</div>
		</div>
	</div>
<%@ include file="Footer.jsp"%>
</body>

</html>