<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>NavYug</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
	</head>
	<style>
		body {
		}
		
		.bgimage{
			background-image: url("assets/collage-background.png");
			position: fixed;
			background-size:cover;
			top:0;
  			left: 0;
  			right: 0;
  			z-index: -1;
  			display: block;
 			 width: 100%;
 			 height: 100%;
  			-webkit-filter: blur(5px);
  			-moz-filter: blur(5px);
  			-o-filter: blur(5px);
  			-ms-filter: blur(5px);
  			filter: blur(5px);
		}
		.container{
			z-index:999;
		}
		.logo {
			text-align: center;
			font-size: 3rem;
			font-weight: bolder;
			margin-top: 100px;
		}

		.home {
			margin-top: 20px;
			padding: 1%;
		}

		.home div {
			background: white;
			text-align: center;
			padding: 2%;
			margin-left: 10px;
			min-width: 80px;
		}

		.home div div {
			min-height: 100px;
		}

		.home div div h1 {
			font-size: 1.4rem;
			font-weight: bolder;
		}

		.home div div p {
			font-size: 1rem;
		}

		.home div button a {
			color: white;
			text-decoration: none;
			font-size: 1rem;
		}
		
		.logo_img{
			margin-top:30px;
		}
		
		.home div{
			  border-radius: 25px;
		}
		.home{
  box-shadow: 8px 8px 20px 8px rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		
		}
	</style>

	<body>
	<%
	if(request.getAttribute("Register")!=null){
		out.println("<script type=\"text/javascript\">");
		out.print("alert('Student Registred .......');");
		out.println("</script>");

	}      
	%>
		<div class="container">
		<div class="bgimage"></div>
			<!--<h1 class="logo">NAVYUG</h1>-->
			<div class="logo_img" >
			<img alt="logo" src="assets/navyug_logo.png" class="img-fluid mx-auto d-block" width="250px">
			</div>
			<div class="row home">
				<div class="col-lg">
					<div>
						<img alt="image" src="assets/admission-logo.png" class="img-fluid">
						<h1>New Admission</h1>
						<p>this is para for student.</p>
					</div>
					<a href="student/register.jsp"><button class="btn btn-primary">Register</button></a>
				</div>
				<div class="col-lg">
					<div>
						<img alt="image" src="assets/student-logo.png" class="img-fluid">
						<h1>Student</h1>
						<p>this is para for student.</p>
					</div>
					<a href="student/login.jsp"><button class="btn btn-primary">Login</button></a>
				</div>
				<div class="col-lg">
					<div>
						<img alt="image" src="assets/staff-logo.png" class="img-fluid">
						<h1>Employee</h1>
						<p>this is para for student.</p>
					</div>
					<a href="staff/login.jsp"><button class="btn btn-primary">Login</button></a>
				</div>
				<div class="col-lg">
					<div>
						<img alt="image" src="assets/admin-logo.png" class="img-fluid">
						<h1>Administration</h1>
						<p>this is para for student.</p>
					</div>
					<a href="admin/login.jsp"> <button class="btn btn-primary">Login</button></a>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="secure.js"></script>
	</html>
	