<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>

<style>
  .navbar-nav .nav-link {
    color: black !important;
  }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark p-3" id="mainNav">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="../images/yesmanlogo.png" style="margin-left: 4rem;">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link mx-2 active" aria-current="page" href="/YesManApp/index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link mx-2" href="/YesManApp/About.jsp">About</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link mx-2 dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
             data-bs-toggle="dropdown" aria-expanded="false"> Logins </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
      	<li><a class="dropdown-item" href="/YesManApp/Admin/AdminLoginPage.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="/YesManApp/Worker/WorkerLoginPage.jsp">Worker</a></li>
							<li><a class="dropdown-item" href="/YesManApp/User/UserLoginPage.jsp">User</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link mx-2" href="/YesManApp/User/UserRegistration.jsp">New Registration</a></li>
      </ul>
    </div>
  </div>
</nav>

<form action="/YesManApp/UserValidationServlet" method="post">
<div class="container-fluid  mt-5" >
        <div class="row justify-content-center" > <!-- Center the columns -->
            <div class="col-sm-8 col-md-6 col-lg-4"> <!-- Adjust column width based on device size -->
                <div class="card" id="box1">
                    <div class="card-body" style="background-image: url(../images/wel.avif);background-size: cover;">
                        
                            <h1 class="text-center">User Login</h1> <!-- Center the heading -->
                            <div class="mb-3">
                                <label for="fullName" class="form-label">UserName:</label>
                                <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Enter your Fullname">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password:</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password">
                            </div>
                            <div class="mb-3 text-center"> <!-- Center the button and link -->
                                <input type="submit" id="signin" class="btn btn-success" value="Signin">
                                <br><br><br>
                                <a href="UserRegistration.jsp" style="color: green;text-decoration: none;">New Customer? Register Here...</a>
                            </div>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
      </form>
</body>
</body>
</html>