<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.util.*" %>
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
// Get the ID of the product to remove from the cart
//int productId = Integer.parseInt(request.getParameter("productId"));

// Get the current cart from the session
//List<Integer> cart = (List<Integer>) session.getAttribute("cart");

// Remove the product ID from the cart
//cart.remove(Integer.valueOf(productId));

// Update the cart in the session
//session.setAttribute("cart", cart);

// Redirect to the shopping cart page
//response.sendRedirect("Cart.jsp");
%>

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

String email11 = (String)session.getAttribute("logemail");
int productId = Integer.parseInt(request.getParameter("productId"));

try {
	PreparedStatement ps=conn.prepareStatement("DELETE FROM cart WHERE email = ? and productid = ?");
	ps.setString(1,email11);
	ps.setInt(2,productId);
	ps.executeUpdate();
	out.println("<script> swal({text: 'Product delete successfully', icon: 'success', button: false, timer: 1500}); </script>");
	request.getRequestDispatcher("Cart.jsp").include(request, response);
}
catch (SQLException e) {
	out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
}

%>


</body>
</html>