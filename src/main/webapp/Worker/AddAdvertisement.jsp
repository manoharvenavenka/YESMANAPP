<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../custheader.jsp"></jsp:include>

<jsp:include page="../workernav.jsp"></jsp:include>
   

<div class="container mt-5 mb-5">
    <div class="card text-center" style="background-color:#87928C;">
        <form class="card-body" action="../AddAdvertisementServlet" method="post" enctype="multipart/form-data">
            <h2 class="mb-4 text-center" style="color:#490083 ;"><i class="fa-brands fa-servicestack" style="color: #0bf487;"></i> Add Advertisement</h2>

            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <label for="workerId">WorkerId</label>
                    <!-- Display workerId from session, readonly to prevent modification -->
                    <input type="text" class="form-control" name="workerId" id="workerId" value="<%= session.getAttribute("workerId") %>" readonly />
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <label for="advertisementStartDate">Advertisement Start Date</label>
                    <input type="date" class="form-control" name="advertisementStartDate" id="advertisementStartDate" />
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <label for="advertisementEndDate">Advertisement End Date</label>
                    <input type="date" class="form-control" name="advertisementEndDate" id="advertisementEndDate" />
                </div>
            </div>
            

            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <label>Advertisement Banner:</label>
                    <input type="file" class="form-control" name="advertisementBanner" /><br>
                    
                    <% String res = request.getParameter("res");
                    if (res != null) {
                        if (res.equals("0")) {
                            out.println("<h4 style='color:red'>Advertisement not added</h4>");
                        } else {
                            out.println("<h4 style='color:green'>Advertisement Added Successfully..</h4>");
                        }
                    }
                    %>

                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <label for="amount">Amount</label>
                    <input type="text" class="form-control" name="amount" id="amount" />
                </div>
            </div>
            
            <br>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Add Advertisement</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../footer.jsp" />
</body>
</html>
