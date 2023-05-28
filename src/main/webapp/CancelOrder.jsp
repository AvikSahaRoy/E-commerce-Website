<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	//out.println(" Connection status: " + conn + "<P>");
	} catch(Exception e) {
	//out.println("Connection failed: " + e.toString() + "<P>");      
	}
	
	String sql, sql1;
	Statement stmt = conn.createStatement();
	Statement stmt1 = conn.createStatement();
	ResultSet rs, rs1;
	
	int orderid=Integer.parseInt(request.getParameter("orderid"));
	
	sql = "DELETE FROM orders where  orderId = '"+orderid+"'";
	PreparedStatement ps1 = conn.prepareStatement(sql);
	ps1.executeUpdate();
	
	String orderdate = request.getParameter("orderdate");
	double price=Double.parseDouble(request.getParameter("price"));
	double totalprice=Double.parseDouble(request.getParameter("totalprice"));
	String email = (String)session.getAttribute("logemail");
	
	try {
	PreparedStatement ps = conn.prepareStatement("update orders set TOTALPRICE= '"+totalprice+"' - '"+price+"' where email='"+email+"' and orderdate BETWEEN TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS') AND TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS')");
	ps.executeUpdate();
	}
	catch (SQLException e) 
	{
	    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
	}

	out.println("<script> swal({ text: 'Order Cancel Successfully..', icon: 'success', button: false, timer: 1500}); </script>");
	request.getRequestDispatcher("Orders.jsp").include(request, response);

	
%>

</body>
</html>