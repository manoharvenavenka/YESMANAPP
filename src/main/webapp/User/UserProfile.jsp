<%@page import="com.example.model.UserMod"%>
<%@page import="dbutil.Cryptography"%>
<%@page import="com.example.model.WorkerMod"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../head.jsp" />
<jsp:include page="../workerstyle.jsp" />

</head>
<body>
	<jsp:include page="../custheader.jsp" />
	<jsp:include page="../UNavBar.jsp"></jsp:include>
	<section>

		<div class="container emp-profile">
			<%
			UserMod users = new UserMod();
			List<UserMod> usersList = users.getUserById((int) session.getAttribute("userId"));
			%>
			<%
			for (UserMod usersobj : usersList) {
			%>
			<div class="row">
				<div class="col-md-4">
					<div class="profile-img">
						<img src='../uploads/<%=usersobj.getProfilePic()%>' alt="" />

						<div class="file btn btn-lg btn-primary">

							<a
								href='/YesManApp/User/EditProfilePic.jsp?tableName=users&setColName=profilePic&whereColName=userId&conditionValue=
            <%=usersobj.getUserId()%>&colName=profilePic'
								style="text-decoration: none; color: white;"> Change Photo</a>

						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="profile-head">
						<h5>
							<%
							String text = usersobj.getFullName();
							String decode = Cryptography.decode(text);
							System.out.println("decode = " + decode);
							%>
							<%=decode%>
						</h5>


						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">About</a></li>

						</ul>
					</div>
				</div>
				<div class="col-md-2">

					<a
						href='/YesManApp/User/DataEdituser.jsp?userId= <%=usersobj.getUserId()%> '
						style="text-decoration: none; color: rgb(172, 45, 45);"> <input
						type="button" class="btn btn-sm btn-info text-white"
						value="Edit Details"></a>

				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="profile-work"></div>
				</div>
				<div class="col-md-8">
					<div class="tab-content profile-tab" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<div class="row">
								<div class="col-md-6">
									<label>User Id</label>
								</div>
								<div class="col-md-6">
									<p>
										<%=usersobj.getUserId()%>
									</p>
								</div>
							</div>
							<div class="row">

								<div class="col-md-6">
									<label>Full Name</label>
								</div>
								<div class="col-md-6">
									<p>
										<%=decode%>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Registation Date</label>
								</div>
								<div class="col-md-6">
									<p>
										<%=usersobj.getRegistrationDate()%>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">


									<label>Phone</label>
								</div>
								<div class="col-md-6">
									<p>
										<%=usersobj.getMobile()%>
									</p>

								</div>
							</div>


							<div class="row">
								<div class="col-md-6">

									<label>Password</label>
								</div>
								<div class="col-md-6">
									<p>
										<%=Cryptography.decode(usersobj.getPassword())%>
									</p>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

	</section>
	<jsp:include page="../footer.jsp" />
</body>

</html>