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
    <title>Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>



<body class="parent-body">
	<div class="container mt-5 mb-5 p-5 rounded parent-box" >
		
		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Parent Dashboard</h1>			
			</div>
			<div class="d-flex flex-wrap  justify-content-around">
		   		<a href="/edit/choreList" class="btn btn-info btn-lg ms-3 border1">Current Chore/Reward List</a>
		   		<a href="/logout" class="btn btn-lg btn-secondary ms-3 border1">Logout</a>				
			</div>   		
   		</div>
		
		
		<div class="ms-3">	
			<hr>		
	   		<table>
	   			<tbody>
	   			<c:forEach var="user" items="${users}">
	   			<c:if test="${!user.isParent }">
	   			<tr>
	   				<td><h5>${user.userName} has ${user.pointTotal} points</h5></td>
	   			</tr>
	   			</c:if>
	   			</c:forEach>
	   			</tbody>
	   		</table>
			<hr>
		</div>   		
			

		<div class="p-3">
		   
	   		<div>
	   			<h3>Redeemed Rewards</h3>
		   		<table class="table table-light table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-3">Points</th>   
					      <th class="col-3">Redeemed by</th>   
					      <th class="col-1">Pay Up</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${rewards}">			<!-- LOOP -->
						<c:if test="${reward.redeemed }">
						
						<tr>
		   					<td>${reward.rewardName}</td>			    					  					
		   					<td>${reward.cost}</td>	
		   					<td>${reward.user.userName}</td>	
		   					<td>
								<form action="/reward/reset" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectReward"  value="${reward.id}"/>																				        		          																			        	
	        					<input type="submit" value="Pay Up!" class="btn btn-success btn-sm border1" />
	       						</form>	
							</td>			   							    					  					
					  	</tr>
						</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		
	   		<div>
	   			<h3>Completed Chores</h3>
		   		<table class="table table-light table-striped">
					<thead>
					    <tr>				      
					      <th class="col-3">Chore</th>
					      <th class="col-2">By Who</th>   
					      <th class="col-1">Value</th>   
					      <th class="col-1">Verify</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.completed}">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.user.userName}</td>	
		   					<td>${chore.value}</td>	
		   					<td>
								<form action="/chore/reset" method="post" >       	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        	
	        					<input type="submit" value="Verify" class="btn btn-warning btn-sm border1" />
	       					</form>	
							</td>	
		   							    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		
	   		<div>	   		
	   			<h3>Chores being worked on</h3>
		   		<table class="table table-light table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					      <th class="col-2">Who is doing it</th>
					    
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.working && !chore.completed}">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					<td>${chore.user.userName}</td>
		   					    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
   		
   		</div>
		
		
	</div>
</body>
</html>