<%@ page import="java.sql.*, java.util.Base64, java.io.*, java.lang.Math" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <title>Shopme</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
</head>
<style>
.swal-text {
	font-weight:bold;
	font-size:25px;
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
  //out.println("Connection status: " + conn + "<P>");
} catch(Exception e) {
  //out.println("Connection failed: " + e.toString() + "<P>");      
}

String sql;
int numRowsAffected;
Statement stmt = conn.createStatement();
ResultSet rs;

String search = request.getParameter("search");

sql = "select * from products where upper(CATEGORY) LIKE upper('%"+search+"%') OR upper(NAME) LIKE upper('%"+search+"%') ";
rs = stmt.executeQuery(sql);
int f = 0;

%>
<div class="container mt-2 mb-4">
		<div class=" p-md-2 rounded-pill bg-dark text-center">
			<h1 class="text-info">Continue to Shopping...</h1>
		</div>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-5">
	<%
		while(rs.next()) {
		//while (rs.getString("CATEGORY").equals(search)) { // Checking database value and user value
		Blob b = rs.getBlob(5);
	    byte barr[] = b.getBytes(1, (int) b.length());
			
	%>
		<div class="col mt-3">
			<div class="card border-dark">
				<img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(barr) %>" width="100" 
					class="card-img-top  border-dark" alt="..." style="border-bottom: 1px solid #555;">
				<div class="card-body">
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
												
						<div class="mt-3">
							<a href="AddToCart.jsp?productId=<%= rs.getString("ID") %>" class="btn btn-info">Add to Cart</a>
							<a href="CheckoutBuy.jsp?pid=<%= rs.getString("ID")%>&quantity=1&price=<% out.println(rs.getString("price")); %>&pname=<% out.println(rs.getString("name")); %>" 
							class="btn btn-dark" style="float: right">Buy Now</a>
						</div>
				</div>
			</div>
		</div>
	<%	
		f = 1;
		//break;
		//} 
	} 
	%>
	</div>
</div>

<% 	
if(f == 0) {
	//out.println("Product Not found in database" + "<BR>");
	 out.println("<script> swal({ text: 'This Product Not Available!', icon: 'error', }); </script>");
	 //out.println("<img src='Images/ProductNotFoundImg.png' width='100%' height='100%'");
	 //request.getRequestDispatcher("Shopping.jsp").include(request, response);
	%>
	<div class="container">
		<div style="text-align: center; font-size: 30px;">
			<img src="Images/ProductNotFound.png" class="img-fluid" alt="...">
			<!-- <span style="font-size: 80px; color: red;">Oops... <i class="bi bi-emoji-frown-fill"></i></span> -->
			<!-- <p>No product found <i class="bi bi-headset-vr"></i></p>  -->
			<p>You can try our different product</p>
			<a href="Shopping.jsp" class="btn btn-warning mb-4" type="button">Continue To Shopping</a>
		</div>
	</div>
	<% 
	 
}

conn.close();
%>

	<%@ include file="Footer.jsp"%>
</body>
</html>
