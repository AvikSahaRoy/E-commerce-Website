<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders Page</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.swal-text {
	font-size:25px;
	font-weight: bold;
}

.details p {
	text-align: center;
}
</style>
<body>

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

String sql, sql1;
int numRowsAffected;
Statement stmt = conn.createStatement();
Statement stmt1 = conn.createStatement();
ResultSet rs, rs1;

String email = (String)session.getAttribute("logemail");

sql = "SELECT orderId, email, productId, quantity, price, totalprice, fname, lname, phno, address, country, state, pincode, payment, TO_CHAR(orderdate, 'mm/dd/yyyy HH24:MI:SS') AS orderdate, TO_CHAR(deliverydate, 'mm/dd/yyyy') AS deliverydate FROM orders WHERE email = '"+email+"' ORDER BY orderid";
rs = stmt.executeQuery(sql);

sql1 = "SELECT o.productId, p.name AS product_name, p.price AS product_price, p.image FROM orders o INNER JOIN products p ON o.productId = p.id WHERE o.email = '"+email+"' ORDER BY orderid";
rs1 = stmt1.executeQuery(sql1);
int i = 0;

%>

<%@ include file="Navbar.jsp"%>

   <div class="container">
	   <div class=" p-md-2 mt-2 mb-4 text-info rounded bg-dark text-center">
	   		<h1><i class="bi bi-box-seam"></i> My Orders</h1>
	   </div>
	</div>
	
<%while (rs.next()) { i = 1;%>
<div class="container" style="max-width: 990px;">
        <div class=" card mb-3 border-dark border-2 " >
            <div class="row g-0">
            <%if (rs1.next()) { 
		        	Blob b = rs1.getBlob(4);
		    	    byte barr[] = b.getBytes(1, (int) b.length());
		     %>
                <div class="col-md-2">
                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(barr) %>"
                        class="img-fluid" style="border-right: 2px solid #555;">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <div class="row text-white bg-dark rounded-3 border border-2 border-info">
                            <div class="col-sm-3">
                                <p class="card-title"><b>Order Id </b> <br> #<%=rs.getInt("ORDERID") %></p>
                            </div>
                            <div class="col-sm-5">
                                <p class="card-title"><b>Order Date & Time</b> <br> <%=rs.getString("ORDERDATE") %></p>
                            </div>
                            <div class="col-sm-4">
                                <p class="card-title"><b>Expected Delivery Date </b> <br> <%=rs.getString("DELIVERYDATE") %></p>
                            </div>
                        </div>
                        <div class="row details">
                            <div class="col-sm-3">
                                <p class="card-title"><b>Product Name </b> <br> <%=rs1.getString("PRODUCT_NAME") %>f</p>
                            </div>
                            <div class="col-sm-3">
                                <p class="card-title"><b>Price </b> <br> &#8377;<%=rs1.getString("PRODUCT_PRICE") %></p>
                            </div>
                            <div class="col-sm-3">
                                <p class="card-title"><b>Quantity </b> <br> <%=rs.getInt("QUANTITY") %></p>
                            </div>
                            <div class="col-sm-3">
                                <p class="card-title"><b>Sub Total </b> <br> &#8377;<%= rs.getInt("PRICE") %></p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-2">
                <div class="d-grid gap-2 my-1 mx-2">
                 	<a class="btn btn-outline-primary btn-sm fw-bold" href="TrackOrders.jsp?orderid=<%=rs.getInt("ORDERID") %>">Track Order</a>
	      			<a class="btn btn-outline-danger btn-sm fw-bold" href="CancelOrder.jsp?orderid=<%=rs.getInt("ORDERID")%>&orderdate=<%=rs.getString("ORDERDATE")%>&price=<%= rs.getInt("PRICE")%>&totalprice=<%= rs.getInt("totalprice")%>">Cancel Order</a>
	      			<a class="btn btn-outline-secondary btn-sm fw-bold" href="Bill.jsp?orderid=<%=rs.getInt("ORDERID")%>&pid=<%=rs.getInt("PRODUCTID")%>&orderdate=<%=rs.getString("ORDERDATE") %>">Generate Invoice</a>
	      			<a class="btn btn-outline-dark btn-sm fw-bold"  href="CheckoutBuy.jsp?pid=<%= rs.getString("productId")%>&quantity=1&price=<% out.println(rs1.getString("PRODUCT_PRICE")); %>&pname=<% out.println(rs1.getString("PRODUCT_NAME")); %>">Buy It Again</a>
                 </div>
                 </div>
                 
            </div>
        </div>
    </div>
    <%} %>
 <%} %>	    
		    

<% if(i == 0) { %>

  	<div class="d-grid gap-2 col-4 mx-auto" style="text-align: center;">
		<!-- <img src="Images/EmptyCart.jpg" class="img-fluid" alt="..."> -->
		 <span style="font-size: 100px; color: #33ccff;"><i class="icon bi bi-box-seam-fill"></i></span>
		<span style="font-size: 80px; color: red;">Oops... <i class="bi bi-emoji-frown-fill"></i></span>
	  	<p>No orders are there <i class="bi bi-headset-vr"></i></p>
		<a href="Shopping.jsp" class="btn btn-warning mb-4" type="button">Continue To Shopping</a>
	</div>


<% } %>



<%@ include file="Footer.jsp"%>

</body>
</html>