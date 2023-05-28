<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
table, th, td {
  border:1px solid black;
}
textarea {
	background-color: #343a40;
	color: white;
	width: 450px;
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

String sql;
int numRowsAffected;
Statement stmt = conn.createStatement();
ResultSet rs;

//select
sql = "select * from contactus";
rs = stmt.executeQuery(sql);

%>
<div class="row">
	<div class="col-3">
		<%@ include file="AdminPage.jsp"%>
	</div>
<div class="col-8 mt-3">

 <h1><center>Contact Details</center></h1>
 <table class="table table-dark table-striped table-hover table-bordered border-success">
 <thead>
 	<tr class="table-primary">
 		<th>ID</th>
 		<th>First Name</th>
 		<th>Last Name</th>
 		<th>Email</th>
 		<th>Phone Number</th>
 		<th>Message</th>

 </thead>
 <tbody>
        <%            
          while (rs.next()) {
              out.println("<tr>");
              
              out.println("<td>");
              out.println(rs.getString("id"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("fname"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("lname"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("email"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("phno"));
              out.println("</td>");
              
              out.println("<td><textarea disabled>");
              out.println(rs.getString("msg"));
              out.println("</textarea></td>");
              
          }           
          conn.close(); %>   
</tbody>
</table>
</div>
</div>
</body>
</html>
