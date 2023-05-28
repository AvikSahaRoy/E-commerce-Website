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
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String password=request.getParameter("password");
String confirmpassword=request.getParameter("confirmpassword");

sql = "select email from userregistration where email='"+email+"'";
rs = stmt.executeQuery(sql);
int f = 0;

while(rs.next()) 
{
	if (rs.getString("email").equals(email)) 
	{
		out.println("<script> swal({ text: 'This email already used Please login...', icon: 'error', }); </script>");
		request.getRequestDispatcher("UserLogin.jsp").include(request, response);
		f = 1;
		break;
	} 
}
if(f == 0) 
{
	try 
	{
		PreparedStatement ps=conn.prepareStatement("insert into userregistration values(?,?,?,?,?,?,?)");
		ps.setString(1,fname);
		ps.setString(2,lname);
		ps.setString(3,email);
		ps.setString(4,phno);
		ps.setString(5,dob);
		ps.setString(6,gender);
		ps.setString(7,password);
		numRowsAffected = ps.executeUpdate();
		out.println("<script> swal({ text: 'SignUp Successful..', icon: 'success', button: false, timer: 1500}); </script>");
		request.getRequestDispatcher("UserLogin.jsp").include(request, response);
	} 
	catch (SQLException e) 
	{
	    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
		out.println("<script> swal({ text: 'This Phone number already used...', icon: 'error', }); </script>");
		request.getRequestDispatcher("UserRegistration.jsp").include(request, response);
	}
}

conn.close();
%>
</body>
</html>
