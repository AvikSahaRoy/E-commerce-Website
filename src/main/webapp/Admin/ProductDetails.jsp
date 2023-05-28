<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
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
sql = "select * from products ORDER BY id ";
rs = stmt.executeQuery(sql);

%>
<div class="row">
	<div class="col-3">
		<%@ include file="AdminPage.jsp"%>
	</div>
<div class="col-8 mt-3">

 <h1><center>Product Details</center></h1>
  <h4>Number of Products: 
 <%
	 String sq;
	 Statement st = conn.createStatement();
	 ResultSet resu;
	 sq = "SELECT COUNT(ID) AS userCount FROM products";
	 resu = st.executeQuery(sq);
	 while(resu.next()) {
	 	out.println("<span class='badge bg-danger'>"+resu.getInt("userCount")+"</span>");
	 }
 %>
 </h4>
 <table class="table table-dark table-striped table-hover table-bordered border-success">
 <thead>
 	<tr class="table-primary">
 		<th>ID</th>
 		<th>Name</th>
 		<th>Category</th>
 		<th>Price</th>
 		<th>Image</th>
 		<th>Product Delete</th>
 		<th>Product Update</th>
 </thead>
 <tbody>
        <%            
          while (rs.next()) {
              out.println("<tr>");
              
              out.println("<td>");
              out.println(rs.getString("id"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("name"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("category"));
              out.println("</td>");
              
              out.println("<td>");
              out.println(rs.getString("price"));
              out.println("</td>");
              
              Blob b = rs.getBlob(5);
              byte barr[] = b.getBytes(1, (int) b.length());
              
              %>
              <td><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(barr) %>" width="50"></td>
              <%
              
              out.println("<td>"); %>
              <center><a class="btn btn-danger btn-sm" style="letter-spacing: 2px;" href="ProductDelete.jsp?id=<%=rs.getString("id")%>">DELETE</a></center>
              <%
              out.println("</td>");
              
              out.println("<td>"); %>
              <center><a class="btn btn-warning btn-sm" style="letter-spacing: 2px;" href="ProductUpdateFrom.jsp?id=<%=rs.getString("id")%>">UPDATE</a></center>
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
