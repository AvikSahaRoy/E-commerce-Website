<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> My Coupon</title>
        <link rel="website icon" type="png" href="Images/favicon.png">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
    </head>
    <style>
		*{
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		    font-family: 'poppins', sans-serif;
		    
		}
		.containerr{
		    width: 100%;
		    height: 90vh;
		    background: #f0fff3;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		
		}
		.coupon-card{
		    background: linear-gradient(135deg, #7158fe, #9d4de6);
		    color: #fff;
		    text-align: center;
		    padding: 20px 100px;
		    border-radius: 15px;
		    box-shadow: 0 10px 10px 0 rgba(0,0,0,0.15);
		    position: relative;
		
		}
		.logo{
		    width: 80px;
		    border-radius: 8px;
		    margin-bottom: 10px;
		
		}
		.coupon-card h3{
		    font-size: 28px;
		    font-weight: 400;
		    line-height: 40px;
		
		}
		.coupon-card p{
		    font-size: 15px;
		
		}
		.coupon-row{
		    display: flex;
		    align-items: center;
		    margin: 25px auto;
		    width: fit-content;
		
		}
		#cpnCode{
		    border: 1px dashed #fff;
		    padding: 10px 20px;
		    border-right: 0;
		
		}
		#cpnBtn{
		    border: 1px solid #fff;
		    background: #fff;
		    padding: 10px 20px;
		    color: #7158fe;
		    cursor: pointer;
		}
		.circle1, .circle2{
		    background: #f0fff3;
		    width: 50px;
		    height: 50px;
		    border-radius: 50%;
		    position: absolute;
		    top: 50%;
		    transform: translateY(-50%);
		
		}
		.circle1{
		    left: -25px;
		}
		.circle2{
		    right: -25px;
		}

    </style>
    <body>
    <%@ include file="Navbar.jsp"%>
        <div class="containerr">
            <div class="coupon-card">
                <img src="Images/favicon.png" class="logo">
                <center><h1><b>Shopme</b></h1></center>
                <h3>Flat <span style="color: yellow;"><b>&#8377;100</b></span> off on all Products<br>On a minimum bill of &#8377;1500</h3>
                <di class="coupon-row">
                    <span id="cpnCode">SMASR09</span>
                    <span id="cpnBtn">Copy Code</span>
                </di>
                <p>Valid Till: 20Dec, 2023</p>
                <div class="circle1"></div>
                <div class="circle2"></div>
            </div>
        </div>
    <%@ include file="Footer.jsp"%>
    </body>
    <script>
	    var cpnBtn = document.getElementById("cpnBtn");
	    var cpnCode = document.getElementById("cpnCode");
	
	    cpnBtn.onclick = function(){
	        navigator.clipboard.writeText(cpnCode.innerHTML);
	        cpnBtn.innerHTML ="COPIED";
	        setTimeout(function(){
	            cpnBtn.innerHTML="COPY CODE";
	        }, 3000);
	    }
    </script>
</html>