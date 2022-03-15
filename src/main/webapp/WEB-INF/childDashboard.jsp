<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${userName}</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<!-- 
<style>
	h1, h3, h5, h6, p, hr {
    color:black;
    text-shadow: 0px 0px 5px linen;
    }
</style>
 -->

<body class="child-body">
	<div class="container mt-5 mb-5 p-5 rounded border1 child-box">
	
		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Welcome, ${userName}</h1>			
			</div>
			<div class="d-flex flex-wrap  justify-content-around">
		   		<a href="/logout" class="btn btn-lg btn-secondary ms-3 border1">Logout</a>				
		   		<a href="/chore/complete" class="btn btn-success btn-lg ms-3 border1">Redeem Points</a>
			</div>   		
   		</div>
		<div>
			<h5>you currently have ${pointTotal} points</h5>
			<hr>
		</div>		
				
		
	   		
	   		<div class="mt-3 p-3">
	   			<h3>Available Chores</h3>
		   		<table class="table table-light table-striped border1">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					      <th class="col-1"></th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.listed == true && !chore.working}">
						<tr>
							
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					<td>
								<form action="/childChore/add" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        		          																			        	
	        					<input type="submit" value="Accept" class="btn btn-primary  border1" />
	       						</form>		
							</td>		    					  					
					  	</tr>
						</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div class="p-3">
	   			<h3>Chores being done</h3>
		   		<table class="table table-light table-striped border1">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-3">Who is doing it</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.working && !chore.completed }">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.user.userName}</td>	
		   							    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
		
	</div>
</body>
</html>