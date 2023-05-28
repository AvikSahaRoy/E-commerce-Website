<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
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
  <title>Shopping Page</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
</head>

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

String sql;
int numRowsAffected;
Statement stmt = conn.createStatement();
ResultSet rs;

String sortOrder = request.getParameter("sortOrder");

sql = "select * from products";
String sort = "ASC";

if ("ascending".equals(sortOrder)) {
    sql += " ORDER BY CAST(price AS NUMBER) ASC";
    sort = "Ascending";
} else if ("descending".equals(sortOrder)) {
    sql += " ORDER BY CAST(price AS NUMBER) DESC";
    sort = "Descending";
}


%>
<%@ include file="Navbar.jsp"%>


	<div class="container mt-2 mb-4">
		<div class=" p-md-2 rounded-pill bg-dark text-center">
			<h1 class="text-info"><i class="bi bi-bag-heart"></i> Shop In Style</h1>
			<h5 class="text-white">All Categories are here...</h5>
		</div>
		<div class="p-md-2 text-center mt-1">
			<a type="button" href="Shopping.jsp?sortOrder=ascending" class="btn btn-dark btn-sm rounded-pill "><b>Price Low to High</b></a>
			<a type="button" href="Shopping.jsp?sortOrder=descending" class="btn btn-outline-dark btn-sm rounded-pill "><b>Price High to Low</b></a>
		</div>
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-5">
			<% rs = stmt.executeQuery(sql);
			while (rs.next()) { 
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
			<%   }   %>
		</div>
	</div>
	

	<!-- Offer Image  Start ----------------------------------------->

	<div class="container-fluid mb-2">
		<img src="Images/Shopping1.jpg" class="img-fluid" alt="..." style="width: 100%;">
	</div>

	<!-- Offer Image End ----------------------------------------->
	

<%@ include file="Footer.jsp"%>

</body>
</html>