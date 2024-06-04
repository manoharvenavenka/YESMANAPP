<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp" />

</head>
<body>
        <jsp:include page="../custheader.jsp" />
      <jsp:include page="../UNavBar.jsp"></jsp:include>



<form action="/YesManApp/ProfilePicUpdateServlet" method="post" enctype="multipart/form-data">

        <div class="container mt-3 card " style="background-color:#C4D6C5;">
            <center>

            
            <h1 class="text-white text-large">Edit Image</h1>
            
            <input type="hidden" name="tableName" value='<%=request.getParameter("tableName") %>'>
            <input type="hidden" name="setColName" value='<%=request.getParameter("setColName") %>'>
            <input type="hidden" name="whereColName" value='<%=request.getParameter("whereColName") %>'>
            <input type="hidden" name="conditionValue" value='<%=request.getParameter("conditionValue") %>'>

            <br>
            <br>
            <div class="row">
                <div class="col-sm-3">

                </div>
                    <div class="col-sm-6">
                        <label><i class="fa-regular fa-file-image"></i> Upload Image</label>
                        
                    <input type="file" class="form-control" name="image1">
                </div>
            </div>
            <br>
            <br>
                <input type="submit" name="submit" class="form-control btn btn-md btn-outline-light p-3 "
                    style="width:150px" value="Update Image">
                    <br>
                    <br>
            </center>

        </div>
        </div>
        <br>


        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
        
</body>
</html>