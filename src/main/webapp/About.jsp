<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="head.jsp"></jsp:include>

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
      <img src="./images/yesmanlogo.png" style="margin-left: 4rem;">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link mx-2 active" aria-current="page" href="/YesManApp/index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link mx-2" href="#">About</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link mx-2 dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
             data-bs-toggle="dropdown" aria-expanded="false"> Logins </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
      	<li><a class="dropdown-item" href="/YesManApp/Admin/AdminLoginPage.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="/YesManApp/Worker/WorkerLoginPage.jsp">Worker</a></li>
							<li><a class="dropdown-item" href="/YesManApp/User/UserLoginPage.jsp">User</a></li>
          </ul>
        </li>
        <li class="nav-item"><a class="nav-link mx-2" href="/YesManApp/User/UserLoginPage.jsp">New Registration</a></li>
      </ul>
    </div>
  </div>
</nav>

<section class="py-5">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="text-center">
					<span class="text-muted">Our Story</span>
					<h2 class="display-5 fw-bold">About Us</h2>
					<p class="lead">My project is about providing house services where houses are damaged, and we connect skilled workers with homeowners in need. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quam nihil veniam dicta architecto, quos id nemo minima nulla ducimus officiis! Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				</div>
			</div>
		</div>
	</div>
</section>


</body>
</html>






