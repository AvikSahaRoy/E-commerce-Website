<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

<%
String id=request.getParameter("id");
session.setAttribute("id",id); 



      //try {    
    	  Class.forName("oracle.jdbc.driver.OracleDriver");
    	//} catch (Exception e) {
    	//  out.println("Fail to initialize Oracle JDBC driver: " + e.toString() + "<P>");
    	//}

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
    	
		PreparedStatement ps=conn.prepareStatement("select * from products where id = ?");
		ps.setString(1,id);
		rs = ps.executeQuery();

       while(rs.next())
       {
  
  %>
  
<div class="container">
  <div class="row">
    <div class="col-md-6 mx-auto d-flex justify-content-center">
      <div>
		<form action="ProductUpdate.jsp" method="post">
			<h1>Product Update</h1>
			<label class="form-label">Name</label>
			<input name="name" class="form-control" value="<%= rs.getString("name")%>"> <br>
			<label class="form-label">Category</label>
			<input name="category" class="form-control" value="<%= rs.getString("category")%>"><br>
			<label class="form-label">Price</label>
			<input name="price" class="form-control" value="<%= rs.getString("price")%>"><br>
			<button type="submit" class="btn btn-primary"> Update </button>
		</form>
      </div>
    </div>
  </div>
</div>



 <% }  %>
</body>
</html>