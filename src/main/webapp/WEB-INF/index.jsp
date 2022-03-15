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
    <title>Chore Login</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="parent-body">
	<div class="container mt-5 mb-5 p-3 rounded border1 parent-box">
	

		<div class="p-5">
				<h1>Chore Chart</h1>
				<h3 class="mt-3">Login</h3>
	    		<form:form action="/login" method="post" modelAttribute="newLogin">
	        	<div class="form-group">
	           		<label style="color: linen">User Name:</label>
	            	<form:input path="userName" class="form-control" />
	            	<form:errors path="userName" class="text-danger" />
	        	</div>
	        	<div class="form-group">
	            	<label style="color: linen">Password:</label>
	            	<form:password path="password" class="form-control" />
	            	<form:errors path="password" class="text-danger" />
		        </div>
	    		    <input type="submit" value="Login" class="btn btn-success mt-2" />
	    		</form:form>
			</div>	
			<!-- ////////// FOR DEMO PURPOSES \\\\\\\\\\ -->
			<div class="text-center ms-5 me-5 ps-5 pe-5">
			
				<hr>
				<h4>Log in with either Parent or Child account to see different views</h4>
				<hr>
				
				<table class="table table-light table-striped table-sm ">
					<thead>
						<tr>
							<th>User Name</th>
							<th>Password</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>parent1</td>
							<td>password</td>
						</tr>
						<tr>
							<td>child1</td>
							<td>password</td>
						</tr>
						<tr>
							<td>child2</td>
							<td>password</td>
						</tr>
					</tbody>
				</table>
				<hr>
			</div>
			<!-- \\\\\\\\\\ FOR DEMO PURPOSES ////////// -->
			
	
	</div>
</body>
</html>