<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.swal-text {
	font-weight:bold;
	font-size:20px;
}
</style>
<body>

<%
// Table Name is register and Field name is Email & Password //

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

String id = (String)session.getAttribute("id");

String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");


PreparedStatement ps=conn.prepareStatement("update products set name=?, category=?, price=? where id='"+id+"'");
ps.setString(1,name);
ps.setString(2,category);
ps.setString(3,price);
ps.executeUpdate();

out.println("<script> swal({text: 'Product Update Successfully', icon: 'success', button: false, timer: 1500}); </script>");
request.getRequestDispatcher("ProductDetails.jsp").include(request, response);

%>

</body>
</html>