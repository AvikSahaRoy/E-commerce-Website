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
	font-size:25px;
	font-weight: bold;
}
</style>
<body>

<% session.removeAttribute("discountPercent");
out.print("<script> swal({text: 'Coupon Remove Successfully', icon: 'success', button: false, timer: 1500}); </script>");

request.getRequestDispatcher("Cart.jsp").include(request, response);
%>

</body>
</html>