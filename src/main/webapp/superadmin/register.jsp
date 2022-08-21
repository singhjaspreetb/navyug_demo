<%@page import="navyug.java.to.Student"%>
<%@page import="navyug.java.action.addstudent"%>
<%@page import="navyug.java.pro.AssetView"%>
<%@page import="navyug.java.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="navyug.java.to.Asset"%>
<%@page import="navyug.java.to.SuperAdmin"%>
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

    .sidebar {
      height: 100%;
      width: 0;
      position: fixed;
      z-index: 1;
      top: 0;
      left: 0;
      background-color: #111;
      overflow-x: hidden;
      transition: 0.5s;
      padding-top: 60px;
    }

    .sidebar a {
      padding: 8px 8px 8px 32px;
      text-decoration: none;
      font-size: 25px;
      color: #818181;
      display: block;
      transition: 0.3s;
    }

    .sidebar a:hover {
      color: #f1f1f1;
    }

    .sidebar .closebtn {
      position: absolute;
      top: 0;
      right: 25px;
      font-size: 36px;
      margin-left: 50px;
    }

    .openbtn {
      font-size: 20px;
      cursor: pointer;
      background-color: #111;
      color: white;
      padding: 10px 15px;
      border: none;
    }

    .openbtn:hover {
      background-color: #444;
    }

    #main {
      transition: margin-left .5s;
      padding: 16px;
    }

    /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
    @media screen and (max-height: 450px) {
      .sidebar {
        padding-top: 15px;
      }

      .sidebar a {
        font-size: 18px;
      }
    }

    .activ {
      color: white !important;
    }

    table {
      margin-top: 50px;
      width: 100%;
    }

    .cen {
      text-align: center !important;
    }

    .rig {
      text-align: right !important;
    }

    .title {
      font-weight: bolder;
      margin-bottom: 30px;
    }

    .activ {
      color: white !important;
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
        .asset tr,
    .asset td {
      padding: 10px;
      border: 2px solid;
    }
    
  </style>

  <body>
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div id="main">
          <button class="openbtn" onclick="openNav()">☰</button>
        </div>
        <a class="navbar-brand" href="#">NavYug</a>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <h5 class="nav-link"><%=((SuperAdmin) session.getAttribute("CURRENT_SUPER_ADMIN")).getUserName() %></h5>
          </li>
          <li class="nav-item">
            <img class="nav-link" alt="profile" src="">
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
          	<form method="POST" action="<%=request.getContextPath() %>/logout">
					<button type="submit" name="button" class="btn login_btn">Logout</button>
			</form>
          </li>
        </ul>
      </nav>

      <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <a href="home.jsp">Home</a>
        <a href="profile.jsp">My Profile</a>
        <a href="addadmin.jsp">Add Admin</a>
        <a href="adminview.jsp">Admin List</a>
        <a href="addstaff.jsp">Add Employee</a>
        <a href="staffview.jsp">Employee List</a>
        <a href="addstudent.jsp">Add Student</a>
        <a href="fees.jsp">Student Fees</a>
        <a href="studentview.jsp">Student List</a>
        <a href="<%=request.getContextPath() %>/superadmin/asssetlist?list=getlist">Assets Allocation </a>
        <a href="<%=request.getContextPath() %>/superadmin/registerlist?list=getlist" class="activ">Register View </a>
        
      </div>

      <div class="container">
        
                <nav class="navbar navbar-dark bg-dark justify-content-between mt-4">
          <h2 class="navbar-brand mr-auto ml-auto">Student Registration</h2>
        </nav>
        <%
        	List<Student> results=(List) session.getAttribute("LIST");
        	if(results!=null)
        	for(Student as : results){
        %>
         <table class="asset mb-4">
          <tr>
            <td>
              <h6>Name : <%=as.getName() %> </h6>
              <h6>Reg Number : <%=as.getRegnumber() %></h6>
            </td>
            <td>
              <h6>Number : <%=as.getContact() %> </h6>
              <h6>Email : <%=as.getEmail() %></h6>
            </td>
            <td>
              <h6>Branch: <%=as.getBranch() %> </h6>
              <h6>Course : <%=as.getCourse() %></h6>
            </td>
            <td>
            	<h6>Address : <%=as.getAddres() %></h6>
            </td>
          </tr>
        </table>
        <%}%>
       
      </div>
    </div>

    <script>
      function openNav() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
      }

      function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
      }
    </script>

  </body>

  </html>