<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<title>Shopme</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<style>
/* Image carousel Start --------------*/
.carouselicon {
	background-color: #000000 !important;
	padding: 32px 16px;
	border-radius: 8px;
	width: 60px;
}

.carouselic {
	padding: 32px 16px;
	border-radius: 8px;
	width: 50px;
}

/* Image carousel End --------------*/
.roundImg {
	background-image: linear-gradient(90deg, #00C0FF 0%, #FFCF00 49%, #FC4F4F 100%);
	position: relative;
	padding: 5px;
	display: inline-block;
}

/* Round image hover */
.roundImg {
	transition: transform .2s;
}

.roundImg:hover {
	-ms-transform: scale(1.5); /* IE 9 */
	-webkit-transform: scale(1.5); /* Safari 3-8 */
	transform: scale(1.2);
}

/* Auto scroll Start */
.mar {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 5px;
}

:root {
    --marquee-width: 97.4vw;
    --marquee-height: 15vh;
    /* --marquee-elements: 12; */
    /* defined with JavaScript */
    --marquee-elements-displayed: 5;
    --marquee-element-width: calc(var(--marquee-width) / var(--marquee-elements-displayed));
    --marquee-animation-duration: calc(var(--marquee-elements) * 3s);
}

.marquee {
    width: var(--marquee-width);
    height: var(--marquee-height);
    background-color: #111;
    color: #eee;
    overflow: hidden;
    position: relative;
}

.marquee:before,
.marquee:after {
    position: absolute;
    top: 0;
    width: 10rem;
    height: 100%;
    content: "";
    z-index: 1;
}

.marquee:before {
    left: 0;
    background: linear-gradient(to right, #111 0%, transparent 100%);
}

.marquee:after {
    right: 0;
    background: linear-gradient(to left, #111 0%, transparent 100%);
}

.marquee-content {
    list-style: none;
    height: 100%;
    display: flex;
    animation: scrolling var(--marquee-animation-duration) linear infinite;
}


@keyframes scrolling {
    0% {
        transform: translateX(0);
    }

    100% {
        transform: translateX(calc(-1 * var(--marquee-element-width) * var(--marquee-elements)));
    }
}

.marquee-content li {
    display: flex;
    justify-content: center;
    align-items: center;
    /* text-align: center; */
    flex-shrink: 0;
    width: var(--marquee-element-width);
    max-height: 100%;
    font-size: 50px;
    /* 5rem; */
    white-space: nowrap;
    color: #1DB954 !important;
}


@media (max-width: 600px) {
    html {
        font-size: 12px;
    }

    :root {
        --marquee-width: 100vw;
        --marquee-height: 16vh;
        --marquee-elements-displayed: 3;
    }

    .marquee:before,
    .marquee:after {
        width: 5rem;
    }
}
/* Auto scroll End */

section#shiping {
    padding: 20px;
    /* background: #001524;*/
    color: white;
    margin-bottom: 5px;

}

.box-icon {
    display: inline-block;
}

.box-title {
    display: inline-grid;
    margin-left: 20px;
}

.box-title h3 {
    font-size: 23px;
}

.box-icon i {
    color: #75B61A;
    font-size: 30px;
}
.shipping-box {
    background: #1C2F3C;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 5px;
}

.title {
    text-align: center;
    margin-bottom: 60px;
}

.products {
    background: #F6F7F2;
    padding: 10px;
	transition: all .5s;
}

.product-desc {
    text-align: center;
}
.product-rating{
	width: 100px;
	margin: auto;
	margin-bottom: 5px;
}
.products:hover {
    box-shadow: 0px 0px 5px 1px #ddd;
}

.product-img {
    margin-bottom: 20px;
}
.product-img img{
	cursor: pointer;
}
</style>
<body>

	<!-- Navbar Start ------------------------------------------->
	
	<%@ include file="Navbar.jsp"%>

	<!-- Navbar End ------------------------------------------->
	
	
	<!-- Sales Ends section Start ------------------------------------------->

	<div class="card" style="background-color: #b8edfc;">
		<div class="card-body">
			<div style="text-align: center; font-size: 20px;">
				<span id="demo" style="color: red; font-weight: 600;"></span>
			</div>
		</div>
	</div>
	
	<!-- Sales Ends section End ------------------------------------------->


	<!-- carousel Start ----------------------------------------->

	<div id="carouselExampleControls1" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Images/HomePage01.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="Images/HomePage02.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="Images/HomePage04.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="Images/HomePage03.jpg" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
			<span class="carousel-control-prev-icon carouselic"
				aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls1" data-bs-slide="next">
			<span class="carousel-control-next-icon carouselic"
				aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>

	<!-- carousel End ----------------------------------------->


	<!-- Round Images Start ----------------------------------------->

	<div class="container mt-3 mb-3">
		<h1 class="mb-4">
			<div
				class="container card  text-warning rounded-pill bg-dark text-center  pb-2"
				style="max-width: 500px;">
				<center>
					<i class="bi bi-shop-window"></i> Shop By Category
				</center>
			</div>
		</h1>
		<div class="row">
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Shirt"> <img
					src="Images/CircleImg01.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">T-shirt</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Footwear"> <img
					src="Images/CircleImg02.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Footwear</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Dresses"> <img
					src="Images/CircleImg03.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Dresses</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Coats and Jackets"> <img
					src="Images/CircleImg04.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Coats and Jackets</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Heeled Sandals"> <img
					src="Images/CircleImg05.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Heeled Sandals</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Kids Wear"> <img
					src="Images/CircleImg06.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Kids Wear</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Traditional Wear"> <img
					src="Images/CircleImg07.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Traditional Wear</h4>
			</div>
			<div class="col-md-3 mb-3">
				<a href="ShopByCategory.jsp?category=Gym Wear"> <img
					src="Images/CircleImg08.jpg"
					class="mb-2 roundImg mx-auto d-block rounded-circle" width="150"
					height="150" alt="">
				</a>
				<h4 style="text-align: center;">Gym Wear</h4>
			</div>
		</div>
	</div>

	<!-- Round Images End ----------------------------------------->
	
	<!-- NEW IN TOP BRANDS Section Start ----------------------- -->
	
	<center class="mb-2"><h1>NEW IN TOP BRANDS</h1></center>
	<div class="mar">
		<div class="marquee">
	        <ul class="marquee-content">
	        	  <li>Nike</li>
				  <li>Adidas</li>
				  <li>Levi's</li>
				  <li>Puma</li>
				  <li>H&M</li>
				  <li>Zara</li>
				  <li>Gap</li>
				  <li>Calvin Klein</li>
				  <li>Prada</li>
  				  <li>Versace</li>
	        </ul>
	    </div>
	</div>
	
	<!-- NEW IN TOP BRANDS Section End ----------------------- -->
	

	<!-- Offer Image  Start ----------------------------------------->

	<div class="container-fluid mb-2">
		<img src="Images/OfferImage1.jpg" class="img-fluid" alt="..."
			style="width: 100%;">
	</div>

	<!-- Offer Image End ----------------------------------------->
	
	
	<!-- About of our page start ------------------------------ -->
	
	<section class="container" id="shiping">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="shipping-box">
                        <div class="box-icon"><i class="fas fa-truck"></i></div>
                        <div class="box-title">
                            <h3>Free Shipping</h3>
                            <p>for all products</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="shipping-box">
                        <div class="box-icon"><i class="far fa-address-book"></i></div>
                        <div class="box-title">
                            <h3>Certified Organic</h3>
                            <p>100% guarantee</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="shipping-box">
                        <div class="box-icon"><i class="far fa-money-bill-alt"></i></div>
                        <div class="box-title">
                            <h3>Huge Savings</h3>
                            <p>at lowest price</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="shipping-box">
                        <div class="box-icon"><i class="fas fa-recycle"></i></div>
                        <div class="box-title">
                            <h3>Easy Cancel</h3>
                            <p>no questions asked</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!-- About of our page End ------------------------------ -->


	<!-- Footer Start --------------------------------------- -->

	<%@ include file="Footer.jsp"%>
	
	<!-- Footer End --------------------------------------- -->


</body>
<script>

	// NEW IN TOP BRANDS Section Start ----------------------- -->
	const root = document.documentElement;
	const marqueeElementsDisplayed = getComputedStyle(root).getPropertyValue("--marquee-elements-displayed");
	const marqueeContent = document.querySelector("ul.marquee-content");
	
	root.style.setProperty("--marquee-elements", marqueeContent.children.length);
	
	for (let i = 0; i < marqueeElementsDisplayed; i++) {
	    marqueeContent.appendChild(marqueeContent.children[i].cloneNode(true));
	}
	// NEW IN TOP BRANDS Section End ----------------------- -->

	
	// Sales Start in --------------------------------------------------------------
	

	// Set the date we're counting down to
	var countDownDate = new Date("May 31, 2023 16:22:25").getTime();

	// Update the count down every 1 second
	var x = setInterval(function() {

		// Get today's date and time
		var now = new Date().getTime();

		// Find the distance between now and the count down date
		var distance = countDownDate - now;

		// Time calculations for days, hours, minutes and seconds
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		// Output the result in an element with id="demo"
		document.getElementById("demo").innerHTML = "Sales Ends In " +days + "D : " + hours
				+ "H : " + minutes + "M : " + seconds + "S";

		// If the count down is over, write some text 
		if (distance < 0) {
			clearInterval(x);
			document.getElementById("demo").innerHTML = "Sale Comming Soon...";
		}
	}, 1000);
</script>
</html>