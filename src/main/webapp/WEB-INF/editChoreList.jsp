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
    <title>Edit Chore/Reward Lists</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="parent-body">
	<div class="container mt-5 mb-5 p-5 rounded parent-box" >
		<div class="d-flex">
			<div class="flex-grow-1">
		   		<h1>Edit Chore & Reward Lists</h1>
			</div>
			<div class="d-flex flex-wrap  justify-content-around">
		   		<a href="/chore/new" class="btn btn-lg btn-success me-3 border1">Create New Chore/Reward</a>
		   		<a href="/parentDashboard" class="btn btn-lg btn-primary border1">Home</a>				
			</div>   		
   		</div>
   		<hr>
		<div class="p-3">	   		
   			<h3>Current Chore List</h3>
	   		<table class="table table-light table-striped">
				<thead>				    
				    <tr>				      
				    	<th class="col-4">Chore</th>
				      	<th class="col-1">Value</th>
				      	<th class="col-1"></th>    				     
					</tr>					
				</thead>
				<tbody>
				  	<c:forEach var="chore" items="${chores}">			<!-- LOOP -->
					<c:if test="${chore.getListed() == true && !chore.working}">
					<tr>
	   					<td>${chore.choreName}</td>			    					  					
	   					<td>${chore.value}</td>	
	   					<td>
	   						<form action="/choreList/remove" method="post" >       	<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectChore"  value="${chore.id}"/>																				        	
	        					<input type="submit" value="Remove" class="btn btn-danger btn-sm border1" />
	       					</form>													<!-- *************** -->
    					</td>	    					  					
				  	</tr>
	         		
				  	</c:if>   
					</c:forEach>									<!-- END LOOP -->
				</tbody>
			</table>
					
			<!-- CHECK FOR UNLISTED CHORES -->
			<c:forEach var="chore" items="${chores}">
				<c:if test="${chore.getListed() == false}">
					<c:set var="addChoreCount" value="${addChoreCount = addChoreCount +1 }"/>
				</c:if>           						
    		</c:forEach>

			<!-- IF/ELSE -->
    		<c:choose>
    		
				<c:when test="${addChoreCount > 0}" >	 <!-- DROPDOWN TO ADD CHORES -->
					<div class="form-group">   					
		            	<form action="/choreList/add" method="post" >
			          	  <input type="hidden" name="_method" value="put"/>					        	
		         			<label style="color: linen">Available Chores: ${addChoreCount}</label>
		            		<select name="selectChore" class="form-control">
			         			<c:forEach var="chore" items="${chores}">
		 							<c:if test="${chore.getListed() == false}">
										<option value="${chore.id}">${chore.choreName} - ${chore.value} points</option>
		 							</c:if>           	
		        				</c:forEach>
							</select>					        	
		        			<input type="submit" value="Add" class="btn btn-primary mt-2 border1" />     				        		
		    			</form>
		        	</div>		
				</c:when>					
										
				<c:otherwise>
					<h6>* all chores are currently listed</h6>
				</c:otherwise>
    		
    		</c:choose>
   		</div>
  		
		<div class="p-3">	   		
   			<h3>Current Rewards List</h3>
	   		<table class="table table-light table-striped">
				<thead>
				    <tr>				      
				      <th class="col-4">Reward</th>
				      <th class="col-1">Cost</th>
				      <th class="col-1"></th>			    
					</tr>
				</thead>
				<tbody>
				  	<c:forEach var="reward" items="${rewards}">				<!-- LOOP -->
				  	<c:if test="${reward.getListed() == true  && reward.redeemed == false}">			
					<tr>
	   					<td>${reward.rewardName}</td>			    					  					
	   					<td>${reward.cost}</td>	
	   					<td>
	   						<form action="/rewardList/remove" method="post" >			<!-- "REMOVE" BUTTON -->
			            		<input type="hidden" name="_method" value="put"/>	
	            	    		<input type="hidden" name="selectReward"  value="${reward.id}"/>																				        	
	        					<input type="submit" value="Remove" class="btn btn-danger btn-sm border1" />
	       					</form>														<!-- *************** -->
	   					</td>		   					    					  					
				  	</tr>
				  	</c:if>
					</c:forEach>										<!-- END LOOP -->
				</tbody>
			</table> 
			
			<!-- CHECK FOR UNLISTED REWARDS -->
			<c:forEach var="reward" items="${rewards}">
				<c:if test="${reward.getListed() == false}">
					<c:set var="addRewardCount" value="${addRewardCount = addRewardCount +1 }"/>
				</c:if>           						
    		</c:forEach>
			
			<!-- IF/ELSE -->		
    		<c:choose>
		
   				<c:when test="${addRewardCount > 0}" > <!-- DROPDOWN TO ADD REWARDS -->
					<div class="form-group">   											
	            		<form action="/rewardList/add" method="post" >
		            	<input type="hidden" name="_method" value="put"/>			        	
			         		<label style="color: linen">Available Rewards: ${addRewardCount}</label>
			            	<select name="selectReward" class="form-control">
				         		<c:forEach var="reward" items="${rewards}">
			 						<c:if test="${reward.getListed() == false}">
										<option value="${reward.id}">${reward.rewardName} - costs ${reward.cost} points</option>
			 						</c:if>           	
			        			</c:forEach>
							</select>        			        		
		        		<input type="submit" value="Add" class="btn btn-primary mt-2 border1" />     	
	    				</form>
	        		</div>
        		</c:when>
    
        		<c:otherwise>
					<h6>* all rewards are currently listed</h6>
				</c:otherwise>
				
        	</c:choose>									
   		</div>
	
	</div>

</body>
</html>