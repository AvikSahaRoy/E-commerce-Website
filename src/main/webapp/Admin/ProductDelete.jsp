<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
  out.println(" Connection status: " + conn + "<P>");
} catch(Exception e) {
  out.println("Connection failed: " + e.toString() + "<P>");      
}

String sql;
int numRowsAffected;
Statement stmt = conn.createStatement();
ResultSet rs;

String id=request.getParameter("id");

//Delete

sql = "DELETE FROM products where id='"+id+"'";
PreparedStatement ps1 = conn.prepareStatement(sql);
ps1.executeUpdate();

//out.println(email + " Email deleted. <BR>");
out.println("<script> alert('Product deleted.'); </script>");
//request.getRequestDispatcher("UserEmailDeleteForm.jsp").include(request, response);

conn.close();
%>

</body>
</html>
