<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Services</title>
    <jsp:include page="../head.jsp"></jsp:include>
    <style>
        /* Add your custom styles for responsiveness here */
        @media (max-width: 768px) {
            .col-sm-3, .col-sm-6 {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../adminheader.jsp"></jsp:include>
<jsp:include page="../adminnav.jsp"></jsp:include>

<div class="container">
    <div class="card" style="background-color:#F1940E;margin-bottom: 10rem">
        <form class="card-body" action="/YesManApp/AddServices" method="post" enctype="multipart/form-data">
            <h2 class="mb-4 text-center" style="color:white;"><i class="fa-brands fa-servicestack" style="color:white;"></i> Add Services</h2>

            <div class="row">
                <div class="col-sm-3">
                </div>
                <div class="col-sm-7">
                    <div class="form-group">
                        <label for="serviceName" class="text-muted">Service Name</label>
                        <input type="text" class="form-control" id="serviceName" name="serviceName" placeholder="Service Name" style="border-radius: 7px">
                    </div>
                </div>
<div class="col-sm-3">
                </div>
                <div class="col-sm-7">
                    <div class="form-group">
                        <label for="servicePic">Service Picture</label>
                        <input type="file" class="form-control" id="servicePic" name="servicePic">
                    </div>
                </div>

                <div class="col-sm-12">
                    <%
                    String res = request.getParameter("res");
                    if (res != null) {
                        if (res.equals("0")) {
                            out.println("<h4 style='color:red'>Services not added</h4>");
                        } else {
                            out.println("<h4 style='color:green'>Services Added Successfully..</h4>");
                        }
                    }
                    %>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <button type="submit" class="btn btn-primary mt-5 mb-5">Add Services</button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
