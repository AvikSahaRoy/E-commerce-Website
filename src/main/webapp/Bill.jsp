<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Base64, java.io.*" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopme Invoice</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="website icon" type="png" href="Images/favicon.png">
</head>
<style>
@media print {
  .print-only {
    display: none;
  }
    /* Hide the URL */
  @page {
    margin-bottom: 0.5cm;
  }
}

.brand {
	font-weight: bold;
	font-size: 25px;
	letter-spacing: 3px;
	color: #1DB954 !important;
}
.add, .content {
	text-align: center;
}

</style>
<body>
<%
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
	
	String sql, sql1, sql2;
	Statement stmt = conn.createStatement();
	Statement stmt1 = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	ResultSet rs, rs1, rs2;
	
	int orderid = Integer.parseInt(request.getParameter("orderid"));
	int productId = Integer.parseInt(request.getParameter("pid"));
	
	String orderdate = request.getParameter("orderdate");
	String email = (String)session.getAttribute("logemail");
		
	sql = "SELECT o.fname, o.lname, o.phno, o.email, o.address, o.country, o.state, o.pincode, o.payment, TO_CHAR(orderdate, 'dd/mm/yyyy HH:MI:SS AM') AS orderdate, TO_CHAR(deliverydate, 'dd/mm/yyyy') AS deliverydate FROM products p JOIN orders o ON p.id = o.productId WHERE o.email = '"+email+"' and o.orderdate BETWEEN TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS') AND TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS')";
	rs = stmt.executeQuery(sql);
	
	sql2 = "SELECT * FROM products p JOIN orders o ON p.id = o.productId WHERE o.email = '"+email+"' and o.orderdate BETWEEN TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS') AND TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS')";
	rs2 = stmt2.executeQuery(sql2);
	
	sql1 = "SELECT o.DISCOUNT, o.TOTALPRICE FROM products p JOIN orders o ON p.id = o.productId WHERE o.email = '"+email+"' and o.orderdate BETWEEN TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS') AND TO_DATE('"+orderdate+"', 'MM/DD/YYYY HH24:MI:SS')";
	rs1 = stmt1.executeQuery(sql1);
	
%>

   		  

<div class="container-fluid mt-5 mb-3">
    <div class="row d-flex justify-content-center">
    
        <div class="col-md-8">
            <div class="card">      
            	<center class="mt-2"><span class="brand"><i class="bi bi-bag-heart-fill"></i>Shopme</span></center>   
            	<hr>
                <center><h5>Invoice</h5></center>

                <div class="table-responsive p-2">
                    <table class="table table-borderless tt">
                        <tbody>
                        <%if (rs.next()) { %>
                        	<tr class="add">
                                <th>Delivery Address</th>
                                <th>Order Date</th>
                                <th>Delivery Date</th>
                                <th>Payment Method</th>
                            </tr>
                            <tr class="content">
                            	<div class="ms-4">
                            	<span><h5>Customer Details</h5></span> 
                            	<span><b>Name:</b> <%=rs.getString("FNAME") %> <%=rs.getString("LNAME") %> </span> <br>
	                            <span><b>Phone Number:</b> <%=rs.getString("PHNO") %> </span>	
	                             <p><b>Email:</b> <%=rs.getString("email") %> </p>	
                            	</div>

                                <td class="font-weight-bold">
	                               	<%=rs.getString("ADDRESS") %> <br>
						        	 <%=rs.getString("COUNTRY") %>,
						        	 <%=rs.getString("STATE") %>-
						        	 <%=rs.getInt("PINCODE") %>
                                </td>
                                <td><%=rs.getString("ORDERDATE") %></td>
                                <td><%=rs.getString("DELIVERYDATE") %></td>
                                 <td> <%=rs.getString("PAYMENT") %> <br> </td>
                            </tr>
                             <%} %>
                            
                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="products p-2">
                    <table class="table table-borderless">
                        <tbody>
                            <tr class="add">
                            	<th>Order ID</th>
                                <th>Product Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                            <%while (rs2.next()) { %>
                            <tr class="content">
                            	<td><%=rs2.getInt("ORDERID") %></td>
                                <td><%=rs2.getString("name") %></td>
                                <td>&#8377;<%=rs2.getString("PRICE") %></td> 
                                <td><%=rs2.getInt("QUANTITY") %></td>
                                <td>&#8377;<%= rs2.getInt("QUANTITY") * rs2.getInt("PRICE") %></td>
                  
                            </tr>
                             <%} %>
                              <%if (rs1.next()) { %>
                             <tr class="content">
                             <td></td>
                             <td></td>
                             <td></td>
                             <td><b>Discount: </b></td>
                             <td>&#8722;&#8377;<%= rs1.getDouble("DISCOUNT") %></td>
                             </tr>
           
                             <tr class="content">
                             <td></td>
                             <td></td>
                             <td></td>
                             <td><b>Grand Total:</b></td>
                             <td>&#8377;<%= rs1.getDouble("TOTALPRICE") %></td>
                             </tr>
                             <% } %>
                        </tbody>
                    </table>
                </div>
                <hr>
                <div style="text-align: center;">
                	<p style="font-size:13px;">Please call <b> 212456</b> in case of any doubts or questions. 
                	Please reply back to email in case of any issues with prices, packing charges, taxes and other menus 
                	issues.</p>
                </div>
                <div class="row" style="text-align: center;">
                    <div class="col-4">
                		Download the App:
                		<i class="bi bi-android2"></i>
                		<i class="bi bi-apple"></i>
                	</div>
                	<div class="col-4">
                		© 2023-Shopme. All rights reserved.
                	</div>
                	<div class="col-4">
                		Social Media: 
                		<i class="bi bi-facebook"></i>
                		<i class="bi bi-whatsapp"></i>
                		<i class="bi bi-twitter"></i>
                		<i class="bi bi-instagram"></i>
                	</div>
                </div>
                <hr>
                <div class="address p-2">
                    <center><a class="print-only btn btn-primary" onclick="printBill()">Print Invoice</a></center>
                </div>
                
            </div>
        </div>
    </div>
</div>


</body>

<script>
	function printBill() {
		window.print();
	}
</script>

</html>