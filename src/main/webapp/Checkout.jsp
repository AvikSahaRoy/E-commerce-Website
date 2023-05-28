<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Checkout Page</title>
	<link rel="website icon" type="png" href="Images/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
</head>
<style>
    .pay {
        text-align: center;
    }
    .payment {
        display: block;
        margin: 0 auto;
        max-width: 300px;
    }
    input:invalid {
	  color: red;
	}
	input:valid {
	  color: green;
	}
	input:valid:focus {
  		color: green;
  		border: 2px solid green;
	}
	
	input:invalid:focus {
	  color: red;
	}
	label {
		font-weight: bold;
	}
	.placeorderbtn{
		background-color:black; 
		font-weight: bold;
	}
	.placeorderbtn:hover {
		background-color: #2f2f30;
	}

#captcha {
    text-decoration-thickness: 1px;
    text-decoration: underline overline line-through dotted red;
    font-style: italic;
    font-size: x-large;
}
    
</style>
<body class="bg-light" onload="generateCaptcha()">
<%
	//initialize driver class
	try {    
	Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (Exception e) {
	out.println("Fail to initialize Oracle JDBC driver: " + e.toString() + "<P>");
	}
	
	String dbUser = "ADMIN2";
	String dbPasswd = "java";
	String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	//connect
	Connection conn = null;
	try {
	conn = DriverManager.getConnection(dbURL,dbUser,dbPasswd);
	//out.println(" Connection status: " + conn + "<P>");
	} catch(Exception e) {
	//out.println("Connection failed: " + e.toString() + "<P>");      
	}
	
	String sql;
	int numRowsAffected;
	Statement stmt = conn.createStatement();
	ResultSet rs;
	
	String emails = (String)session.getAttribute("logemail");
	
	sql = "SELECT c.productid, c.quantity, p.name, p.category, p.price, p.image FROM cart c JOIN products p ON c.productid = p.id WHERE c.email = '"+emails+"'";
	rs = stmt.executeQuery(sql);
%>
<%@ include file="Navbar.jsp"%>

<form action="Checkout2.jsp" method="post">
    <div class="container" style="max-width: 960px;">
   	   <div class=" p-md-2 mt-2 mb-2 text-info rounded bg-dark text-center">
	   		<h1><i class="bi bi-house-door"></i> Order Summary & Payment <i class="bi bi-wallet2"></i></h1>
	   </div>
        <main>
            <div class="row g-5 py-4">
                <div class="col-md-5 col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Your cart</span>
                        <span class="badge bg-primary rounded-pill">
                        <%
                        int count = (Integer) session.getAttribute("count");
                        out.print(count+" Items");
                        %>
                        </span>
                    </h4>

                    <ul class="list-group mb-3">
                    <%
                    while (rs.next()) {
                    	Blob b = rs.getBlob(6);
                	    byte barr[] = b.getBytes(1, (int) b.length());
                    %>
                        <li class="list-group-item d-flex justify-content-between lh-sm">
                            <div>
                                <h6 class="my-0"><% out.println(rs.getString("name")); %></h6>
                                <small class="text-muted">Quantity: <% out.println(rs.getInt("quantity")); %></small>
                            </div>
                            <span class="text-muted"><i class="bi bi-currency-rupee" style="font-size:14px"></i><% out.println(rs.getString("price")); %></span>
                        </li>
                        
                        <input type="hidden" name="pid" value="<%=rs.getInt("PRODUCTID") %>">
                        <input type="hidden" name="quantity" value="<%=rs.getInt("QUANTITY") %>">
                        <input type="hidden" name="price" value="<%=rs.getInt("PRICE") %>">
                        
                    <%} %>

                         
                        <li class="list-group-item d-flex justify-content-between bg-light">
                            <div class="text-success">
                                <h6 class="my-0">Coupon Discount</h6>
                            </div>
                            <span class="text-success"><i class="bi bi-dash"></i><i class="bi bi-currency-rupee" style="font-size:15px; margin-right: -5px;"></i>
            	  			<%
            	  			if(session.getAttribute("discountPercent") == null) {
            	  				out.print(0.0);
            	  			%>
            	  				<input type="hidden" name="discount" value="0.0">
            	  			<%
            	  			} else {
            	  				out.print(session.getAttribute("discountPercent"));
            	  			%>
            	  				<input type="hidden" name="discount" value="<%out.print(session.getAttribute("discountPercent"));%>">
            	  			<%
            	  			}
                            %>
                            </span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <span><strong>Total (INR)</strong></span>
                            <strong> <i class="bi bi-currency-rupee" style="font-size:15px; margin-right: -5px;"></i>
                            <% 
	                        if(session.getAttribute("totalPrice").equals(0.0) || session.getAttribute("discountPercent") == null) {
	              				out.print(session.getAttribute("totalPrice"));
	            	  		%>
            	  				<input type="hidden" name="totalprice" value="<%out.print(session.getAttribute("totalPrice"));%>">
            	  			<%
	              			} 
	              			else if ((Double) session.getAttribute("totalPrice") >= 1500.0) {
	              				double discountPercent = (Double) session.getAttribute("discountPercent");
	              				double totalPrice1 = (Double) session.getAttribute("totalPrice");
	              				double discountedPrice = totalPrice1 -  discountPercent;
	              				out.print(discountedPrice);
	            	  		%>
            	  				<input type="hidden" name="totalprice" value="<%out.print(discountedPrice);%>">
            	  			<%
	              			}
	              			else {
	              				session.removeAttribute("discountPercent");
	              				out.print("<script> setTimeout(() => { location.reload(); });</script>");
	              				out.print(0);
	            	  		%>
            	  				<input type="hidden" name="totalprice" value="0">
            	  			<%
	              			} 
	              			%>
                            </strong>
                        </li>
                    </ul>
                </div>
                <div class="col-md-7 col-lg-8">
                    <h4 class="mb-3"><center>Deliver address</center></h4> 
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <label for="firstName" class="form-label">First name</label>
                                <input type="text" class="form-control" id="firstName" pattern="[A-Za-z]{3,10}"
								name="fname" title="First Name must be between 3 and 10 characters." placeholder="Enter first name" required>
                            </div>

                            <div class="col-sm-6">
                                <label for="lastName" class="form-label">Last name</label>
                                <input type="text" class="form-control" id="lastName" pattern="[A-Za-z ]{3,10}"
								name="lname" title="Last Name must be between 3 and 10 characters." placeholder="Enter last name" required>

                            </div>

                            <div class="col-6">
                                <label for="username" class="form-label">Phone Number</label>
                                <div class="input-group has-validation">
                                <input type="text" class="form-control" id="username"maxlength="10" pattern="[6789][0-9]{9}"
								name="phno" placeholder="Enter phone number" title="Phone number is not valid.." required>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="country" class="form-label">Country</label>
                                <select class="form-select" id="country" name="country" required>
                                    <option value="">Choose...</option>
                                    <option value="India">India</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="state" class="form-label">State</label>
                                <select class="form-select" id="state" name="state" required>
                                    <option value="">Choose...</option>
                                    <option value="Andhra Pradesh">Andhra Pradesh</option>
								    <option value="Arunachal Pradesh">Arunachal Pradesh</option>
								    <option value="Assam">Assam</option>
								    <option value="Bihar">Bihar</option>
								    <option value="Chhattisgarh">Chhattisgarh</option>
								    <option value="Goa">Goa</option>
								    <option value="Gujarat">Gujarat</option>
								    <option value="Haryana">Haryana</option>
								    <option value="Himachal Pradesh">Himachal Pradesh</option>
								    <option value="Jharkhand">Jharkhand</option>
								    <option value="Karnataka">Karnataka</option>
								    <option value="Kerala">Kerala</option>
								    <option value="Madhya Pradesh">Madhya Pradesh</option>
								    <option value="Maharashtra">Maharashtra</option>
								    <option value="Manipur">Manipur</option>
								    <option value="Meghalaya">Meghalaya</option>
								    <option value="Mizoram">Mizoram</option>
								    <option value="Nagaland">Nagaland</option>
								    <option value="Odisha">Odisha</option>
								    <option value="Punjab">Punjab</option>
								    <option value="Rajasthan">Rajasthan</option>
								    <option value="Sikkim">Sikkim</option>
								    <option value="Tamil Nadu">Tamil Nadu</option>
								    <option value="Telangana">Telangana</option>
								    <option value="Tripura">Tripura</option>
								    <option value="Uttar Pradesh">Uttar Pradesh</option>
								    <option value="Uttarakhand">Uttarakhand</option>
								    <option value="West Bengal">West Bengal</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label for="zip" class="form-label">Pin Code</label>
                                <input type="text" name="pincode" maxlength="6" class="form-control" id="zip" placeholder="Enter pin code" required>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address"
                                 placeholder="Enter full address" pattern="[A-Za-z ,]{5,}"
								name="address" title="Address must be more than 5 characters."   required>
                            </div>

                        </div>

                        <hr class="my-4">

                        <div class="payment">
                            <h4 class="pay mb-3">Payment</h4>

                            <select id="name" class="form-select" name="payment" required>
                            	<option value="">Choose...</option>
                                <option value="COD">Cash on delivery</option>
                                <option value="UPI">UPI</option>
                            </select>
                        
                             <div class="content">
                                <div id="UPI" class="data mt-2">
                                	<center><label for="captcha">Scan the QR</label></center>
                                	<center><img alt="" src="Images/QR.png" width=115></center>
                                </div>
                                <div id="COD" class="data mt-2">
                                    <center><label for="captcha">Enter the captcha:</label></center>
                                    <div class="mt-2" style="display: flex; align-items: center;">
                                        Captcha: <input type="text" id="captcha" class="form-control" name="captcha" disabled style="margin-right: 5px; background:  #f8f9fa; border: none"> 
                                    </div>
                                    <div class="mt-2" style="display: flex; align-items: center;">
                                        <input type="text" id="checkcaptcha" class="form-control" name="captcha" 
                                        placeholder="Enter your captcha" style="margin-right: 5px;">
                                    </div>
                                </div>

                            </div>
                            
                        </div>

                        <hr class="my-4">
                        <input class="placeorderbtn w-100 btn-lg mb-5" type="submit" value="Place Order">
                    
                </div>
            </div>
        </main>
    </div>
</form>

<%@ include file="Footer.jsp"%>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

// Captch matching ----------------------------------------------------------
var captcha = document.getElementById("captcha"), checkcaptcha = document
.getElementById("checkcaptcha");

function validateCaptcha() {
	if (captcha.value != checkcaptcha.value) {
		checkcaptcha.setCustomValidity("Captcha Don't Match");
	} else {
		checkcaptcha.setCustomValidity('');
	}
}
captcha.onchange = validateCaptcha;
checkcaptcha.onkeyup = validateCaptcha;


// Show Hide ------------------------------------------
$(document).ready(function () {
    $("#name").on('change', function () {
        $(".data").hide();
        $("#" + $(this).val()).fadeIn(700);
    }).change();
});

// captcha ---------------------------------------------
let captchaValue;

function generateCaptcha() {
  // Generate a random number between 1000 and 9999
  captchaValue = Math.floor(Math.random() * 9000) + 1000;

  // Display the captcha value in the input field
  document.getElementById("captcha").value = captchaValue;
}

function checkCaptcha() {
  const enteredValue = document.getElementById("checkcaptcha").value;

  if (enteredValue == captchaValue) {
    alert("Captcha matched!");
  } else {
    alert("Captcha does not match. Please try again.");
    generateCaptcha(); // regenerate captcha if it doesn't match
  }
}
</script>
</html>