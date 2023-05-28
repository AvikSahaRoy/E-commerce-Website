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
  <title>Shopme</title>
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

String category = request.getParameter("category");
sql = "select * from products where category like '"+category+"'";
rs = stmt.executeQuery(sql);

%>
<%@ include file="Navbar.jsp"%>


	<div class="container mt-2 mb-4">
	<div class=" p-md-2  text-white rounded bg-dark text-center">
		<h1><% out.println(category); %></h1>
	</div>
		
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-5">
			<% while (rs.next()) { 
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
	
	

<%@ include file="Footer.jsp"%>

</body>
</html>