<%@page import="com.example.model.ReviewsMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.BookingMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>

<script>
var a = confirm('This Web Site Wants To Allow Location');
if (a == true) {
	//  function getLocation() {
// Request permission for geolocation
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition, showError);
} else {
    alert("Geolocation is not supported by this browser.");
}

function showPosition(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    
    // Pass the latitude and longitude to the confirm_location function
    confirm_location(latitude, longitude);
}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            alert("User denied the request for Geolocation.");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("Location information is unavailable.");
            break;
        case error.TIMEOUT:
            alert("The request to get user location timed out.");
            break;
        case error.UNKNOWN_ERROR:
            alert("An unknown error occurred.");
            break;
    }
}

function confirm_location(latitude, longitude) {
    var ans = confirm("Do you want to open Maps?");
    if (ans) {
        // Redirect to Google Maps directions
        var workerLatitude = document.getElementById("workerLatitude").value;
        var workerLongitude = document.getElementById("workerLongitude").value;
        
        window.location.href = "https://www.google.com/maps/dir/" + latitude + "," + longitude + "/" + workerLatitude + "," + workerLongitude + "/";
    }
}
	}
function confirm_delete(bookingId) {
	   let ans = confirm("Do you Want To Update Booking");
    if (ans) {
        window.location = "/YesManApp/UpdateBookingStatusServlet?n=2&bookingId="+bookingId+"&status=OnTheWay";

    }
/* 	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition);
	} else {
		alert("Geolocation is not supported by this browser.");
	}
}

function showPosition(position) {
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
	document.getElementById("latitude").value = latitude;
	document.getElementById("longitude").value = longitude;
	// confirm_location(latitude, longitude);
}

function confirm_location(workerLatitude,workerLongitude) {
    let ans = confirm("Do you Want To Open Maps");
    if (ans) {
        // Redirect to Google Maps directions
        var latitude=document.getElementById("latitude").value;
         var longitude= document.getElementById("longitude").value;
         console.log("lon" + longitude);
       window.location = "https://www.google.com/maps/dir/"+latitude+ "," +longitude+"/"+workerLatitude+","+workerLongitude+"/";     
      // window.location = "https://www.google.com/maps/dir/?api=1&origin=" + latitude + "," + longitude + "&destination=" + workerLatitude + "," + workerLongitude;
          //https://www.google.com/maps/dir/17.4796537,78.3197601/17.9798016,79.5836416/
             
    }
}

		 
		 } */

</script>
</head>
<body>
	<jsp:include page="../custheader.jsp"></jsp:include>
	<jsp:include page="../workernav.jsp"></jsp:include>


	<div class="container-fluid">
		<div class="row ">


			<%
			//for vewing in the tble code 
			BookingMod booking = new BookingMod();
			List<BookingMod> bookinglist = booking.getWorkerBookings((int) session.getAttribute("workerId"));
			%>

			<%--<input type="hidden" name="workerLatitude" id="latitude"
									readonly> <input type="hidden" name="workerLongitude"
									id="longitude" readonly> <br>--%>


			<div class="col-sm-12">
				<h1 class="text text-center bg-success text-white">Bookings</h1>
				<div class='table-responsive'>
					<table class="table mt-5 table-bordered table-hover" id='table_id'>
						<thead class='table table-dark'>
							<tr>
								<th scope="col">SLNO</th>
								<th scope="col">Booking Id</th>
								<th scope="col">Booking Date</th>
								<th scope="col">User Id</th>
								<th scope="col">Status</th>

								<th scope="col">Operation</th>
								<th scope="col">Navigate</th>



							</tr>
						</thead>
						<tbody class='table  table-warning'>
							<%
							int slno = 0;

							for (BookingMod bookOb : bookinglist) {
							%>
							<tr>
								<td class="text-center"><%=slno++%></td>
								<td class="text-center"><%=bookOb.getBookingId()%></td>
								<td class="text-center"><%=bookOb.getBookingDate()%></td>
								<td class="text-center"><%=bookOb.getUserId()%></td>
								<td class="text-center"><%=bookOb.getStatus()%></td>
								

<script>
    function findDirections() {
        // Get user's current location using geolocation
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var yourLatitude = position.coords.latitude;
                var yourLongitude = position.coords.longitude;

                var workerLatitude = <%=bookOb.getWorkerLatitude() %>; // Assuming you have a method to get worker's latitude
                var workerLongitude = <%=bookOb.getWorkerLongitude() %>; // Assuming you have a method to get worker's longitude
                
                var url = "https://www.google.com/maps/dir/" + yourLatitude + "," + yourLongitude + "/" + workerLatitude + "," + workerLongitude + "/";
                
                window.open(url, "_blank"); // Open Google Maps in a new tab
            }, function(error) {
                console.error("Error getting user's location:", error);
            });
        } else {
            console.error("Geolocation is not supported by this browser.");
        }
    }
</script>


								<td class="text-center">
    <%
    //System.out.println("status= " + workerOb.getStatus().toString());
    if (bookOb.getStatus().toString().equalsIgnoreCase("Confirmed")) {
    %>
    <button type="button" class="btn btn-danger text-white" style="background-color: green" onclick="confirm_delete('<%=bookOb.getBookingId()%>')">
        Update
    </button>
    <%
    } else {
    %>
    <button class="btn btn-sm btn-success" disabled>
        <i class="bi bi-hand-thumbs-up-fill" style="font-size: 1.5rem"></i>
    </button>
    <%
    }
    %>
</td>

<script>
    function confirm_delete(bookingId) {
        let ans = confirm("Do you Want To Update Booking");
        if (ans) {
            window.location = "/YesManApp/UpdateBookingStatusServlet?n=2&bookingId=" + bookingId + "&status=OnTheWay";
        }
    }
</script>

								<input type="hidden" id="workerLatitude" value="<%=bookOb.getWorkerLatitude() %>">
<input type="hidden" id="workerLongitude" value="<%=bookOb.getWorkerLatitude() %>">
								
								<td class="text-center">
								
								
								<button onclick="findDirections()" class="btn btn-danger">Find Directions</button>
								
								<!-- <input type="button"
									class="btn btn-danger text-white" style="background-color: red"
									onclick="confirm_location()"
									value="Navigate" /> --><%--onclick="confirm_location('<%=bookOb.getWorkerLatitude()%>', '<%=bookOb.getWorkerLongitude()%>', document.getElementById(\"latitude\").value, document.getElementById(\"longitude\").value)"


<a  href="https://www.google.com/maps/dir/40.7128,-74.0060/<%=bookOb.getWorkerLatitude()%>,<%=bookOb.getWorkerLongitude()%>/" target="_blank"class="btn btn-info" style="background-color:white"><i class="bi bi-geo-alt-fill" style="color:red;font-size:1.5rem"></i></a>--%>
								</td>


							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>











	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>