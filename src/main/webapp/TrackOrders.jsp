<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Track Order</title>
<link rel="website icon" type="png" href="Images/favicon.png">
<!-- UniIcon CDN Link  -->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}


.main{
    width: 100%;
    height: 90vh;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
.head{
    text-align: center;
}
.head_1{
    font-size: 40px;
    font-weight: 600;
    color: #333;
}
.head_1 span{
    color: #0799fa;
}
.head_2{
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-top: 3px;
}
ul{
    display: flex;
    margin-top: 80px;
}
ul li{
    list-style: none;
    display: flex;
    flex-direction: column;
    align-items: center;
}
ul li .icon{
    font-size: 35px;
    color: #ff4732; 
    margin: 0 60px;
}
ul li .text{
    font-size: 18px;
    font-weight: 600;
    
}

/* Progress Div Css  */

ul li .progress{
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background-color: rgba(68, 68, 68, 0.781);
    margin: 14px 0;
    display: grid;
    place-items: center;
    color: #fff;
    position: relative;
    cursor: pointer;
}
.progress::after{
    content: " ";
    position: absolute;
    width: 125px;
    height: 5px;
    background-color: rgba(68, 68, 68, 0.781);
    right: 30px;
}
.one::after{
    width: 0;
    height: 0;
}
ul li .progress .uil{
    display: none;
}
ul li .progress p{
    font-size: 13px;
}

/* Active Css  */

ul li .active{
    background-color: #0799fa;
    display: grid;
    place-items: center;
}
li .active::after{
    background-color: #0799fa;
}
ul li .active p{
    display: none;
}
ul li .active .uil{
    font-size: 20px;
    display: flex;
}

/* Responsive Css  */

@media (max-width: 980px) {
    ul{
        flex-direction: column;
    }
    ul li{
        flex-direction: row;
    }
    ul li .progress{
        margin: 0 30px;
    }
    .progress::after{
        width: 5px;
        height: 55px;
        bottom: 30px;
        left: 50%;
        transform: translateX(-50%);
        z-index: -1;
    }
    .one::after{
        height: 0;
    }
    ul li .icon{
        margin: 15px 0;
    }
}

@media (max-width:600px) {
    .head .head_1{
        font-size: 24px;
    }
    .head .head_2{
        font-size: 16px;
    }
}




</style>
<body>
<%
String orderId = request.getParameter("orderid");

//Connect to the database
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ADMIN2","java");

//Query the database for the order information
PreparedStatement ps=con.prepareStatement("SELECT * FROM orders WHERE orderId=?");
ps.setString(1, orderId);
ResultSet rs=ps.executeQuery();

if (rs.next()) {
 String orderDateString = rs.getString("ORDERDATE");
 String deliveryDateString = rs.getString("DELIVERYDATE");

 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
 Date orderDate = formatter.parse(orderDateString);
 Date deliveryDate = formatter.parse(deliveryDateString);
 Date currentDate = new Date();

 long diffInMillies = Math.abs(currentDate.getTime() - orderDate.getTime());
 long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

 String orderStatus = "";
%>
 <div class="main">
		<h2 style="padding-bottom: 10px;">ORDER ID #<%=rs.getInt("ORDERID") %></h2>
        <div class="head">
            <p class="head_1"><span>Track</span> Your Order</p>
        </div>

        <ul>
            <li>
                <i class="icon bi bi-journal-check"></i>
                <div class="progress one">
                    <p>1</p>
                    <i class="uil uil-check"></i>
                </div>
                <p class="text">Order Confirmed</p>
                <p><%=rs.getString("ORDERDATE") %></p>
            </li>
            <li>
                <i class="icon bi bi-arrow-repeat"></i>
                <div class="progress two">
                    <p>2</p>
                    <i class="uil uil-check"></i>
                </div>
                <p class="text">Processing</p>
            </li>
            <li>
               
                <i class="icon bi bi-box-seam-fill"></i>
                <div class="progress three">
                    <p>3</p>
                    <i class="uil uil-check"></i>
                </div>
                <p class="text">Packed</p>
            </li>
            <li>
                <i class="icon bi bi-bag-check-fill"></i>
                <div class="progress four">
                    <p>4</p>
                    <i class="uil uil-check"></i>
                </div>
                <p class="text">Shipped</p>
            </li>
            <li>
                <i class="icon bi bi-truck"></i>
                <div class="progress five">
                    <p>5</p>
                    <i class="uil uil-check"></i>
                </div>
                <p class="text">Order In Route</p>
            </li>
            <li>
                <i class="icon bi bi-house-heart-fill"></i>
                <div class="progress six">
                    <p>6</p>
                    <i class="uil uil-check"></i>
                </div>
                <p class="text">Order Delivered</p>
                <p><%
					  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					  Date deliveryDate1 = rs.getTimestamp("DELIVERYDATE");
					  String formattedDate = dateFormat.format(deliveryDate1);
					%>
					<%= formattedDate %>
                </p>
            </li>
        </ul>

    </div>


</body>
<script>
const one = document.querySelector(".one");
const two = document.querySelector(".two");
const three = document.querySelector(".three");
const four = document.querySelector(".four");
const five = document.querySelector(".five");
const six = document.querySelector(".six");

<% if (diffInDays == 0) { orderStatus = "Ordered"; %>
    one.classList.add("active");
    
<% } else if (diffInDays == 1) { orderStatus = "Order Processing";  %>
one.classList.add("active");
two.classList.add("active");

<%} else if (diffInDays == 2) { orderStatus = "Order Packed";  %>
one.classList.add("active");
two.classList.add("active");
three.classList.add("active");

<%}  else if (diffInDays == 3) { orderStatus = "Order Shipped";  %>
one.classList.add("active");
two.classList.add("active");
three.classList.add("active");
four.classList.add("active");

<%} else if (diffInDays == 4) { orderStatus = "Order In Route";  %>
one.classList.add("active");
two.classList.add("active");
three.classList.add("active");
four.classList.add("active");
five.classList.add("active");

<%} else if (diffInDays == 5) { orderStatus = "Order Arrived";  %>
one.classList.add("active");
two.classList.add("active");
three.classList.add("active");
four.classList.add("active");
five.classList.add("active");
six.classList.add("active");
<%}  %>

</script>
<%} %>
</html>