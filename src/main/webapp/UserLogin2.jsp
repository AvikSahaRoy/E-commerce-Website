<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	font-size:25px;
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

// email and password receive --
String email=request.getParameter("email");
String pass=request.getParameter("pass");

sql = "select email,password from userregistration where email='"+email+"'";
rs = stmt.executeQuery(sql);

try {
	rs.next();
	
		 if (rs.getString("email").equals(email) && rs.getString("password").equals(pass)) 
		 {
			 //Session for Logout -->>  
		     session.setAttribute("logemail",email); 
		     
			 out.println("<script> swal({ text: 'Login Successful...', icon: 'success', button: false, timer: 1500}); </script>");
			 request.getRequestDispatcher("Home.jsp").include(request, response);
		 } 
		 else 
		 {
			 out.println("<script> swal({ text: 'Invalid username or password!', icon: 'error', }); </script>");
			 request.getRequestDispatcher("UserLogin.jsp").include(request, response);
		 }
	
}
catch (SQLException e) {
	//out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
	out.println("<script> swal({ text: 'Invalid username or password!', icon: 'error', }); </script>");
	request.getRequestDispatcher("UserLogin.jsp").include(request, response);
}

conn.close();
%>
</body>
</html>
