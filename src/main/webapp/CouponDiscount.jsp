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

<%


  String couponCode = request.getParameter("couponCode");

  if (couponCode != null && couponCode.equals("SMASR09")) {
    if ((Double) session.getAttribute("totalPrice") >= 1500.0) {
      double discountPercent = 100.00;
	  session.setAttribute("discountPercent", discountPercent);
	  out.println("<script> swal({text: 'Coupon Added Successfully', icon: 'success', button: false, timer: 1500}); </script>");
	  request.getRequestDispatcher("Cart.jsp").include(request, response);
    } else {
  	  out.println("<script> swal({text: 'Amount must be 1500 or more', icon: 'warning', button: false, timer: 1500}); </script>");
  	  request.getRequestDispatcher("Cart.jsp").include(request, response);
    }
  }
  //else if (couponCode != null && couponCode.equals("ASH20")) {
	//  if ((Double) session.getAttribute("totalPrice") >= 2000.0) {
	//    double discountPercent2 = 800.00;
	//	session.setAttribute("discountPercent", discountPercent2);
	//	out.println("<script> swal({text: 'Coupon Added Successfully', icon: 'success', button: false, timer: 1500}); </script>");
	//	request.getRequestDispatcher("Cart.jsp").include(request, response);
	 //   } else {
	//    	  out.println("<script> swal({text: 'Amount must be 2000 or more', icon: 'warning', button: false, timer: 1500}); </script>");
	 //   	  request.getRequestDispatcher("Cart.jsp").include(request, response);
	 //     }
  //}
  else {
	  out.println("<script> swal({text: 'Invalid Coupon Code', icon: 'warning', button: false, timer: 1500}); </script>");
	  request.getRequestDispatcher("Cart.jsp").include(request, response);
  }
%>

</body>
</html>