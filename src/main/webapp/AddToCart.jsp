<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopme</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
	
	String email1 = (String)session.getAttribute("logemail");
	int productId = Integer.parseInt(request.getParameter("productId"));
	
	//session.setAttribute("productid",productId);
	
	if(email1 != null) 
	{
		sql = "select * from cart where email='"+email1+"'";
		rs = stmt.executeQuery(sql);
		int a = 0;
		while(rs.next()) {
			if (rs.getInt("productid") == productId && rs.getString("email").equals(email1)) {
				try {
					PreparedStatement ps=conn.prepareStatement("update cart set quantity = quantity + 1 where email='"+email1+"' and productid='"+productId+"'");
					ps.executeUpdate();
					%>
					<script>
					Swal.fire({ icon: 'success',title: 'Product already exists in the cart! Quantity increase',showConfirmButton: false,timer: 2000}).then(() => {
				        // Redirect to the previous page after the message is closed
				        window.location.href = '<%= request.getHeader("referer") %>';
				      });
					</script>
					<%
				}
				catch (SQLException e) {
				    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
				}
				a = 1;
				break;
			}
		}	
		if ( a == 0 ) {
			try {
				PreparedStatement ps=conn.prepareStatement("insert into cart values(?,?,?)");
				ps.setString(1,email1);
				ps.setInt(2,productId);
				ps.setInt(3,1);
				ps.executeUpdate();
				%>
				<script>
				Swal.fire({ icon: 'success',title: 'Product added to cart successfully',showConfirmButton: false,timer: 2000}).then(() => {
			        // Redirect to the previous page after the message is closed
			        window.location.href = '<%= request.getHeader("referer") %>';
			      });
				</script>
				<%
			}
			catch (SQLException e) {
			    out.println("Error encountered during row insertion for employee: " + e.toString() + "<BR>");  
			}
		}
	 }
	else {
		request.getRequestDispatcher("UserLogin.jsp").include(request, response);
		out.println("<script> Swal.fire({text: 'Please Login First!', icon: 'warning', showConfirmButton: false, timer: 1500}); </script>");
		
	%>

	<%
	}

%>

</body>
</html>