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
  <title>Shopme | About US</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
/*CSS*/
* {
	margin: 0;
	padding: 0;
}



.about-1 {
	padding: 25px;
}

.about-1 h1 {
	text-align: center;
	color: black;
	font-weight: bold;
}

.about-1 p {
	text-align: center;
	padding: 3px;
}


.about-item {
	margin-bottom: 20px;
	margin-top: 20px;
	background-color: #19d1a9;
	padding: 80px, 30px;
	box-shadow: 0 0 9px rgba(0, 0, 0 .6);
}

/*======================================
adding style to the icons(book,globe,pencil)
=========================================*/
.about-item i {
	font-size: 43px;
	margin: 0;
}

/*======================================
adding style to h3(heading 3) of each item 
=========================================*/
.about-item h3 {
	font-size: 25px;
	margin-bottom: 10px;
}

/*======================================
styling the hr (the blue line in between)
=========================================*/
.about-item hr {
	width: 46px;
	height: 3px;
	background-color: #5fbff9;
	margin: 0 auto;
	border: none;
	text-align: center;
}
/*========================================
hover means when you put your cursor over it
=========================================*/
.about-item p {
	margin-top: 20px;
}

.about-item:hover {
	background-color: #14b8c7;
}

 .about-item:hover h3, .about-item:hover p {
	color: #fff;
}


.about-item:hover hr {
	background-color: #fff;
}

.about-item:hover i {
	transform: translateY(-20px);
}

.about-item:hover i, .about-item:hover h3, .about-item:hover hr {
	transition: all 400ms ease-in-out;
}

footer {
	background: #212226;
	padding: 20px;
}

footer p {
	color: #fff;
}
</style>
<body>
	<!-- Navbar Start ------------------------------------------->
	<%@ include file="Navbar.jsp"%>
<section id="about">
		<div class="about-1">
			<h1>ABOUT US</h1>
			<p>An exclusive connection to Indian artisans for more meaningful
				buying. Men / women wears has been crafted for you in numerous
				colours and design and refined materials. Founded in January
				2023,and based in India, West Bengal,Siliguri. ShopMe is a trusted
				community Marketplace for people to Shop,explore, discover and be
				fashionable and book your favourite products can be used across the
				country over an electronic device using internet. Regards shopme</p>
		</div>
		<div id="about-2" class="pb-5">
			<div class="content-box-lg">
				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<div class="about-item text-center" style='height:280px; padding:15px'>
								<i class="fa fa-book"></i>
								<h3>MISSION</h3>
								<hr>
								<p>ShopMe wants to be a one stop shop for all your fashion
									and lifestyle needs. ShopMe aims to provide hassle free and
									enjoyable shopping experience to shoppers across the country
									with the widest range of Brands and Products on its portal</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="about-item text-center" style='height:280px; padding:15px'>
								<i class="fa fa-globe"></i>
								<h3>VISION</h3>
								<hr>
								<p>We intend to provide our customers with the best Online
									shopping experience from beginning to end, with a
									smart,searchable website,easy-to-follow instructions, clear and
									secure payment methods,and fast ,quality delivery."</p>
							</div>
						</div>
						<div class="col-md-4">
							<div class="about-item text-center" style='height:280px; padding:15px'>
								<i class="fa fa-pencil"></i>
								<h3>ACHIEVEMENTS</h3>
								<hr>
								<p>ShopMe is still new to this but with the help and support
									of yours . We together can make a big and great family.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
		<%@ include file="Footer.jsp"%>
</body>
</html>