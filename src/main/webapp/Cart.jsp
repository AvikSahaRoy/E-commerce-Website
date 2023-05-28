<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
  <title>Shopping Cart</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
</head>
<style>
.number  {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    vertical-align: middle;
    width: 6rem;
}

center h1 {
	margin: 15px 0 25px 0;
}

</style>
<body>

<%@ include file="Navbar.jsp"%>


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


%>
   <div class="container">
	   <div class=" p-md-2 mt-2 mb-4 text-warning rounded bg-dark text-center">
	   		<h1><i class="bi bi-cart3"></i> Shopping Cart</h1>
	   </div>
   	
	  <%
	  String emails = (String)session.getAttribute("logemail");
	  
	  sql = "SELECT c.productid, c.quantity, p.name, p.category, p.price, p.image FROM cart c JOIN products p ON c.productid = p.id WHERE c.email = '"+emails+"'";
	  rs = stmt.executeQuery(sql);
	  int i = 0;
	  while (rs.next()) {
	    	Blob b = rs.getBlob(6);
		    byte barr[] = b.getBytes(1, (int) b.length());
			i = 1;
	   %>

	<div class="container" style="max-width: 1050px;">
   		<div class=" card  mb-3 border-dark" >
	 	 <div class="row g-0">
	    	<div class="col-md-2">
		      <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(barr) %>" 
				class="img-fluid rounded-start" style="border-right: 1px solid #555;">
	    	</div>
	    <div class="col-md-10">
	      <div class="card-body">
	      <input type="hidden" name="id" value="<%=rs.getInt("PRODUCTID") %>">
	      
			<h5 class="card-title"><% out.println(rs.getString("name")); %></h5>
				
				<span class="card-text"><b>Price: </b>
				<% 
				if((rs.getDouble("price")) < 1000.00) { %>
					<s>&#8377;<%out.print((rs.getInt("price")) + 300);%></s>
					<span style="color: green; font-weight: bold;"><%out.print(" " + String.format("%.1f", ((rs.getInt("price") + 300) - rs.getDouble("price")) / (rs.getInt("price") + 300) *100 )); %>% off</span><%
				}
				else if( (rs.getDouble("price")) < 2000.00) {%>
					<s>&#8377;<%out.print((rs.getInt("price")) + 700);%></s>
					<span style="color: green; font-weight: bold;"><%out.print(" " + String.format("%.1f", ((rs.getInt("price") + 700) - rs.getDouble("price")) / (rs.getInt("price") + 700) *100 )); %>% off</span><%
				}
				else if( (rs.getDouble("price")) < 4000.00) {%>
					<s>&#8377;<%out.print((rs.getInt("price")) + 800);%></s>
					<span style="color: green; font-weight: bold;"><%out.print(" " + String.format("%.1f", ((rs.getInt("price") + 800) - rs.getDouble("price")) / (rs.getInt("price") + 800) *100 )); %>% off</span><%
				}
				else {%>
					<s>&#8377;<%out.print((rs.getInt("price")) + 1000);%></s>
					<span style="color: green; font-weight: bold;"><%out.print(" " + String.format("%.1f", ((rs.getInt("price") + 1000) - rs.getDouble("price")) / (rs.getInt("price") + 1000) *100 )); %>% off</span><%
				}
				%></span> <br>
				
				<span class="card-text"><b>Special Price: </b><i class="bi bi-currency-rupee" style="font-size:14px"></i><% out.println(rs.getString("price")); %></span> <br>
				
				<span class="card-text"><b>Category: </b> <% out.println(rs.getString("CATEGORY")); %></span> <br>

	        
	        <span class="card-text "><b>Quantity: </b></span>
	      <div class="number mt-1 ms-2">
	      
		  <a type="button" href="QuantityIncDec.jsp?action=dec&id=<%=rs.getInt("PRODUCTID") %>" class="minus btn btn-sm btn-info" style="font-weight: bold">-</a>
		  <span style="padding: 0 20px 0 20px;"><% out.println(rs.getInt("quantity")); %></span>
		 <a type="button" href="QuantityIncDec.jsp?action=inc&id=<%=rs.getInt("PRODUCTID") %>" class="plus btn btn-sm btn-info" style="font-weight: bold">+</a>
		</div>
	        
	        
	    <a href="RemoveToCart.jsp?productId=<%= rs.getString("PRODUCTID") %>" class="mt-1  btn btn-sm btn-outline-danger" style="float: right;">Remove</a>
	    <a class="mt-1 me-1 btn btn-sm btn-outline-dark btn-sm fw-bold" style="float: right;" 
	    href="CheckoutBuy.jsp?pid=<%= rs.getString("productId")%>&quantity=1&price=<% out.println(rs.getString("price")); %>&pname=<% out.println(rs.getString("name")); %>">Buy Now</a>

	      </div>
	    </div>
	    
	  </div>
	</div>
	</div>

  <% 
  }
  if (i == 0) {
	  
  %>
  <div class="container">
  	<div style="text-align: center;">
		<img src="Images/EmptyCart.jpg" class="img-fluid" alt="...">
		<h4>Hey, it feels so light!</h4>
	  	<p>There is nothing in your cart. Let's add some items.</p>
		<a href="Shopping.jsp" class="btn btn-warning mb-4" type="button">Continue To Shopping</a>
	</div>
  </div>
	<%} else { %>
  
  <div class="container card  border-primary mb-3" style="max-width: 1030px;">
	  <div class="row g-0 mx-2">
	  	 <div class="col-md-6 mt-2"> 
	  	
	  	<table class="table table-borderless">
		  <tbody>
		  	<tr class="border-bottom border-dark ">
		  		<td><b>PRICE DETAILS</b></td>
		  	</tr>
		    <tr>
		      <td>Price 
		      <%
				  int count = (Integer) session.getAttribute("count");
				  out.print("(" +count+ " Items)");
				%>
		      </td>
		      <td><p class="card-text">&nbsp&nbsp&nbsp&nbsp<i class="bi bi-currency-rupee" style="font-size:15px; margin-right: -5px;"></i>
		     <%
	          sql = "SELECT SUM(p.price * c.quantity) as total_price FROM products p JOIN cart c ON p.id = c.productid WHERE c.email = '"+emails+"'";
	          rs = stmt.executeQuery(sql);
	          if (rs.next()) {
	        	  out.print( rs.getDouble("total_price"));
	        	  session.setAttribute("totalPrice", rs.getDouble("total_price"));
	          }
		      %>
		      </p></td>
		    </tr>
		    
		     <tr>
		      <td>Coupon Discount </td>
		      <td>
		      <p class="card-text"><i class="bi bi-dash"></i><i class="bi bi-currency-rupee" style="font-size:15px; margin-right: -5px;"></i>
	  			<%
	  			if(session.getAttribute("discountPercent") == null) {
	  				out.print(0.0);
	  			} else {
	  				out.print(session.getAttribute("discountPercent"));
	  			}
  				%> 
  			  </p>
		      </td>
		      <td>
				<a href="RemoveCouponDiscount.jsp" class="btn btn-sm btn-outline-danger" 
  				style="font-weight: bold; font-size: 0.8rem; padding: 0.1rem 0.2rem;">Remove</a>
  			  </td>
		    </tr>
		    
		    <tr class="border-bottom border-dark" style="color: green;">
			    <td>Delivery Charges</td>
			    <td>&nbsp&nbsp&nbsp&nbsp Free</td>
		    </tr>
		    <tr>
		      <td class="fw-bold">Total Amount</td>
		      <td>
		      <p class="card-text fw-bold">&nbsp&nbsp&nbsp <i class="bi bi-currency-rupee" style="font-size:15px; margin-right: -5px;"></i>
		      
  			<%
  			
  			if(session.getAttribute("totalPrice").equals(0.0) || session.getAttribute("discountPercent") == null) {
  				out.print(session.getAttribute("totalPrice"));
  			} 
  			else if ((Double) session.getAttribute("totalPrice") >= 1500.0) {
  				double discountPercent = (Double) session.getAttribute("discountPercent");
  				double totalPrice1 = (Double) session.getAttribute("totalPrice");
  				double discountedPrice = totalPrice1 -  discountPercent;
  				out.print(discountedPrice);
  			}
  			else {
  				session.removeAttribute("discountPercent");
  				out.print("<script> setTimeout(() => { location.reload(); });</script>");
  				out.print(0);
  			}
  			%>
  			</p>
		      </td>
		    </tr>
		  </tbody>
		</table>

	    </div>
	
	    <div class="col-md-2 mt-2">
	    
	    </div>

	    <div class="col-md-4 mb-2 mt-2">
		    <form action="CouponDiscount.jsp" method="post">
		    	<div class="row g-3 align-items-center">
					<div class="col-auto">
				    	<h4>Apply Coupon</h4>
				  	</div>
				 	<div class="col-auto">
				    	<input type="text" name="couponCode" class="form-control" placeholder="Enter coupon code">
				 	</div>
				  	<div class="col-auto">
						<button type="submit" class="btn btn-primary">Apply</button>
				  	</div>
				</div>
			</form>
	    </div>
	   
	   </div> 
	 

	<div class="col-md-7 col-lg-4 mx-auto">
		<a href="Checkout.jsp" class="w-100 btn btn-lg btn-outline-dark btn-lg mb-3" type="submit" style=" font-weight: bold">Continue to checkout</a>
	</div>

  </div>
  <%} %>
</div>
  


<%@ include file="Footer.jsp"%>
</body>
</html>
