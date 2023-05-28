<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
      <title>Shopme - User Registration</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
        
</head>
<body>
<style>
/* all */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

:root {
  --main-blue: #71b7e6;
  --main-purple: #9b59b6;
  --main-grey: #ccc;
  --sub-grey: #d9d9d9;
}

body {
  display: flex;
  height: 100vh;
  justify-content: center; /*center vertically */
  align-items: center; /* center horizontally */
  background: linear-gradient(135deg, var(--main-blue), var(--main-purple));
  padding: 10px;
}
/* container and form */
.container {
  max-width: 700px;
  width: 100%;
  background: #fff;
  padding: 25px 30px;
  border-radius: 5px;
}
.container .title {
  font-size: 30px;
  font-weight: 500;
  position: relative;
 
}

.container .title::before {
  content: "";
  position: absolute;
  height: 3.5px;
  width: 210px;
  background: linear-gradient(135deg, var(--main-blue), var(--main-purple));
  left: 0;
  bottom: 0;
}



.container form .user__details {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
/* inside the form user details */
form .user__details .input__box {
  width: calc(100% / 2 - 20px);
  margin-bottom: 15px;
}

.user__details .input__box .details {
  font-weight: 500;
  margin-bottom: 5px;
  display: block;
}
.user__details .input__box input {
  height: 45px;
  width: 100%;
  outline: none;
  border-radius: 5px;
  border: 1px solid var(--main-grey);
  padding-left: 15px;
  font-size: 16px;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}

.user__details .input__box input:focus,
.user__details .input__box input:valid {
  border-color: var(--main-purple);
}


/* submit button */
form .button {
  height: 45px;
  margin: 45px 0;
}

form .button input {
  height: 100%;
  width: 100%;
  outline: none;
  color: #fff;
  border: none;
  font-size: 18px;
  font-weight: 500;
  border-radius: 5px;
  background: linear-gradient(135deg, var(--main-blue), var(--main-purple));
  transition: all 0.3s ease;
}

form .button input:hover {
  background: linear-gradient(-135deg, var(--main-blue), var(--main-purple));
}

select {
  height: 45px;
  width: 100%;
  outline: none;
  border-radius: 5px;
  border: 1px solid var(--main-grey);
  padding-left: 15px;
  font-size: 16px;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}

@media only screen and (max-width: 584px) {
  .container {
    max-width: 100%;
  }

  form .user__details .input__box {
    margin-bottom: 15px;
    width: 100%;
  }

  form .gender__details .category {
    width: 100%;
  }

  .container form .user__details {
    max-height: 300px;
    overflow-y: scroll;
  }

  .user__details::-webkit-scrollbar {
    width: 0;
  }
}

input:invalid {
  color: red;
}
input:valid {
  color: green;
}

form i {
    margin: 0px 0px 0px -35px;
    cursor: pointer;
    font-size: 20px;
    position: relative;
    bottom: 3px;
}

/* Go To Home page redirecet start */
.gotohome {
	text-align: right;
}

.gotohome a {
	font-size: 17px;
	color: #666666;
	margin: 0px;
}

.gotohome a:hover {
	text-decoration: none;
	color: #57b846;
}
/* Go To Home page redirecet End */

::-webkit-calendar-picker-indicator{
    padding: 15px;
    cursor: pointer;
    font-size: 22px;
}


</style>
</head>
<body>

	<div class="container">
		<div class="title">Registration</div>
		 <div class="gotohome"><a href="Home.jsp" >Go To Home</a></div>
		<form action="UserRegistration2.jsp" method="post">
			<div class="user__details">

				<div class="input__box">
					<span class="details">First Name</span> <input type="text"
						name="fname" pattern="[A-Za-z]{3,10}"
						title="First Name must be between 3 and 10 characters." required>
				</div>
				<div class="input__box">
					<span class="details">Last Name</span> <input type="text"
						name="lname" pattern="[A-Za-z ]{3,10}"
						title="Last Name must be between 3 and 10 characters." required>
				</div>
				<%HttpSession sessionn=request.getSession(false);  String n=(String)sessionn.getAttribute("regisemail"); %>
				<div class="input__box">
					<span class="details">Email</span> <input type="email" name="email"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
						value="<%=n   %>"
						title="Email is not valid.."  required readonly>
				</div>
				<div class="input__box">
					<span class="details">Phone Number</span> <input type="tel"
						name="phno" maxlength="10" pattern="[6789][0-9]{9}"
						title="Phone number is not valid.." required>
				</div>
				<div class="input__box">
					<span class="details">Date of Birth</span> <input type="date"
						name="dob" max="2007-12-31" required>
				</div>

				<div class="input__box">
					<span class="details">Gender</span> <select class="" name="gender"
						id="gender" required>
						<option value="">Choose...</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
						<option value="Others">Others</option>
					</select>
				</div>

				<div class="input__box">
					<span class="details">Password</span> <input type="password"
						name="password" id="password"
						pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{8,19}"
						title="Must contain at least one number, one special character, one uppercase, lowercase letter, and at least 8 or more characters"
						required> <i class="bi bi-eye-slash" id="togglePassword"></i>
				</div>
				<div class="input__box">
					<span class="details">Confirm Password</span> <input
						type="password" name="confirmpassword" id="confirmpassword"
						required>
				</div>
			</div>

			<div class="button">
				<input type="submit" value="Register">
			</div>
		</form>
	</div>
	
	
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

	// Pussword Show Button -----------------------------------------------

	const togglePassword = document.querySelector("#togglePassword");

	togglePassword.addEventListener("click", function() {
		// toggle the type attribute
		const type = password.getAttribute("type") === "password" ? "text"
				: "password";
		password.setAttribute("type", type);

		// toggle the icon
		this.classList.toggle("bi-eye");
	});
</script>

</html>