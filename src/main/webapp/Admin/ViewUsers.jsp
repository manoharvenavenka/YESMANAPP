<%@page import="com.example.model.UserMod"%>
<%@page import="dbutil.Cryptography"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.WorkerMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>
</head>
<body>
	<jsp:include page="../adminheader.jsp"></jsp:include>
	<jsp:include page="../adminnav.jsp"></jsp:include>



	<div class="container mt-3" style="margin-bottom: 10rem">


		<%
		UserMod user = new UserMod();
		List<UserMod> userList = user.getUsersInAdmin();
		%>

		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Success!</strong>Order Status Updated.
		</div>
		<%
		} else if (res.equals("0")) {
		%>
		<div class="alert alert-danger alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Failed!</strong>Order Status not Updated.
		</div>
		<%
		}
		}
		%>
		<h2 class="text-center">
			<u>View User Details</u>
		</h2>
		<br />
		<div class="table-responsive">
			<table class="table table-striped table-success table-hover"
				id="table_id">
				<thead class="table-warning">
					<tr>

						<th>Slno</th>
						<th>UserId</th>
						<th>Full Name</th>
						<th>Registration Date</th>
						<th>Mobile</th>
						<th>Profile Pic</th>
						
					</tr>
				</thead>
				<tbody>
					<%
					int slno = 0;
					for (UserMod userob : userList) {
						slno++;
					%>
					<tr>


						<td><%=slno%></td>
						<td><%=userob.getUserId()%></td>
						<td><%=Cryptography.decode(userob.getFullName())%></td>
						<td><%=userob.getRegistrationDate()%></td>
						<td><%=userob.getMobile()%></td>
						


						<td><img src='../uploads/<%=userob.getProfilePic()%>'
							style='width: 80px; height: 80px' /></td>
						
						
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>






	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>