<!doctype html>
<html>
<head>
<meta charset="ISO-8859-1">

      <title>Shopme - Forgot Password</title>
  <link rel="website icon" type="png" href="Images/favicon.png">

<script type='text/javascript'
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

<link
	href="https://fonts.googleapis.com/css?family=Quicksand&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>

<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	height: 100vh;
	width: 100%;
}

.container {
	margin-top: 50px;
	max-width: 500px;
	width: 100%;
	background: #fff;
	padding: 25px 30px;
	border-radius: 5px;
}

.contact-box {
	display: grid;
	grid-template-columns: 1fr;
	justify-content: center;
	align-items: center;
	text-align: center;
	background-color: #fff;
	box-shadow: 0px 0px 19px 5px rgba(0, 0, 0, 0.19);
}

.left {
	background: url("Images/EmailVerification.jpg") no-repeat center;
	background-size: cover;
	height: 300px;
	max-width: 500px;
	width: 100%;
}

.right {
	padding: 55px 40px;
	height: 300px;
}

h4 {
	position: relative;
	padding: 0 0 10px;
	margin-bottom: 10px;
}

h4:after {
	content: '';
	position: absolute;
	left: 50%;
	bottom: 0;
	transform: translateX(-50%);
	height: 4px;
	width: 90px;
	border-radius: 2px;
	background-color: #6dcde3;
}

.field {
	width: 100%;
	border: 2px solid rgba(0, 0, 0, 0);
	outline: none;
	background-color: rgba(230, 230, 230, 0.6);
	padding: 0.5rem 1rem;
	font-size: 1.1rem;
	margin-bottom: 22px;
	transition: .3s;
	margin-top: 20px;
}

.field:hover {
	background-color: rgba(0, 0, 0, 0.1);
}

textarea {
	min-height: 150px;
}

.btn {
	width: 200px;
	padding: 0.5rem 1rem;
	background-color: #6dcde3;
	color: #fff;
	font-size: 1.1rem;
	border: none;
	outline: none;
	cursor: pointer;
	transition: .3s;
}

.btn:hover {
	background-color: #3db8d4;
}

.field:focus {
	border: 2px solid rgba(30, 85, 250, 0.47);
	background-color: #fff;
}

@media screen and (max-width: 880px) {
	.contact-box {
		grid-template-columns: 1fr;
	}
	.left {
		height: 200px;
	}
}
</style>

<body>
<%
String action = request.getParameter("action");
session.setAttribute("action",action); 
%>
	<div class="container">
		<div class="contact-box">
			<div class="left"></div>

			<div class="right">

				<form class="cards" action="forgotPassword" method="POST">
					<h4>Verification Code Sent</h4>
					<input class="field form-control " type="email" name="email"
						id="email-for-pass" placeholder="Your Email" required="">
					<button class="btn" type="submit">Send OTP</button>
				</form>

			</div>
		</div>
	</div>

</body>
</html>