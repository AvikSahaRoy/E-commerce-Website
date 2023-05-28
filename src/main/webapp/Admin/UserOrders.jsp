<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders Page</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.swal-text {
	font-size:25px;
	font-weight: bold;
}
.table-responsive {
  max-height: 600px;
  overflow-x: auto;
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

String sql, sql1;
int numRowsAffected;
Statement stmt = conn.createStatement();
Statement stmt1 = conn.createStatement();
ResultSet rs, rs1;

String email = (String)session.getAttribute("logemail");

sql = "SELECT orderId, email, productId, quantity, price, discount, totalprice, fname, lname, phno, address, country, state, pincode, payment, TO_CHAR(orderdate, 'mm/dd/yyyy HH24:MI:SS') AS orderdate, TO_CHAR(deliverydate, 'mm/dd/yyyy') AS deliverydate FROM orders WHERE email = '"+email+"' ORDER BY orderid";
rs = stmt.executeQuery(sql);

sql1 = "SELECT o.productId, p.name AS product_name, p.price AS product_price, p.image FROM orders o INNER JOIN products p ON o.productId = p.id WHERE o.email = '"+email+"' ORDER BY orderid";
rs1 = stmt1.executeQuery(sql1);

%>

<div class="row">
	<div class="col-2">
		<%@ include file="AdminPage.jsp"%>
	</div>
<div class="col-10 mt-3">
	<h1><center>Users Order Table</center></h1>
	  <h4 style="text-align: center;">Number of Orders: 
	 <%
		 String sq;
		 Statement st = conn.createStatement();
		 ResultSet resu;
		 sq = "SELECT COUNT(orderId) AS userCount FROM orders";
		 resu = st.executeQuery(sq);
		 while(resu.next()) {
		 	out.println("<span class='badge bg-danger'>"+resu.getInt("userCount")+"</span>");
		 }
	 %>
	 </h4>
	<div class="container-fluid mt-3">
	   <div class="table-responsive">
		  <table class="table table-success table-hover border border-dark" style="font-size: 13px; text-align: center;">
		    <thead class="table-primary align-middle border border-dark ">
		      <tr>
		        <th>ORDER ID</th>
		        <th>EMAIL</th>
		        <th>PRODUCT ID</th>
		        <th>PRODUCT NAME</th>
		        <th>PRICE</th>
		        <th>QUANTITY</th>
		        <th>DISCOUNT</th>
		        <th>TOTAL PRICE</th>
		        <th>FIRST NAME</th>
		        <th>LAST NAME</th>
		        <th>PHONE NUMBER</th>
		        <th>ADDRESS</th>
		        <th>COUNTRY</th>
		        <th>STATE</th>
		        <th>PIN CODE</th>
		        <th>PAYMENT METHOD</th>
		        <th>ORDER DATE</th>
		        <th>DELIVERY DATE</th>
		        <th>TRACK ORDER</th>
		        <th>ORDER CANCEL</th>
		        <th>GENERATE INVOICE</th>
		      </tr>
		    </thead>
		    <tbody>
		    <%while (rs.next()) { %>
		      <tr>
		      
		        <td><%=rs.getInt("ORDERID") %></td>
		        <td><%=rs.getString("EMAIL") %></td>
		        <td><%=rs.getInt("PRODUCTID") %></td>
		        <%if (rs1.next()) { %>
		        	<td><%=rs1.getString("PRODUCT_NAME") %></td>
		        	<td>&#8377;<%=rs1.getString("PRODUCT_PRICE") %></td>
		        <%} %>
		        <td><%=rs.getInt("QUANTITY") %></td>
		        
		        <td>&#8377;<%= rs.getInt("DISCOUNT") %></td>
		        <td>&#8377;<%= rs.getInt("TOTALPRICE") %></td>
		        <td><%=rs.getString("FNAME") %></td>
		        <td><%=rs.getString("LNAME") %></td>
		        <td><%=rs.getString("PHNO") %></td>
		        <td><%=rs.getString("ADDRESS") %></td>
		        <td><%=rs.getString("COUNTRY") %></td>
		        <td><%=rs.getString("STATE") %></td>
		        <td><%=rs.getInt("PINCODE") %></td>
		        <td><%=rs.getString("PAYMENT") %></td>
		        <td><%=rs.getString("ORDERDATE") %></td>
		        <td><%=rs.getString("DELIVERYDATE") %></td>
		      	<td>
		      		<center>
		      			<a class="btn btn-primary btn-sm" href="./TrackOrders.jsp">Track</a>
		      		</center>
		      	</td>
		      	<td>
		      		<center>
		      			<a class="btn btn-danger btn-sm" href="CancelOrder.jsp?orderid=<%=rs.getInt("ORDERID") %>">Cancel</a>
		      		</center>
		      	</td>
		      	<td>
		      		<a class="btn btn-secondary btn-sm" href="UserBill.jsp?orderid=<%=rs.getInt("ORDERID")%>&pid=<%=rs.getInt("PRODUCTID")%>&orderdate=<%=rs.getString("ORDERDATE") %>">Generate</a>
		      	</td>
		      </tr>
		      <%} %>
		    </tbody>
		  </table>
	</div>
</div>
   	
</div>

</body>
</html>