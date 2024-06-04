<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.UserMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../custheader.jsp"></jsp:include>
<jsp:include page="../UNavBar.jsp"></jsp:include>





	<div class="container mt-5 mb-5">
		<form action='/YesManApp/UpdateUserDataServlet'  method="post"  >
				<%
			//String userId = request.getParameter("userId");
				//System.out.println("userId="+userId);
			//	String userId = request.getParameter("userId");
				//System.out.println("u111111111="+userId);
		UserMod user= new UserMod();
		
			  user=user.getProfileByUserId((int)session.getAttribute("userId"));
			
			
			
			%>
			
			
			<div class="card mx-auto "
				style="max-width: 1000px; max-height: 500;">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">Update Your Details</h2>

					<div class="row">
						<div class="col-md-6">
						<input type="hidden" name="userId" value="<%=user.getUserId() %>" >
						</div>
							<div class="mb-3">
								<label for="firstName" class="form-label fw-bold">FUll
									Name:</label> <input type="text" class="form-control" 
									name="fullName" value="<%=Cryptography.decode(user.getFullName())%>">
							</div>
                            <div class="mb-3">
                                <label for="mobile" class="form-label fw-bold">Mobile
                                    Number:</label> <input type="number" class="form-control" id="mobile"
                                    name="mobile"  value="<%=user.getMobile()  %>">
                                </div>

							<div class="mb-3">
								 <input type="text" id="password"  name='password' oninput="checkPasswordStrength(this.value)" value="<%=Cryptography.decode(user.getPassword())  %>"
  class="form-control form-control-lg" >
  <label class="form-label" for="password">Password:</label>
  
  <div id="password-strength"></div>
    </div>
  <div class="form-outline mb-4">
  <input type="password" id="cpassword" oninput="validatePasswords(this.value)"   value="<%=Cryptography.decode(user.getPassword())  %>" class="form-control form-control-lg" >
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

							

							
						</div>


					</div>
				</div>

				
				<div class="text-center mb-2">
					<button type="submit" class="btn btn-success">Update</button>
				</div>
				</from>
				
	
	


<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>