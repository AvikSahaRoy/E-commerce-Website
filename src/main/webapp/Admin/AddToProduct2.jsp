<%@ page import="java.sql.*, java.io.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String myloc=request.getParameter("imageFile"); 


	try 
	{
		PreparedStatement ps=conn.prepareStatement("insert into products (name, category, price, image) values(?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,category);
		ps.setString(3,price);
		FileInputStream fin=new FileInputStream("C:\\eclipse\\E-commerce\\src\\main\\webapp\\ProductImage\\"+myloc);  
		ps.setBinaryStream(4,fin,fin.available());  
		numRowsAffected = ps.executeUpdate();
		out.println("<script> swal({ text: 'Add To Product Successful..', icon: 'success', button: false, timer: 1500}); </script>");
		request.getRequestDispatcher("AddToProduct.jsp").include(request, response);
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