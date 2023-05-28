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
				<h3>Add To Product</h3>
				<br>
				<form action="AddToProduct2.jsp" method="post">
					
					<label class="form-label"><b>Name:</b></label>
					<input class="form-control" type="text" id="name" name="name" style="width: 500px;" /> <br> 
					
					<label class="form-label"><b>Category:</b></label>
					<input class="form-control" type="text" id="category" name="category" style="width: 500px;" /> <br> 
					
					<label class="form-label"><b>Price:</b></label>
					<input class="form-control" type="text" id="price" name="price" style="width: 500px;" /> <br> 

					<label class="form-label"><b>Image:</b></label>
					<input class="form-control" type="file" id="price" name="imageFile" style="width: 500px;" /> <br> 
					
					<input class="btn btn-primary" type="submit" value="Add" />
				</form>
			</div>

		</div>
	</div>
</body>
</html>