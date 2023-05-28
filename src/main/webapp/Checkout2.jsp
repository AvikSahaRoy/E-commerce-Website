<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
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
	//out.println(" Connection status: " + conn + "<P>");
	} catch(Exception e) {
	//out.println("Connection failed: " + e.toString() + "<P>");      
	}
	
	String sql;
	int numRowsAffected;
	Statement stmt = conn.createStatement();
	ResultSet rs;
	
	
	String emailss = (String)session.getAttribute("logemail");
	
	String pid=request.getParameter("pid");
	int quantity=Integer.parseInt(request.getParameter("quantity"));
	double price=Double.parseDouble(request.getParameter("price"));
	
	double discount=Double.parseDouble(request.getParameter("discount"));
	//int totalprice=Integer.parseInt(request.getParameter("totalprice"));
	double totalprice=Double.parseDouble(request.getParameter("totalprice"));
	
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String phno=request.getParameter("phno");
	String address=request.getParameter("address");
	String country=request.getParameter("country");
	String state=request.getParameter("state");
	int pincode=Integer.parseInt(request.getParameter("pincode"));
	String payment=request.getParameter("payment");
	
	try 
	{
		PreparedStatement ps=conn.prepareStatement("INSERT INTO orders (email, productId, quantity, price, discount, totalprice, fname, lname, phno, address, country, state, pincode, payment)SELECT c.email, c.productId, c.quantity, p.price*c.quantity, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? FROM cart c JOIN products p ON c.productId = p.id WHERE c.email = '"+emailss+"'");
	    ps.setDouble(1,discount);
	    ps.setDouble(2,totalprice);
		ps.setString(3,fname);
	    ps.setString(4,lname);
	    ps.setString(5,phno);
	   	ps.setString(6,address);
	    ps.setString(7,country);
	    ps.setString(8,state);
	    ps.setInt(9,pincode);
	   	ps.setString(10,payment);

	    
	    ps.executeUpdate();
		out.println("<script> swal({ text: 'Order Successful..', icon: 'success', button: false, timer: 1500}); </script>");
		request.getRequestDispatcher("Home.jsp").include(request, response);
	} 
	catch (SQLException e) 
	{
	    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
		//out.println("<script> swal({ text: 'This Phone number already used...', icon: 'error', }); </script>");
		//request.getRequestDispatcher("UserRegistration.jsp").include(request, response);
	}
	
	

	

%>

</body>
</html>