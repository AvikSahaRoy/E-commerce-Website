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

//insert
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String phno=request.getParameter("phno");
String msg=request.getParameter("msg");



try 
{
	PreparedStatement ps=conn.prepareStatement("insert into contactus (fname, lname, email, phno, msg ) values(?,?,?,?,?)");
	ps.setString(1,fname);
	ps.setString(2,lname);
	ps.setString(3,email);
	ps.setString(4,phno);
	ps.setString(5,msg);
	numRowsAffected = ps.executeUpdate();
	out.println("<script> swal({ text: 'Send Successful..', icon: 'success', button: false, timer: 1500}); </script>");
	request.getRequestDispatcher("ContactUs.jsp").include(request, response);
} 
catch (SQLException e) 
{
    //out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
	//out.println("<script> swal({ text: 'This Phone number already used...', icon: 'error', }); </script>");
	//request.getRequestDispatcher("UserRegistration.jsp").include(request, response);
}

conn.close();
%>
</body>
</html>
