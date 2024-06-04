<%@page import="dbutil.Cryptography"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark p-3 fixed-top"
		id="mainNav">
		<div class="container-fluid">
			<%
			String text = "12345";

			String encode = Cryptography.encode(text);
			System.out.println("encode = " + encode);

			String decode = Cryptography.decode(encode);
			System.out.println("decode = " + decode);
			%>
			<a class="navbar-brand" href="#"> <img
				src="./images/yesmanlogo.png" style="margin-left: 4rem;">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class=" collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto ">
					<li class="nav-item"><a class="nav-link mx-2 active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link mx-2" href="/YesManApp/About.jsp">About</a>
					</li>

					<li class="nav-item dropdown"><a
						class="nav-link mx-2 dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Logins </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="/YesManApp/Admin/AdminLoginPage.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="/YesManApp/Worker/WorkerLoginPage.jsp">Worker</a></li>
							<li><a class="dropdown-item" href="/YesManApp/User/UserLoginPage.jsp">User</a></li>
						</ul></li>
        <li class="nav-item"><a class="nav-link mx-2" href="/YesManApp/User/UserRegistration.jsp">New Registration</a></li>
							

					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div id="hero"
		style="background: url('./images/cover.webp') no-repeat; background-size: cover; background-position: top center">
		<h1 class="display-3 text-center text-white "
			style="padding-top: 45vh; padding-bottom: 85vh; text-shadow: 0px 3px 4px rgba(255, 255, 255, 0.8)">
			Welcome To YesManApp<i class="bi bi-person-walking"></i><i
				class="bi bi-arrow-up"></i>
		</h1>
	</div>
</body>
</html>