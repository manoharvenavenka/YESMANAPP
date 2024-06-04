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
		
		
function confirm_delete(workerId) {
    let ans = confirm("Do you Want To Update Worker");
       if (ans) {
           window.location = "/YesManApp/UpdateWorkerStatusServlet?n=1&workerId="+workerId+"&status=Active";
}
 }

</script>
</head>
<body>
	<jsp:include page="../adminheader.jsp"></jsp:include>
	<jsp:include page="../adminnav.jsp"></jsp:include>

	<div class="container mt-3" style="margin-bottom: 10rem">


		<%
		WorkerMod worker = new WorkerMod();
		List<WorkerMod> workerList = worker.getWorkerDetailsInAdmin();
		%>

		<%
		String res = request.getParameter("res");
		if (res != null) {
			if (res.equals("1")) {
		%>
		<div class="alert alert-success alert-dismissible" id='success_id'>
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			<strong>Well!</strong>Worker Status Updated.
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
			<u>View Worker Details</u>
		</h2>
		<br />
		<div class="table-responsive">
			<table class="table table-striped table-secoundary table-hover"
				id="table_id">
				<thead class="table-dark">
					<tr>

						<th>Slno</th>
						<th>Worker Id</th>
						<th>Full Name</th>
						<th>Registration Date</th>
						<th>service name</th>
						<th>Mobile</th>
						<th>Current Address</th>
						<th>Cities</th>
						<th>Worker Pic</th>
						<th>Aadhaar Pic</th>
						<th>Status</th>
						<th>Operation</th>
					</tr>
				</thead>
				<tbody>
					<%
					int slno = 0;
					for (WorkerMod workerOb : workerList) {
						slno++;
					%>
					<tr>


						<td><%=slno%></td>
						<td><%=workerOb.getWorkerId()%></td>
						<td><%=workerOb.getFullName()%></td>
						<td><%=workerOb.getRegistrationDate()%></td>
						<td><%=workerOb.getServiceName()%></td>
						<td><%=Cryptography.decode(workerOb.getMobile())%></td>
						<td><%=workerOb.getCurrentAddress()%></td>
						<td><%=workerOb.getCities()%></td>


						<td><img src='../uploads/<%=workerOb.getWorkerPic()%>'
							style='width: 80px; height: 80px' /></td>
						<td><img src='../uploads/<%=workerOb.getAadhaarPic()%>'
							style='width: 80px; height: 80px' /></td>
						<td><%=workerOb.getStatus()%></td>
						<td>
							<%
							//System.out.println("status= " + workerOb.getStatus().toString());
							if (workerOb.getStatus().toString().equalsIgnoreCase("inactive")) {
							%>
							 <input type="button" class="btn btn-sm btn-success"
							onclick="confirm_delete(<%=workerOb.getWorkerId()%>)"
							value="Active" />
							 <%
 } else {
 %>
 
 <a href="/YesManApp/UpdateWorkerStatusServlet?n=1&workerId=<%=workerOb.getWorkerId()%>&status=Inactive" class="btn btn-sm btn-danger">Inactive </a>
							<%-- <input type="button" class="btn btn-sm btn-danger"
							onclick="confirm(<%=workerOb.getWorkerId()%>)"
							value="Inactive" />  --%><%
 }
							
 %>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#table_id').DataTable();
			
			$('#success_id').slideUp(3000);
		});
	</script>





	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>