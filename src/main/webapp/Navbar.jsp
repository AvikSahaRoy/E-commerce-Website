<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

  <title>Shopme</title>
  <link rel="website icon" type="png" href="Images/favicon.png">
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.5/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  
</head>
<style>
/* Navbar Start -------------------*/
.nav-link {
	font-size: 18px;
	color: #ffffff !important;
}

.navbar-brand {
	font-weight: bold;
	font-size: 25px;
	letter-spacing: 3px;
}

.navbar .nav-link:hover {
	color: #1DB954 !important;
	
}

.navbar-brand {
	color: #1DB954 !important;
}

.nav-item .btn:hover {
	background-color: #1DB954 !important;
	color: #ffffff;
	border: 1px solid #1DB954 !important;
}

.navbar-brand {
	padding-left: 10px;
}

/* Navbar End -----------------------*/

/* Search Bar Suggestion Start --------*/
.autocomplete {
	position: relative;
	display: inline-block;
}

input {
	border: 1px solid transparent;
	padding: 10px;
	font-size: 16px;
}

input[type=text] {
	background-color: white;
	width: 100%;
}

input[type=submit] {
	color: #fff;
	cursor: pointer;
}

.autocomplete-items {
	position: absolute;
	border: 1px solid #d4d4d4;
	border-bottom: none;
	border-top: none;
	z-index: 99;
	top: 100%;
	left: 0;
	right: 0;
}

.autocomplete-items div {
	padding: 10px;
	cursor: pointer;
	background-color: #fff;
	border-bottom: 1px solid #d4d4d4;
}

.autocomplete-items div:hover {
	background-color: #1DB954 !important;
	color: white;
}

.autocomplete-active {
	background-color: DodgerBlue !important;
	color: #ffffff;
}
/* Search Bar Suggestion End --------*/

/* Underline active */
.nav-item .nav-link.active {
  font-weight: bold;
  color: #1DB954 !important;
  /*text-decoration-thickness: 0.2rem;*/
}
.nav-item .dropdown-item.active {
  font-weight: bold;
}

/* loading animation */
.loading {
   position: fixed;
   z-index: 9999;
   height: 2em;
   width: 2em;
   overflow: show;
   margin: auto;
   top: 0;
   left: 0;
   bottom: 0;
   right: 0;
   width: 4rem; 
   height: 4rem;
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

//connect
Connection connn = null;
try {
connn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADMIN2","java");
//out.println(" Connection status: " + conn + "<P>");
} catch(Exception e) {
//out.println("Connection failed: " + e.toString() + "<P>");      
}

String sqll;
Statement stmtt = connn.createStatement();
ResultSet rss;


%>
<!-- Navbar Start ------------------------------------------->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container">

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <a class="navbar-brand" href="./Home.jsp"><i class="bi bi-bag-heart-fill"></i>Shopme</a>

      <form autocomplete="off" class="navbar-form navbar-left" action="Search.jsp" style="width: 450px;">
        <div class="input-group autocomplete">
        
          <input id="myInput" type="text" class="form-control" placeholder="Search Here..." name="search" style="border-radius: 5px 0 0 5px;">
          
          <div class="input-group-btn">
            <button class="btn btn-default" type="submit" style=" background-color: #1DB954; border-radius: 0 5px 5px 0; ">
              <i class="bi bi-search"></i>
            </button>
          </div>
          
        </div>
      </form>
      

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item mx-2">
            <a class="nav-link" aria-current="page" href="./Home.jsp">Home</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link " aria-current="page" href="./Shopping.jsp">Shopping</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link " aria-current="page" href="./AboutUs.jsp">About Us</a>
          </li>
          <li class="nav-item mx-2">
            <a class="nav-link " aria-current="page" href="./ContactUs.jsp">Contact Us</a>
          </li>
          <%
          String email11 = (String)session.getAttribute("logemail");

          sqll = "SELECT COUNT(productid) AS count FROM cart WHERE email = '"+email11+"'";
          rss = stmtt.executeQuery(sqll);
          while(rss.next()) {
          %>
          <li class="nav-item mx-2">
            <a class="nav-link " aria-current="page" href="Cart.jsp"><i class="bi bi-cart3"></i> Cart 
            <%
            if(rss.getInt("count") != 0) {
            	out.print("<span class='badge bg-danger'>"+ rss.getInt("count")+"</span>");
            }
            %>
            </a>
          </li>
          <% 
          int count = rss.getInt("count");
          session.setAttribute("count", count);
          } %>
          <% 
	          String email1 = (String)session.getAttribute("logemail");
	          if(email1 !=null) { 
          %>
         <!--  <li class="nav-item mx-2">
            <a class="btn btn-danger btn-sm"
              style="margin-top: 7px; font-weight: bold; padding: 0px 25px 0px 20px; font-size: 18px; box-shadow: none;"
              href="./Logout.jsp" role="button"><i class="bi bi-box-arrow-in-left"></i> Logout</a>
          </li> -->
          
          <li class="nav-item mx-2">
          	<div class="dropdown ">
	          <a href="#" class="d-block link-dark text-decoration-none nav-link dropdown-toggle" role="button" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="Images/UserDefaultimg.jpg" alt="mdo" width="30" height="30" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu dropdown-menu-dark" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 44px, 0px);" data-popper-placement="bottom-start" aria-labelledby="dropdownUser1">
	            <li><a class="dropdown-item text-light" href="./UserProfileCard.jsp">Profile</a></li>
	            <li><a class="dropdown-item text-light" href="./Orders.jsp">Orders</a></li>
	            <li><a class="dropdown-item text-light" href="./CouponPage.jsp">My Coupon</a></li>
	            <li><a class="dropdown-item text-light" href="./ChangePassword.jsp">Change Password</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li>                         		
              		<button class="btn btn-danger btn-sm"
              		style="margin-top: 7px; margin-left: 15px; font-weight: bold; padding: 0px 25px 0px 20px; font-size: 18px; box-shadow: none;"
              		 onclick="showPopup()"><i class="bi bi-box-arrow-in-left"></i> Logout</button>
              	</li>
	          </ul>
        	</div>
          </li>
          
          <% } else { %>
          <li class="nav-item mx-2">
            <a class="btn btn-light btn-sm"
              style="margin-top: 7px; font-weight: bold; padding: 0px 25px 0px 20px; font-size: 18px; box-shadow: none;"
              href="./UserLogin.jsp" role="button"><i class="bi bi-box-arrow-in-right"></i> Login</a>
          </li>

         <% } %>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Navbar End ------------------------------------------->

	<!-- Loading Animation--------------------------------------------- -->
	<div class="loading spinner-border text-warning" role="status" id="loading">
	  <span class="visually-hidden">Loading...</span>
	</div>
	<!-- Loading Animation End ---------------------------------------- -->

</body>
<script>

// Loading Animation ------------------------------------
document.onreadystatechange = function () {
   const loading = document.getElementById("loading");
   if (document.readyState !== "complete") {
      loading.style.display = "block";
   } else {
      loading.style.display = "none";
   }
};
//----------------------------------------------------------

// Underline active -------------------------------------->>>>>>>>>>>
const links = document.querySelectorAll('.nav-item a');
links.forEach(link => {
  if (link.href === window.location.href) {
    link.classList.add('active');
  }
});

// ---------------------------------------------------------------------


// Logout Permission -------------------------------------->>>>>>>>>>>

function showPopup() {
	  // Show the confirmation message in a SweetAlert popup with the image
	  Swal.fire({
	    title: 'Are you sure?',
	   	text: 'You want to Logout',
	    icon: 'warning',
	    showCancelButton: true,
	    confirmButtonText: 'Yes',
	    cancelButtonText: 'No',
	    confirmButtonColor: '#3085d6',
	    cancelButtonColor: '#d33'
	  }).then((result) => {
	    if (result.isConfirmed) {
	      // Redirect to the logout URL
	      window.location.href = "Logout.jsp";
	    }
	  });
	}




// Search Bar Suggestion Start ------------------------------------------------>>>>>>

function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}


var Products = [
	"Shirt", "T-shirt", "Full Sleave T-shirt",
	"Footwear", "Sport Shoes",
	"Heeled Sandals", "Heels",
	"Coats and Jackets", "Women Jacket", "Men Jacket",
	"Dresses",
	"Kids Wear",
	"Traditional Wear",
	"Gym Wear"
	];
/*initiate the autocomplete function on the "myInput" element, and pass along the Products array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), Products);

//Search Bar Suggestion End ------------------------------------------------>>>>>>
</script>
</html>