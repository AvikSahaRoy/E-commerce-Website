<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Login</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

body {
	font-family: 'Poppins', sans-serif;
    background-color: #152733;
}

.form-signinn {
	 
	 border-radius: 10px;
}

.ff {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form-signinn {
  max-width: 450px;
  width: 100%;
  padding: 35px;
  margin: auto;
}

.form-signinn {
  border-style: solid;
  border-color: #fff;
}

</style>
<body>

<div class="container ff">
	<main class="form-signinn">
	  <form action="AdminLogin2.jsp" method="post" align="center">
	    <h1 class="mb-4 fw-bold cp text-info">Admin Login</h1>
	
	    <div class="form-floating mb-2">
	      <input  class="form-control" id="floatingInput" name="n1" placeholder="User Name" required>
	      <label for="floatingInput">User Name</label>
	    </div>

	    <div class="form-floating mb-2">
	      <input  class="form-control" id="floatingInput" name="n2" type="password" placeholder="Password" required>
	      <label for="floatingInput">Password</label>
	    </div>
	
	    <button class="w-100 btn btn-lg btn-outline-info mb-2 mt-4" type="submit">Login</button>
	  </form>
	</main>
</div>

</body>
</html>