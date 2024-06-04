<%@page import="com.example.model.WorkerMod"%>
<%@page import="com.example.model.ReviewsMod"%>
<%@page import="java.util.List"%>
<%@page import="com.example.model.BookingMod"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<style>
            #kok {
            border: 1px solid black;
            background-image: url(../images/namaste.jpg);
            background-size: cover;
           
            color: wheat;
        }
        #kok h3{
            color: aliceblue;
        }
    </style>
<body>
	<jsp:include page="../userheader.jsp"></jsp:include>
<jsp:include page="../UNavBar.jsp"></jsp:include>

	<div class="container-fluid" align='center'>
        <div class="row mb-5">
<form action="/YesManApp/AddReviewServlet" method="post" >
<%
			String workerId = request.getParameter("workerId");
System.out.println("productCode="+workerId);
			WorkerMod worker = new WorkerMod();
			worker= worker.getWorkerDetailsByworkerId(Integer.parseInt(workerId));
		
		
			
			%>
                <div class="col-md-3 " >
                
                    	
            </div>
            <div class="col-md-6 mt-5" id="kok" 
						                 	 >
                <h1 class="text-center mt-5"><i class="fa-solid fa-face-smile"></i>Review<i class="fa-solid fa-face-smile"></i></h1>
             <img src='../uploads/<%=worker.getWorkerPic()%>' class='mt-5'
						                 style='width: 15rem;'	 /><br>
             <label for="rating" class="mt-5"> 
                    <h6>Service Name</h6>
                </label>
                <input type="text" name="serviceName" value='<%=worker.getServiceName() %>' class="form-control" readonly><br>
             
              <label for="productCode" class="mt-5">
                    <h6>Worker Id</h6>
                </label>
               <span><%=worker.getWorkerId() %></span>
               <input type='hidden'  name="workerId" value="<%=worker.getWorkerId() %>">
                <h2 class="mt-3"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></h2>
               <pre><h3 class="">1 2 3 4 5</h3></pre>
                <label for="rating" class="mt-3"> 
                    <h6>Rating</h6>
                </label>
                <input type="number" name="rating" min='1' max='5' class="form-control" >
                <br>
                <label for="comment" class="mt-5">Comments</label>
                <textarea name="comments"  cols="40" rows="" class="mt-5 " placeholder="Any Suggestions" class="form-control" ></textarea>
                <br>
                <br>
             <button class="btn btn-success mb-5" value="Add Rating">Add Rating</button>
                <br>
            </div>
            <div class="col-md-3">

            </div>
        </form>
        
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
	
	</body>
	</html>
	