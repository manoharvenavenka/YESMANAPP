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

<section class="p-3 p-md-4 p-xl-5">
  <div class="container">
    <div class="card border-light-subtle shadow-sm">
      <div class="row g-0">
        <div class="col-12 col-md-6">
          <img class="img-fluid rounded-start w-100 h-100 object-fit-cover" loading="lazy" src="../images/modhi.avif"
               alt="BootstrapBrain Logo">
        </div>
        <div class="col-12 col-md-6">
          <div class="card-body p-3 p-md-4 p-xl-5">
            <div class="row">
              <div class="col-12">
                <div class="mb-5">
                  <h3>Log in</h3>
                </div>
              </div>
            </div>
            <form class="p-3 mt-3" action="/YesManApp/AdminLoginValidationServlet" method="post">
              <div class="row gy-3 gy-md-4 overflow-hidden">
                <div class="col-12">
                  <label for="username" class="form-label">UserName <span class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="username" placeholder="Enter UserName" required>
                </div>
                <div class="col-12">
                  <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                  <input type="password" class="form-control" name="password" required>
                </div>
                <div class="col-12">
                  <div class="d-grid">
                    <button class="btn bsb-btn-xl btn-primary" type="submit">Log in now</button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>
