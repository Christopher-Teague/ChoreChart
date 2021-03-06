
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
    <title>Redeem your Points</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="child-body">
	<div class="container mt-5 mb-5 p-5 rounded border border-dark child-box">
		
		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>${userName}, Redeem your points</h1>			
			</div>
			<div class="d-flex flex-wrap  justify-content-around">
		   		<a href="/dashboard" class="btn btn-success btn-lg ms-3 border1">Dashboard</a>
			
			</div>   		
   		</div>
		<div>
			<h5>Total points: ${pointTotal}</h5>
			<hr>
		</div>	
		
		
			   		
	   		<div class="mt-3 p-3">
	   			<h3>Current Chores</h3>
		   		<table class="table table-light table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Chore</th>
					      <th class="col-1">Value</th>
					      <th class="col-2"></th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
						<c:if test="${chore.user.id == user_id && chore.working && !chore.completed}">
						<tr>
		   					<td>${chore.choreName}</td>			    					  					
		   					<td>${chore.value}</td>	
		   					<td>
		   					
								<form action="/chore/markDone" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        		          																			        	
	        					<input type="submit" value="Done" class="btn btn-warning border1 " />
	       						</form>	
		   									
							</td>		    					  					
					  	</tr>
						</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>

	   		<div class="mt-3 p-3">
	   			<h3>Rewards</h3>
	   			
		   		<table class="table table-light table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-1">Cost</th>   
					      <th class="col-2">Claim</th>
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${rewards}">			<!-- LOOP -->
						<c:if test="${reward.listed == true && !reward.redeemed}">
						<tr>
		   					<td>${reward.rewardName}</td>			    					  					
		   					<td>${reward.cost}</td>	
		   					<td>
		   					
		   					<c:if test="${reward.cost <= pointTotal }">
		   						<form action="/reward/claim" method="post" >                 	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectReward"  value="${reward.id}"/>																				        		          																			        	
	        					<input type="submit" value="Claim" class="btn btn-primary border1 " />
	       						</form>
	       					</c:if>		
		   					</td>		    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	   		<div class="mt-3 p-3">
	   			<h3>Redeemed Rewards</h3>
		   		<table class="table table-light table-striped">
					<thead>
					    <tr>				      
					      <th class="col-4">Reward</th>
					      <th class="col-3">Points</th>   
					      <th class="col-3">By who?</th>   
					     
						</tr>
					</thead>
					<tbody>
					  	<c:forEach var="reward" items="${rewards}">			<!-- LOOP -->
						<c:if test="${reward.redeemed}">
						<tr>
		   					<td>${reward.rewardName}</td>			    					  					
		   					<td>${reward.cost}</td>	
		   					<td>${reward.user.userName}</td>	
		   							    					  					
					  	</tr>
					  	</c:if>
						</c:forEach>								<!-- END LOOP -->
					</tbody>
				</table> 
	   		</div>
	
	
	</div>
</body>
</html>