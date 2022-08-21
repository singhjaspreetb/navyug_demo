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
			margin-top: 12%;
		}

		.user_card {
			height: 400px;
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

		.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
			background-color: #0044ff !important;
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
		.home{
			z-index:999;
		}
	</style>

	<body>
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
							<form name="login_form">
								<div class="input-group mb-3">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-user"></i></span>
									</div>
									<input type="text" name="username" onkeypress="return /[0-9a-zA-Z]/i.test(event.key)" id="username" class="form-control input_user" required="required"
										placeholder="username">
								</div>
								<p class="error" id="username_id"></p>
							
								<div class="input-group mb-2">
									<div class="input-group-append">
										<span class="input-group-text"><i class="fas fa-key"></i></span>
									</div>
									<input type="password" id="password" name="password" class="form-control input_pass" required="required"
										placeholder="password">
								</div>
								<p class="error" id="password_id"></p>
								
								<div class="form-group">
									<p class="error"><%=request.getAttribute("err")==null ? "" : request.getAttribute("err") %></p>
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customControlInline">
										<label class="custom-control-label" for="customControlInline">Remember
											me</label>
									</div>
								</div>
								<div class="d-flex justify-content-center mt-3 login_container">
									<button type="submit" name="button" class="btn login_btn">Login</button>
								</div>
							
							</form>
						</div>

						<div class="mt-4">
							<div class="d-flex justify-content-center links">
								<a href="#">Forgot your password?</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="../secure.js"></script>
		<script type="text/javascript">
		
		document.getElementById("username").addEventListener("keypress", myusername);
		document.getElementById("username").addEventListener("mouseover", myusername);
		function myusername() {
			var username= document.login_form.username.value;
			var paragraph = document.getElementById("username_id");
			if(username.length==0){
				paragraph.textContent="Please enter your name !!";
				document.login_form.username.focus();
			}
			if(username.length<4 && username.length!=0){
				paragraph.textContent="Name should be greater than 5 character !!!";
				document.login_form.username.focus();
			}
			if(username.length>3){
				paragraph.textContent="";
			}
		}
		
			
		document.getElementById("password").addEventListener("keypress", mypassword);
		document.getElementById("password").addEventListener("mouseover", mypassword);
		function mypassword() {
			var password= document.login_form.password.value;
			var paragraph = document.getElementById("password_id");
			if(password.length==0){
				paragraph.textContent="Please enter your Password !!";
				document.login_form.password.focus();
			}
			else{
				paragraph.textContent="";
			}
		}
		</script>			
	</body>

	</html>