<%@ page import="java.sql.*" %>
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
	font-size:25px;
	font-weight: bold;
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
  //out.println("Connection status: " + conn + "<P>");
} catch(Exception e) {
  //out.println("Connection failed: " + e.toString() + "<P>");      
}


String email=request.getParameter("email");

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");

String phno=request.getParameter("phno");

// Email ------------------------------------------------------------------
String sql;
int numRowsAffected;
Statement stmt = conn.createStatement();
ResultSet rs;
sql = "select email from userregistration where email='"+email+"'";
rs = stmt.executeQuery(sql);
int f = 0;

while(rs.next()) {
	if (rs.getString("email").equals(email)) 
	{
		out.println("<script> swal({text: 'Email found in database', icon: 'info', button: false, timer: 1500}); </script>");
		request.getRequestDispatcher("UserSearchEmailForm.jsp").include(request, response);
		f = 1;
		break;
	} 
}


// Name ------------------------------------------------------------------------------------------
String sqll;
Statement stmtt = conn.createStatement();
ResultSet rss;
sqll = "select fname, lname from userregistration where fname='"+fname+"' and lname='"+lname+"'";
rss = stmtt.executeQuery(sqll);

while(rss.next()) {
	if (rss.getString("fname").equals(fname) && rss.getString("lname").equals(lname)) 
	{
		out.println("<script> swal({text: 'Name found in database', icon: 'info', button: false, timer: 1500}); </script>");
		request.getRequestDispatcher("UserSearchEmailForm.jsp").include(request, response);
		f = 1;
		break;
	} 
}


// Phone Number ----------------------------------------------------------------------------------
String sq;
Statement stm = conn.createStatement();
ResultSet r;
sq = "select phno from userregistration where phno='"+phno+"'";
r = stm.executeQuery(sq);


while(r.next()) {
	if (r.getString("phno").equals(phno)) 
	{
		out.println("<script> swal({text: 'Phone number found in database', icon: 'info', button: false, timer: 1500}); </script>");
		request.getRequestDispatcher("UserSearchEmailForm.jsp").include(request, response);
		f = 1;
		break;
	} 
}
if(f == 0) {
	out.println("<script> swal({text: 'Not found in database', icon: 'warning', button: false, timer: 1500}); </script>");
	request.getRequestDispatcher("UserSearchEmailForm.jsp").include(request, response);
}


conn.close();
%>
</body>
</html>
