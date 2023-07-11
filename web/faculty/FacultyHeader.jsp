<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>ExamIn</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <%@include file="../links.jsp" %>
    <%@ page import="helpers.examindb" %>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="../assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">ExamIn</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2"><% String name=(String)session.getAttribute("username"); out.println(name); %></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
                <h6><% out.print(name); %></h6>
                <span>Faculty</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>


            <li>
              <a class="dropdown-item d-flex align-items-center" href="../signOut">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-heading">Groups</li>

        <li class="nav-item">
          <a class="nav-link collapsed" id="createGroup" href="createGroup.jsp">
            <i class="bi bi-bag-fill"></i>
            <span>Create Group</span>
          </a>
        </li>
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="updateGroup" href="updateGroup.jsp">
            <i class="bi bi-bag-plus-fill"></i>
            <span>Update Group</span>
          </a>
        </li>
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="removeGroup" href="deactiveGroup.jsp">
            <i class="bi bi-bag-x-fill"></i>
            <span>Deactive Group</span>
          </a>
        </li>
  
        <li class="nav-heading">User</li>
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="addUser" href="addUser.jsp">
            <i class="bi bi-person-plus-fill"></i>
            <span>Add User</span>
          </a>
        </li>
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="editUser" href="updateUser.jsp">
            <i class="bi bi-person-lines-fill"></i>
            <span>Edit User Details</span>
          </a>
        </li>
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="removeUser" href="deactiveUser.jsp">
            <i class="bi bi-person-x-fill"></i>
            <span>Deactive User</span>
          </a>
        </li>
  
        <li class="nav-heading">Exam</li>
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="createExam" href="createExam.jsp">
            <i class="bi bi-file-earmark-fill"></i>
            <span>Create Exam</span>
          </a>
        </li>
  
         <li class="nav-item">
          <a class="nav-link collapsed" id="editExam" href="updateExam.jsp">
            <i class="bi bi-file-earmark-diff-fill"></i>
            <span>Edit Exam</span>
          </a>
        </li> 
  
        <li class="nav-item">
          <a class="nav-link collapsed" id="demolishExam" href="demolishexam.jsp">
            <i class="bi bi-file-earmark-x-fill"></i>
            <span>Demolish Exam</span>
          </a>
        </li>
  
    </ul>

  </aside><!-- End Sidebar-->
  <%@include file="../scripts.jsp" %>