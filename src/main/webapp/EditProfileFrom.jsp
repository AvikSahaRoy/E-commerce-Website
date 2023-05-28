<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
      <title>Shopme - User Registration</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
        
</head>
<body>
<style>
/* all */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

:root {
  --main-blue: #71b7e6;
  --main-purple: #9b59b6;
  --main-grey: #ccc;
  --sub-grey: #d9d9d9;
}

body {
  display: flex;
  height: 100vh;
  justify-content: center; /*center vertically */
  align-items: center; /* center horizontally */
  background: linear-gradient(135deg, var(--main-blue), var(--main-purple));
  padding: 10px;
}
/* container and form */
.container {
  max-width: 700px;
  width: 100%;
  background: #fff;
  padding: 25px 30px;
  border-radius: 5px;
}
.container .title {
  font-size: 30px;
  font-weight: 500;
  position: relative;
  text-align: center;
}


/* Go To Home page redirecet start */
.gotohome {
	margin-left: 530px;
}

.gotohome a {
	font-size: 17px;
	color: #666666;
	margin: 0px;
}

.gotohome a:hover {
	text-decoration: none;
	color: #57b846;
}
/* Go To Home page redirecet End */

.container form .user__details {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
/* inside the form user details */
form .user__details .input__box {
  width: calc(100% / 2 - 20px);
  margin-bottom: 15px;
}

.user__details .input__box .details {
  font-weight: 500;
  margin-bottom: 5px;
  display: block;
}
.user__details .input__box input {
  height: 45px;
  width: 100%;
  outline: none;
  border-radius: 5px;
  border: 1px solid var(--main-grey);
  padding-left: 15px;
  font-size: 16px;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}

.user__details .input__box input:focus,
.user__details .input__box input:valid {
  border-color: var(--main-purple);
}


/* submit button */
form .button {
  height: 45px;
  margin: 45px 0;
}

form .button input {
  height: 100%;
  width: 100%;
  outline: none;
  color: #fff;
  border: none;
  font-size: 18px;
  font-weight: 500;
  border-radius: 5px;
  background: linear-gradient(135deg, var(--main-blue), var(--main-purple));
  transition: all 0.3s ease;
}

form .button input:hover {
  background: linear-gradient(-135deg, var(--main-blue), var(--main-purple));
}

select {
  height: 45px;
  width: 100%;
  outline: none;
  border-radius: 5px;
  border: 1px solid var(--main-grey);
  padding-left: 15px;
  font-size: 16px;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}

@media only screen and (max-width: 584px) {
  .container {
    max-width: 100%;
  }

  form .user__details .input__box {
    margin-bottom: 15px;
    width: 100%;
  }

  form .gender__details .category {
    width: 100%;
  }

  .container form .user__details {
    max-height: 300px;
    overflow-y: scroll;
  }

  .user__details::-webkit-scrollbar {
    width: 0;
  }
}

input:invalid {
  color: red;
}
input:valid {
  color: green;
}

form i {
    margin: 0px 0px 0px -35px;
    cursor: pointer;
    font-size: 20px;
    position: relative;
    bottom: 3px;
}

</style>
</head>
<body>

<%
   
Class.forName("oracle.jdbc.driver.OracleDriver");


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

//String email1 = (String)session.getAttribute("email");

String ProfileId = request.getParameter("Id");
session.setAttribute("ProfileId",ProfileId); 

PreparedStatement ps=conn.prepareStatement("select * from userregistration where email = ?");
ps.setString(1,ProfileId);
rs = ps.executeQuery();

while(rs.next())
{
%>

	<div class="container">		
		<div>
				<center><h2>Edit Profile</h2></center>
		</div>

		<form action="EditProfile.jsp" method="post">
			<div class="user__details">

				<div class="input__box">
					<span class="details">First Name</span> <input type="text"
						name="fname" pattern="[A-Za-z]{3,10}"
						title="First Name must be between 3 and 10 characters." value="<%= rs.getString("fname")%>" required>
				</div>
				<div class="input__box">
					<span class="details">Last Name</span> <input type="text"
						name="lname" pattern="[A-Za-z ]{3,10}"
						title="Last Name must be between 3 and 10 characters." value="<%= rs.getString("lname")%>" required>
				</div>
				
				<div class="input__box">
					<span class="details">Phone Number</span> <input type="tel"
						name="phno" maxlength="10" pattern="[6789][0-9]{9}"
						title="Phone number is not valid.." value="<%= rs.getString("phno")%>" required>
				</div>
				<div class="input__box">
					<span class="details">Date of Birth</span> <input type="date"
						name="dob" max="2007-12-31" value="<%= rs.getString("dob")%>" required>
				</div>

				<div class="input__box">
				  <span class="details">Gender</span> 
				  <select class="" name="gender" id="gender" required>
				    <option value="">None</option>
				    <option value="Male" <% if (rs.getString("gender").equals("Male")) { %> selected <% } %>>Male</option>
				    <option value="Female" <% if (rs.getString("gender").equals("Female")) { %> selected <% } %>>Female</option>
				    <option value="Others" <% if (rs.getString("gender").equals("Others")) { %> selected <% } %>>Others</option>
				  </select>
				</div>


				
			</div>

			<div class="button">
				<input type="submit" value="Update">
			</div>
		</form>
	</div>
	
	 <% }  %>
</body>

</html>