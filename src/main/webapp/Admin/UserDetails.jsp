<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>User Details</title>
<link rel="website icon" type="png" href="Images/favicon.png">
</head>
<style>
table, th, td {
  border:1px solid black;
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
sql = "select * from userregistration";
rs = stmt.executeQuery(sql);

%>
<div class="row">
	<div class="col-3">
		<%@ include file="AdminPage.jsp"%>
	</div>
<div class="col-8 mt-3">

<h1><center>User Details</center></h1>

<div class="row">
  <div class="col">
 	<h4>Total Users: 
		 <%
			 String sq;
			 Statement st = conn.createStatement();
			 ResultSet resu;
			 sq = "SELECT COUNT(email) AS userCount FROM userregistration";
			 resu = st.executeQuery(sq);
			 while(resu.next()) {
			 	out.println("<span class='badge bg-danger'>"+resu.getInt("userCount")+"</span>");
			 }
		 %>
 	</h4>
  </div>
 <div class="col">
 <h4>Male Users
<%
String sqq;
Statement stt = conn.createStatement();
ResultSet resuu;
sqq = "SELECT COUNT(gender) AS male_count FROM userregistration WHERE gender = 'Male'";
resuu = stt.executeQuery(sqq);
while(resuu.next()) {
	out.println("<span class='badge bg-primary'>"+resuu.getInt("male_count")+"</span>");
}
%>
 </h4>
  </div>
  <div class="col">
<h4>Female Users
<%
String sqqq;
Statement sttt = conn.createStatement();
ResultSet resuuu;
sqqq = "SELECT COUNT(gender) AS female_count FROM userregistration WHERE gender = 'Female'";
resuuu = sttt.executeQuery(sqqq);
while(resuuu.next()) {
	out.println("<span class='badge bg-primary'>"+resuuu.getInt("female_count")+"</span>");
}
%>
 </h4>
  </div>
<div class="col">
<h4>Others Users
<%
String sqqqq;
Statement stttt = conn.createStatement();
ResultSet resuuuu;
sqqqq = "SELECT COUNT(gender) AS others_count FROM userregistration WHERE gender = 'Others'";
resuuuu = stttt.executeQuery(sqqqq);
while(resuuuu.next()) {
	out.println("<span class='badge bg-primary'>"+resuuuu.getInt("others_count")+"</span>");
}
%>
 </h4>
  </div>
</div>



 
 <table class="table table-dark table-striped table-hover table-bordered border-success">
 <thead>
 	<tr class="table-primary">
 		<th>First Name</th>
 		<th>Last Name</th>
 		<th>Email</th>
 		<th>Phone Number</th>
 		<th>DOB</th>
 		<th>Gender</th>
        <th>Password</th>
        <th>Delete User</th>
 </thead>
 <tbody>
        <%            
          while (rs.next()) {
              out.println("<tr>");
              
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
              
              out.println("<td>");
              out.println(rs.getString("dob"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("gender"));
              out.println("</td>");

              out.println("<td>");
              out.println(rs.getString("password"));
              out.println("</td>");
              
              out.println("<td>"); %>
              <center><a class="btn btn-danger btn-sm" style="letter-spacing: 2px;" href="UserEmailDelete.jsp?email=<%=rs.getString("email")%>">DELETE</a></center>
              <%
              out.println("</td>");
              
              out.println("</tr>");
          }           
          conn.close(); %>   
</tbody>
</table>
</div>
</div>
</body>
</html>
