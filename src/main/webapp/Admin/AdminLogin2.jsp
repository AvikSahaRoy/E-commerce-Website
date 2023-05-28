<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	font-size:20px;
}
</style>
<body>
<%
	String nm="", pwd="";
	nm = request.getParameter("n1");
	pwd = request.getParameter("n2");
	if(nm.equals("avik") && pwd.equals("12345") || nm.equals("ashmita") && pwd.equals("678910"))
	{
		//Session for Logout -->>  
	    session.setAttribute("adminlogin",nm); 
				
		session.setAttribute("username",nm);
		response.sendRedirect("UserDetails.jsp");

	}
	else {
		
		out.println("<script> swal({ text: 'Invalid name and password', icon: 'error', button: false, timer: 1500 }); </script>");
		request.getRequestDispatcher("AdminLogin.jsp").include(request, response);
	}
%>
</body>
</html>