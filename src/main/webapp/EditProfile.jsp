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

//String email1 = (String)session.getAttribute("email");

String PID = (String)session.getAttribute("ProfileId");

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String phno=request.getParameter("phno");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");

try 
{

PreparedStatement ps=conn.prepareStatement("update userregistration set fname=?, lname=?, phno=?, dob=?, gender=? where email='"+PID+"'");
ps.setString(1,fname);
ps.setString(2,lname);
ps.setString(3,phno);
ps.setString(4,dob);
ps.setString(5,gender);
ps.executeUpdate();

out.println("<script> swal({text: 'Profile Update Successfully', icon: 'success', button: false, timer: 1500}); </script>");
request.getRequestDispatcher("UserProfileCard.jsp").include(request, response);

} 
catch (SQLException e) 
{
    //out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
	out.println("<script> swal({ text: 'This Phone number already used...', icon: 'error', }); </script>");
	request.getRequestDispatcher("EditProfileFrom.jsp").include(request, response);
}

%>

</body>
</html>