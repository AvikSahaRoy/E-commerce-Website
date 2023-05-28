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

String action = request.getParameter("action");
int id = Integer.parseInt(request.getParameter("id"));
String emails = (String)session.getAttribute("logemail");

sql = "select quantity from cart where email='"+emails+"' and productid='"+id+"'";
rs = stmt.executeQuery(sql);

while (rs.next()) {

if (action.equals("inc") && rs.getInt("quantity") < 10) {
	try {
		PreparedStatement ps=conn.prepareStatement("update cart set quantity = quantity + 1 where email='"+emails+"' and productid='"+id+"'");
		ps.executeUpdate();
		request.getRequestDispatcher("Cart.jsp").include(request, response);
	}
	catch (SQLException e) {
	    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
	}
}
else if (action.equals("dec") && rs.getInt("quantity") > 1) {
	try {
		PreparedStatement ps=conn.prepareStatement("update cart set quantity = quantity - 1 where email='"+emails+"' and productid='"+id+"'");
		ps.executeUpdate();
		request.getRequestDispatcher("Cart.jsp").include(request, response);
	}
	catch (SQLException e) {
	    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
	}
}
else if(rs.getInt("quantity") == 10) {
	  out.println("<script> swal({text: 'Maximum Quantity is 10', icon: 'warning', button: false, timer: 1500}); </script>");
	  request.getRequestDispatcher("Cart.jsp").include(request, response);
}


else if (rs.getInt("quantity") == 1) {
	  out.println("<script> swal({text: 'Minimum Quantity is 1', icon: 'warning', button: false, timer: 1500}); </script>");
	  request.getRequestDispatcher("Cart.jsp").include(request, response);
}

}
%>

</body>
</html>
