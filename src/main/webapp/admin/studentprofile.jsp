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
    .activ{
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
            <h5 class="nav-link">Name</h5>
          </li>
          <li class="nav-item">
            <img class="nav-link" alt="profile" src="">
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
        </ul>
      </nav>

      <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
        <a href="home.jsp">Home</a>
        <a href="profile.jsp">My Profile</a>
        <a href="addstaff.jsp">Add Employee</a>
        <a href="staffview.jsp">Employee List</a>
        <a href="addstudent.jsp">Add Student</a>
        <a href="fees.jsp">Student Fees</a>
        <a href="studentview.jsp" class="activ">Student List</a>    
        <a href="assets.jsp">Assets Allocation </a>  
        </div>

      <div class="container">
        <nav class="navbar navbar-dark bg-dark justify-content-between">
          <h2 class="navbar-brand mr-auto ml-auto">Student Profile</h2>
        </nav>
        <table>
            <tr>
              <td>
                <img alt="logo" src="">
              </td>
              <td class="cen">
                <h4>Student Profile</h4>
                <h6>Roll No : xxxxxxxx</h6>
                <h6>Current Section : 20BCS1</h6>
              </td>
              <td class="rig"> <img alt="profile" src=""> </td>
            </tr>
          </table>
          <table>
            <tr>
              <td colspan="2">
                <h6 class="title"> Personal Information</h6>
              </td>
            </tr>
            <tr>
              <td colspan="1">Name : xxxx</td>
              <td colspan="1"> Admission Date : xxxx</td>
            </tr>
            <tr>
              <td colspan="1">Roll Number : xxxx</td>
              <td colspan="1"> Registration NUmber : xxxx</td>
            </tr>
            <tr>
              <td colspan="1">Gender : xxxx</td>
              <td colspan="1"> Age : xxxx</td>
            </tr>
            <tr>
              <td colspan="1">Number : xxxx</td>
              <td colspan="1"> Email : xxxx</td>
            </tr>
            <tr>
              <td colspan="1">Father Name : xxxx</td>
              <td colspan="1"> Father Contact : xxxx</td>
            </tr>
            <tr>
              <td colspan="1">Branch : xxxx</td>
              <td colspan="1"> Course : xxxx</td>
            </tr>
            <tr>
              <td colspan="2">Address : xxxx</td>
            </tr>
          </table>
          <table class="mb-4 mb-4">
            <tr>
              <td colspan="2">
                <h6 class="title"> Accounts</h6>
              </td>
            </tr>
            <tr>
              <td colspan="1">Fees Status : Paid</td>
              <td colspan="1"> Fees Remaining : xxxxxxx </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="btn btn-danger float-right mt-4 mb-4">Remove</button>
                </td>
            </tr>
          </table>
        
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