<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>Shopme</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<style>
/* Footer Start ----------------------*/
.footer {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
	color: #fff;
	line-height: 15px;
}

.footer .link a:hover {
	text-decoration: underline;
	color: #1DB954 !important;
}

.link a {
	text-decoration: none;
	color: white;
}

/* Footer End ----------------------*/

/*Goto to top button*/
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #1DB954;
  color: white;
  cursor: pointer;
  padding: 15px;
  width: 50px;
  height: 50px;
  border-radius: 50%;

}

#myBtn:hover {
  background-color: #555;
}

/* Pay -------------------*/
.pay {
	font-size: 20px;
}

</style>
<body class="d-flex flex-column min-vh-100">

	<!-- Back top top Button Start ----------------------------------------->

	<div class="d-grid gap-2">
		<button onclick="topFunction()" id="myBtn" title="Go to top"
			class="btn btn-secondary" type="button"><i class="bi bi-arrow-up"></i></button>
	</div>

	<!-- Back top top Button End ----------------------------------------->

	<!-- Footer Start ------------------------------------------->
	<div class="footer bg-dark mt-auto">
		<div class="row">
			<div class="col-md-4">
				<a href="./Home.jsp" class="navbar-brand" href="#"><i class="bi bi-bag-heart-fill"></i>Shopme</a>
				<p style="padding: 15px 0px 0px 10px; text-align: justify;">If you would like to
					experience the best of online shopping for men, women and kids in
					India, you are at the right place. Shopme is the ultimate
					destination for fashion and lifestyle, being host to a wide array
					of merchandise including clothing, footwear and more. Our
					online store brings you the latest in designer products straight
					out of fashion houses. You can shop online at Shopme from the
					comfort of your home and get your favourites delivered right to
					your doorstep.</p>
			</div>
			<div class="link col-md-2">
				<h5>Connect with Us</h5>
				<p><a href="#"><i class="bi bi-facebook"></i> Facebook</a></p>
				<p><a href="#"><i class="bi bi-instagram"></i> Instagram</a></p>
				<p><a href="#"><i class="bi bi-whatsapp"></i> Whatsapp</a></p>
				<p><a href="#"><i class="bi bi-twitter"></i> Twitter</a></p>
			</div>
			<div class="link col-md-3">
				<h5>Get to Know Us</h5>
				<p><a href="#">About Us</a></p>
				<p><a href="#">Careers</a></p>
				<p><a href="#">Press Releases</a></p>
				<p><a href="#">Others</a></p>
			</div>
			<div class="col-md-3">
				<b><p>Mail Us:</p></b>
				<p>sendtoshopme@gmail.com</p>
				<p><b>Telephone:</b> +91-1234567890</p>
				<b><p>Registered Office Address:</p></b>
				<p>Siliguri, West Bengal - 734001</p>
			</div>

		</div>
		<p class="mt-2">copywrite @shopme 2023</p>
		<P>
			By using this site you agree that we can place cookies on your
			device. See <a href="#">Privacy</a> Statement for details. © 2023
			Shopme. All Rights Reserved.
		</P>
		<p class="pay">
			<i class="fa-brands fa-cc-visa"></i> <i class="fa-brands fa-cc-mastercard"></i>
			<i class="fa-brands fa-cc-stripe"></i> <i class="fa-brands fa-cc-paypal"></i>
			<i class="fa-brands fa-cc-apple-pay"></i> <i class="fa-brands fa-cc-amazon-pay"></i>
			<i class="fa-brands fa-google-pay"></i> 
		</p>
	</div>
	<!-- Footer End ------------------------------------------->
</body>
<script>
//Back To Top Button -------------------------------------------------------------

// Get the button
let mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {
	scrollFunction()
};

function scrollFunction() {
	if (document.body.scrollTop > 20
			|| document.documentElement.scrollTop > 20) {
		mybutton.style.display = "block";
	} else {
		mybutton.style.display = "none";
	}
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}
</script>
</html>