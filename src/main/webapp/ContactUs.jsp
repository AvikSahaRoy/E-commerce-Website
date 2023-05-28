<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <title>Shopme | Contact US</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
</head>
<style>

.container-fluid{
	position: relative;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px 100px;
	margin-top: 30px;
	margin-bottom: 50px;
}

.container-fluid:after{
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	filter: blur(50px);
	z-index: -1;
}
.contact-box{
	max-width: 850px;
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	justify-content: center;
	align-items: center;
	text-align: center;
	background-color: #fff;
	box-shadow: 0px 0px 19px 5px rgba(0,0,0,0.19);
}

.left{
	background: url("Images/ContactUsImg.jpg") no-repeat center;
	background-size: cover;
	height: 100%;
}

.right{
	padding: 25px 40px;
}

h2{
	position: relative;
	padding: 0 0 10px;
	margin-bottom: 10px;
}

h2:after{
	content: '';
    position: absolute;
    left: 50%;
    bottom: 0;
    transform: translateX(-50%);
    height: 4px;
    width: 50px;
    border-radius: 2px;
    background-color: #2ecc71;
}

.field{
	width: 100%;
	border: 2px solid rgba(0, 0, 0, 0);
	outline: none;
	background-color: rgba(230, 230, 230, 0.6);
	padding: 0.5rem 1rem;
	font-size: 1.1rem;
	margin-bottom: 22px;
	transition: .3s;
}

.field:hover{
	background-color: rgba(0, 0, 0, 0.1);
}

textarea{
	min-height: 150px;
}

.right .btn{
	width: 100%;
	padding: 0.5rem 1rem;
	background-color: #2ecc71 !important;
	color: #fff;
	font-size: 1.1rem;
	border: none;
	outline: none;
	cursor: pointer;
	transition: .3s;
}

.right .btn:hover{
    background-color: #27ae60 !important;
}

.field:focus{
    border: 2px solid rgba(30,85,250,0.47);
    background-color: #fff;
}

@media screen and (max-width: 880px){
	.contact-box{
		grid-template-columns: 1fr;
	}
	.left{
		height: 200px;
	}
}

.field {
	border: 2px solid #ccc;
}

input:invalid {
  color: red;
}
input:valid {
  color: green;
}
</style>
<body>
	<!-- Navbar Start ------------------------------------------->
	<%@ include file="Navbar.jsp"%>
	
	
	<form action="ContactUs2.jsp" method="post">
		<div class="container-fluid">
			<div class="contact-box">
				<div class="left"></div>
				<div class="right">
					<h2>Contact Us</h2>
					<input type="text" class="field mt-3" placeholder="First Name" name="fname" pattern="[A-Za-z]{3,10}"
						title="Full Name must be between 3 and 20 characters." required>
					<input type="text" class="field" placeholder="Last Name" name="lname"  pattern="[A-Za-z ]{3,10}"
						title="Full Name must be between 3 and 20 characters." required>
					<input type="text" class="field" placeholder="Your Email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
						title="Email is not valid.." required>
					<input type="text" class="field" placeholder="Phone Number" name="phno" pattern="[6789][0-9]{9}"
						title="Phone number is not valid.." required>
					<textarea placeholder="Message" class="field" maxlength="500"  name="msg" required></textarea>
					<button type="submit" class="btn">Send</button>
				</div>
			</div>
		</div>
	</form>
	
	<!-- Footer Start ------------------------------------------->
	<%@ include file="Footer.jsp"%>
</body>
</html>