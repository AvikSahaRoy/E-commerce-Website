<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile page</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<style>

.ff {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 85vh;
}

.form-signinn {
  max-width: 550px;
  width: 100%;

}

.cp {
	text-align: center;
	font-size: 40px;
	color: white;
}

.home a{
	text-decoration: none;
	font-weight: bold;
	color: white;
	font-size: 20px;
}

label {
	font-weight: bold;
}

.form-signinn .card {
	border-radius: 10px 50px;
}

.card {
	padding: 20px 0 20px 0;
}


</style>
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

String email1s = (String)session.getAttribute("logemail");

//select
sql = "select * from userregistration where email='"+email1s+"'";
rs = stmt.executeQuery(sql);

%>

<body>
<!-- Navbar Start ------------------------------------------->
<%@ include file="Navbar.jsp"%>
<div class="container ff">
	<main class="form-signinn">
	<% while (rs.next()) { %>
	<div class="card mb-3 border-info border-4 text-white bg-dark">
	  <div class="row g-0">
	    <div class="col-md-4" style= "padding: 30px;">
  			<% if (rs.getString("gender").equals("Male")) { %>
			    <img src="Images/male.jpg" class="img-fluid rounded-start" alt="Male Image">
			<% } else if (rs.getString("gender").equals("Female")) { %>
			    <img src="Images/female.jpg" class="img-fluid rounded-start" alt="Female Image">
			<% } else { %>
			    <img src="Images/UserDefaultimg.jpg" class="img-fluid rounded-start" alt="Default Image">
			<% } %>
		</div>
	    <div class="col-md-8">
	      <div class="card-body">
		    <h2 class="text-info"><%= rs.getString("fname") %> <%= rs.getString("lname") %></h2>
		    <label for="email">Email:</label>
		    <span> <%= rs.getString("email") %></span> <br>
  			<label for="mobile">Mobile: </label>
			<span><%= rs.getString("phno") %></span> <br>
			<label for="dob">Date of Birth: </label>
			<span><%= rs.getString("dob") %></span> <br>
			<label for="gender">Gender:</label>
			<span> <%= rs.getString("gender") %></span> <br>
			<a class="btn btn-sm btn-outline-info mt-2 fw-bold" href="EditProfileFrom.jsp?Id=<%= rs.getString("email") %>" style="float: right;">Edit Profile</a>
	      </div>
	    </div>
	  </div>
	</div>
	  <% } %>
	</main>
</div>
	<!-- Footer Start ------------------------------------------->
	<%@ include file="Footer.jsp"%>
</body>

</html>