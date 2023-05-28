<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<style>
.swal-text {
	font-weight:bold;
	font-size:25px;
}
</style>
<body>
<%
//session.invalidate();  
session.removeAttribute("logemail");
out.println("<script> swal({ text: 'Logout Successful...', icon: 'success', button: false, timer: 1500}); </script>");
request.getRequestDispatcher("Home.jsp").include(request, response); 
%>
</body>
</html>