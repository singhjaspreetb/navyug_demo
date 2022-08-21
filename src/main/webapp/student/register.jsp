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
			background: #f9f9f9;
		}

		.home {
			margin-top: 8%;
		}

		.user_card {
			height: auto;
			width: 350px;
			margin-top: auto;
			margin-bottom: auto;
			background: #24A0ED;
			position: relative;
			display: flex;
			justify-content: center;
			flex-direction: column;
			padding: 10px;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			border-radius: 5px;

		}

		.brand_logo_container {
			position: absolute;
			height: 170px;
			width: 170px;
			top: -75px;
			border-radius: 50%;
			background: #0044ff;
			padding: 10px;
			text-align: center;
		}

		.brand_logo {
			height: 150px;
			width: 150px;
			border-radius: 50%;
			border: 2px solid white;
		}

		.form_container {
			margin-top: 100px;
		}

		a {
			color: white;
			text-decoration: none;
		}

		a:hover {
			color: white;
			text-decoration: none;
			font-weight: bolder;
		}

		.login_btn {
			width: 100%;
			background: #0044ff !important;
			color: white !important;
		}

		.login_btn:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}

		.login_container {
			padding: 0 2rem;
		}

		.input-group-text {
			background: #0044ff !important;
			color: white !important;
			border: 0 !important;
			border-radius: 0.25rem 0 0 0.25rem !important;
		}

		.input_user,
		.input_pass:focus {
			box-shadow: none !important;
			outline: 0px !important;
		}
		.error{
			color: red;
			font-weight: bolder;
		}
		.bgimage{
			background-image: url("../assets/collage-background.png");
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
	</style>

	<body>
	<%
	if(request.getAttribute("err")!=null){
		String strExpired = (String) session.getAttribute("err");
		   out.println("<script type=\"text/javascript\">");
			out.print("alert('Error Student Already Registred !!!');");
		   out.println("</script>");
	}      
	%>
				<div class="bgimage"></div>
	
		<div class="home">
			<div class="container h-100">
				<div class="d-flex justify-content-center h-100">
					<div class="user_card">
						<div class="d-flex justify-content-center">
							<div class="brand_logo_container">
								<img src="../assets/navyug_logo.png"
									class="brand_logo p-2" alt="Logo">
							</div>
						</div>
						<div class="d-flex justify-content-center form_container">
							<form name="register_form" action="<%=request.getContextPath() %>/register" method="post">
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" value="" name="name" id="name" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" class="form-control input_user" required="required"
										placeholder="Name">
								</div>
								<p class="error" id="name_id"></p>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="number" id="number"  onKeyPress="if(this.value.length==10) return false;" name="number" class="form-control input_user" required="required"
										placeholder="Number">
								</div>
										<p class="error" id="number_id"></p>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="email" name="email" id="email"onkeypress="return /[0-9a-zA-Z.@_]/i.test(event.key)" class="form-control input_user" required="required"
										placeholder="Email">
								</div>
										<p class="error" id="email_id"></p>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="branch" id="branch" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" class="form-control input_user" required="required"
										placeholder="Branch">
								</div>
										<p class="error" id="branch_id"></p>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="course" id="course" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" class="form-control input_user" required="required"
										placeholder="Course">
								</div>
										<p class="error" id="course_id"></p>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="gender" id="gender" onKeypress="if(this.value.length==1) return false;" class="form-control input_user" required="required"
										placeholder="Gender">
								</div>
										<p class="error" id="gender_id"></p>
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="address" id="address" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" class="form-control input_user" required="required"
										placeholder="Address">
								</div>
										<p class="error" id="address_id"></p>
								<div class="d-flex justify-content-center mt-3 login_container">
									<button type="submit" name="button" class="btn login_btn">Register</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../secure.js"></script>
		<script type="text/javascript">
		document.getElementById("name").addEventListener("keypress", myname);
		document.getElementById("name").addEventListener("mouseover", myname);
		function myname() {
			var name= document.register_form.name.value;
			var paragraph = document.getElementById("name_id");
			if(name.length==0){
				paragraph.textContent="Please enter your name !!";
				document.register_form.name.focus();
			}
			if(name.length<5 && name.length!=0){
				paragraph.textContent="Name should be greater than 5 character !!!";
				document.register_form.name.focus();
			}
			if(name.length>5){
				paragraph.textContent="";
			}
		}

		document.getElementById("email").addEventListener("keypress", myemail);
		document.getElementById("email").addEventListener("mouseover", myemail);
		function myemail() {
			var email= document.register_form.email.value;
			var paragraph = document.getElementById("email_id");
			if(email.length==0){
				paragraph.textContent="Please enter your email !!";
				document.register_form.email.focus();
			}
			else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email))){
				paragraph.textContent="Enter valid email !!!";
				document.register_form.email.focus();
			}
			else{
				paragraph.textContent="";
			}
		}

		document.getElementById("number").addEventListener("keypress", mynumber);
		document.getElementById("number").addEventListener("mouseover", mynumber);
		function mynumber() {
			var number= document.register_form.number.value;
			var paragraph = document.getElementById("number_id");
			if(number.length==0){
				paragraph.textContent="Please enter your number !!";
				document.register_form.email.focus();
			}
			else if(!(/^[6-9]\d{9}$/.test(number))){
				paragraph.textContent="Enter valid Number !!!";
				document.register_form.number.focus();
			}
			else{
				paragraph.textContent="";
			}
		}

		document.getElementById("branch").addEventListener("keypress", mybranch);
		document.getElementById("branch").addEventListener("mouseover", mybranch);
		function mybranch() {
			var branch= document.register_form.branch.value;
			var paragraph = document.getElementById("branch_id");
			if(branch.length<1){
				paragraph.textContent="Please enter your branch !!";
				document.register_form.branch.focus();
			}
			else{
				paragraph.textContent="";
			}
		}

		document.getElementById("course").addEventListener("keypress", mycourse);
		document.getElementById("course").addEventListener("mouseover", mycourse);
		function mycourse() {
			var course= document.register_form.course.value;
			var paragraph = document.getElementById("course_id");
			if(course.length<1){
				paragraph.textContent="Please enter your course !!";
				document.register_form.course.focus();
			}
			else{
				paragraph.textContent="";
			}
		}

		document.getElementById("gender").addEventListener("keypress", mygender);
		document.getElementById("gender").addEventListener("mouseover", mygender);
		function mygender() {
			var gender= document.register_form.gender.value;
			var paragraph = document.getElementById("gender_id");
			if(gender!="M" || gender!="F" || gender!="T"){
				paragraph.textContent="Please enter your gender ( M | F | T ) !!";
				document.register_form.gender.focus();
			}
			else{
				paragraph.textContent="";
			}
		}

		document.getElementById("address").addEventListener("keypress", myaddress);
		document.getElementById("address").addEventListener("mouseover", myaddress);
		function myaddress() {
			var address= document.register_form.address.value;
			var paragraph = document.getElementById("address_id");
			if(address.length<5){
				paragraph.textContent="Please enter your Address !!";
				document.register_form.address.focus();
			}
			else{
				paragraph.textContent="";
			}
		}
		
		
		
		</script>
	</body>

	</html>