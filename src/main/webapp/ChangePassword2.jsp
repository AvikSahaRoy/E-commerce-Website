<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

String email = (String)session.getAttribute("logemail");
String cpass = request.getParameter("cpass");
String newpass = request.getParameter("newpass");

sql = "select password from userregistration where email='"+email+"'";
rs = stmt.executeQuery(sql);
int flag = 0;

while(rs.next()) {
	if (rs.getString("password").equals(cpass)) {
		flag = 1;
	}
}

//update
if(flag == 0) {
	//out.println("Please enter correct Email and Password");
	out.println("<script> swal({ text: 'Current Password does not match!', icon: 'error', button: false, timer: 1500}); </script>");
	request.getRequestDispatcher("ChangePassword.jsp").include(request, response);
} else {

try {
	sql="Update userregistration set password=? where email=?";
	PreparedStatement ps2=conn.prepareStatement(sql);
	ps2.setString(1,newpass);
	ps2.setString(2,email);
	
	int i = ps2.executeUpdate();
	if(i > 0)
	{
	//out.println("Record Updated Successfully");
	out.println("<script> swal({ text: 'Password Updated Successfully', icon: 'success', button: false, timer: 1500}); </script>");
	request.getRequestDispatcher("ChangePassword.jsp").include(request, response);
	}
	else
	{
	out.println("There is a problem in updating Record.");
	} 
} catch (SQLException e) {
 out.println("Error encountered during updation of employee: " + e.toString() + "<BR>");  
}  
}



%>
</body>
</html>