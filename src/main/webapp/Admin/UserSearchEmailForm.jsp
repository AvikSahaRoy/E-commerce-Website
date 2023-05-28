<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-3">
			<%@ include file="AdminPage.jsp"%>
		</div>
		<div class="col-9 mt-3">
			<div class="container">
				<h3>User Email Search</h3>
				<form action="UserSearchEmail.jsp" method="post">
					<label for="exampleInputPassword1" class="form-label"><b>Search By Email:</b></label> 
					<input class="form-control" type="email" id="email" name="email" style="width: 300px;" /> <br> 
					<input class="btn btn-primary" type="submit" id="sub" value="Search" />
				</form>
			</div>
			<div class="container mt-3">
				<h3>User Name Search</h3>
				<form action="UserSearchEmail.jsp" method="post">
					<label for="exampleInputPassword1" class="form-label"><b>First Name:</b></label> 
					<input class="form-control" type="text" id="fname" name="fname" style="width: 300px;" /> 
					<label for="exampleInputPassword1" class="form-label"><b>Last Name:</b></label> 
					<input class="form-control" type="text" id="lname" name="lname" style="width: 300px;" /> <br> 
					<input class="btn btn-primary" type="submit" id="sub" value="Search" />
				</form>
			</div>
			<div class="container mt-3">
				<h3>User Phone Number Search</h3>
				<form action="UserSearchEmail.jsp" method="post">
					<label for="exampleInputPassword1" class="form-label"><b>Search By Phone Number:</b></label> 
					<input class="form-control" type="number" id="phno" name="phno" style="width: 300px;" /> <br> 
					<input class="btn btn-primary" type="submit" id="sub" value="Search" />
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>