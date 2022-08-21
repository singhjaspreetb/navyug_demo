<%@page import="navyug.java.to.Student"%>
<%@page import="navyug.java.to.SuperAdmin"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="navyug.java.to.Fees"%>
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

    .fees tr,
    .fees td {
      padding: 10px;
      border: 2px solid;
    }

    .pay_now {
      display: none;
      position: fixed;
      z-index: 1;
      padding-top: 100px;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0, 0, 0);
      background-color: rgba(0, 0, 0, 0.4);
    }

    .pay-content {
      background-color: #fefefe;
      margin: auto;
      padding: 20px;
      border: 1px solid #888;
      width: 50%;
    }

    .close {
      color: #aaaaaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
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
        <a href="fees.jsp" class="activ">Student Fees</a>
        <a href="studentview.jsp">Student List</a>
		<a href="<%=request.getContextPath() %>/superadmin/asssetlist?list=getlist">Assets Allocation </a>
        <a href="<%=request.getContextPath() %>/superadmin/registerlist?list=getlist">Register View </a>      
      </div>

      <div class="container">
        <nav class="navbar navbar-dark bg-dark justify-content-between">
          <h2 class="navbar-brand mr-auto ml-auto">Student Fees</h2>
        </nav>
        <table>
          <tr>
            <td>
                <img alt="logo"  class="img-fluid"  width="200px" src="../assets/navyug_logo.png">
            </td>
            <td class="cen">
            <%
            	int i=1;
            	List<Fees> lis=(List) session.getAttribute("FEES_VIEW");
            %>
              <h4>Name : <%=((Student) session.getAttribute("FEES_VIEW_ST")).getName() %></h4>
              <h6>Roll No. : <%=((Student) session.getAttribute("FEES_VIEW_ST")).getRollnumber() %></h6>
            </td>
              <td class="rig"> <img alt="profile" class="img-fluid"  width="200px" src="../assets/images/<%=((Student) session.getAttribute("FEES_VIEW_ST")).getPhoto() %>"> </td>
          </tr>
        </table>
        <table>
          <tr>
            <td colspan="2">
              <h6 class="title"> Accounts</h6>
            </td>
          </tr>
          <tr>
            <td colspan="1">
              <h5> Pending Fees :  <%=((Student) session.getAttribute("FEES_VIEW_ST")).getPending_fee() %></h5>
            </td>
            <td colspan="1" class="cen">
              <button type="button" name="button" class="btn login_btn" id="pay">Pay Now</button>
            </td>
          </tr>
        </table>

        <nav class="navbar navbar-dark bg-dark justify-content-between mt-4">
          <h2 class="navbar-brand mr-auto ml-auto">Fees History</h2>
        </nav>
        <% for(Fees u : lis){ %>
        <table class="fees">
          <tr>
            <td>
              <h6>Date : </h6>
            </td>
            <td colspan="2">
              <h6>Trans id : <%=u.getTransId() %></h6>
              <h6>Done by : <%=u.getDoneBy() %></h6>
            </td>
            <td colspan="2">
              <h6>Amount : <%=u.getAmount() %></h6>
            </td>
            <td colspan="2">
              <h6>Status : <%=u.getCheck() %></h6>
            </td>
            <td colspan="1">
              		<form name="addview_form" action="<%=request.getContextPath() %>/superadmin/deletefees" method="post">
              		<input type="hidden" name="sno" value="<%=u.getSno()%>">
              		<input type="hidden" name="id" value="<%=((Student) session.getAttribute("FEES_VIEW_ST")).getRollnumber() %>_<%=((Student) session.getAttribute("FEES_VIEW_ST")).getName() %>">
              		<button type="submit" class="btn btn-danger float-right">Remove</button>
              		</form>
            </td>
          </tr>
        </table>
	<%} %>
      </div>
    </div>
    <div id="paynow" class="pay_now">
      <div class="pay-content">
        <span class="close">&times;</span>
        <div class="d-flex justify-content-center form_container">
		<form name="addview_form" action="<%=request.getContextPath() %>/superadmin/payfees" method="post">
            <div class="input-group mb-2">
              <div class="input-group-append">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
              </div>
              <input type="hidden" name="done_by" value="<%=((SuperAdmin) session.getAttribute("CURRENT_SUPER_ADMIN")).getUserName() %>" >
              <input type="hidden" name="name" value="<%=((Student) session.getAttribute("FEES_VIEW_ST")).getName() %>" >
              <input type="hidden" name="roll_no" value="<%=((Student) session.getAttribute("FEES_VIEW_ST")).getRollnumber() %>" >
              <input type="hidden" name="pending_fee" value="<%=((Student) session.getAttribute("FEES_VIEW_ST")).getPending_fee() %>" >
              
              <input type="number" name="fees" class="form-control input_user" required="required" placeholder="Amount">
            </div>

            <div class="d-flex justify-content-center mt-3 login_container">
              <button type="submit" name="button" class="btn login_btn">Pay</button>
            </div>
          </form>
        </div>

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

      var modal = document.getElementById("paynow");
      var btn = document.getElementById("pay");
      var span = document.getElementsByClassName("close")[0];
      btn.onclick = function () {
        modal.style.display = "block";
      }
      span.onclick = function () {
        modal.style.display = "none";
      }
      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }
    </script>

  </body>

  </html>