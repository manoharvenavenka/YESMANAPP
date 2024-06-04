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





	<div class="container mt-5 mb-5">
		<form action='/YesManApp/AddUserServlet'  method="post" enctype="multipart/form-data" >
			<div class="card mx-auto "
				style="max-width: 1000px; max-height: 500;">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">Create User</h2>

					<div class="row">
						<div class="col-md-6">
						</div>
							<div class="mb-3">
								<label for="firstName" class="form-label fw-bold">FUll
									Name:</label> <input type="text" class="form-control" 
									name="fullName" placeholder="Enter your full name">
							</div>
                            <div class="mb-3">
                                <label for="mobile" class="form-label fw-bold">Mobile
                                    Number:</label> <input type="number" class="form-control" id="mobile"
                                    name="mobile" placeholder="Enter your mobile number">
                                </div>

							<div class="mb-3">
								 <input type="password" id="password"  name='password' oninput="checkPasswordStrength(this.value)"
  class="form-control form-control-lg" >
  <label class="form-label" for="password">Password:</label>
  <div id="password-strength"></div>
    </div>
  <div class="form-outline mb-4">
  <input type="password" id="cpassword" oninput="validatePasswords(this.value)" class="form-control form-control-lg" >
  <label class="form-label" for="password">Confirm-Password:</label>
  <div id="cpwdLabel"></div>
  </div>
  <script>
    function checkPasswordStrength(password) {
    	
      // Define your password strength criteria and calculations here
      // This is a simple example, you can modify it based on your requirements

      var strength = 0;

      // Check the length of the password
      if (password.length >= 8) {
        strength += 1;
      }

      // Check if the password contains both uppercase and lowercase characters
      if (/[a-z]/.test(password) && /[A-Z]/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one number
      if (/\d/.test(password)) {
        strength += 1;
      }

      // Check if the password contains at least one special character
      if (/[$&+,:;=?@#|'<>.^*()%!-]/.test(password)) {
        strength += 1;
      }

      // Display the password strength
      var strengthText = "";
      switch (strength) {
        case 0:
        case 1:
          strengthText = "Weak";
          break;
        case 2:
          strengthText = "Moderate";
          break;
        case 3:
        case 4:
          strengthText = "Strong";
          break;
      }

      document.getElementById("password-strength").innerHTML = "Password Strength: " + strengthText;
	  if(strengthText=="Weak"){
		document.getElementById("password-strength").style.color = 'red';
    }else if(strengthText=="Moderate"){
		document.getElementById("password-strength").style.color = 'blue';
    }else if(strengthText=="Strong"){
		document.getElementById("password-strength").style.color = 'green';
    }
	}
	
	
	
	function validatePasswords(cpassword){
		var cpwd = document.getElementById("password").value;
		if(cpassword == cpwd){
		document.getElementById("cpwdLabel").innerHTML = "Passwords match";
		document.getElementById("cpwdLabel").style.color = "green";
		}else{
		document.getElementById("cpwdLabel").innerHTML = "Passwords not match";
		document.getElementById("cpwdLabel").style.color = "red";
		}
	
	}
              
</script>
							</div>

							<div class="mb-3">
								<label for="ProfilePic" class="form-label fw-bold">Profile Pic:</label> 
								<input type="file" name="profilePic" class="form-control">
							</div>

							<div class="text-center mb-2">
					<button type="submit" class="btn btn-success">Submit</button>
				</div>
						</div>


					</div>
				</div>

				
				

			</div>
	</div>
	
	
	
</from>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>