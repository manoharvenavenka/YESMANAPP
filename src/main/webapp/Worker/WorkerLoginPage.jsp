<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>

<jsp:include page="../WorkerLoginStyle.jsp"></jsp:include>
<style>
  .navbar-nav .nav-link {
    color: white !important;
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




    <div class="container ">
        <div class="row mt-5">
          <div class="spContainer mx-auto">
            <div class="card px-4 py-5 border-0 shadow " style="margin-top:9rem;">
                <form action="/YesManApp/WorkerValidationServlet" method="post">
              <div class="d-inline text-left mb-3">
                <h3 class="font-weight-bold">Worker Login</h3>
                <p>Welcome To YesMan App Hope You Like Our Services!</p>
              </div>
              <div class="d-inline text-center mb-0">
                <div class="form-group mx-auto">
                  <input class="form-control inpSp" type="number" name="mobile" placeholder="MobileNumber">
                </div>
              </div>
              <div class="d-inline text-center mb-3">
                <div class="form-group mx-auto">
                  <input class="form-control inpSp" type="password" name="password" placeholder="Password">
                </div>
              </div>
              <div class="d-inline text-left mb-3">
                <div class="form-group mx-auto">
                  <button class="btn btn-primary mt-2" type="submit" >Confirm</button>
                </div>
              </div>
             
              
                <div class="d-inline text-left mt-5">
                <div class="form-group mx-auto mb-0">
                  <a class="text-black font-weight-bold regStr " href="Createworker.jsp">Register new account</a>
                </div>
            </form>
              </div>
            </div>
          </div>
        </div>
      </div>

</body>
</html>