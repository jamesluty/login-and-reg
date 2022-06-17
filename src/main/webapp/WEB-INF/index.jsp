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
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<title>Login and Registration</title>
</head>
<body>
	<div class="mainWrapper">
		<h1 class="title">Welcome!</h1>
		<p>Join our growing community</p>
		<div class="bodyWrapper">
			<div class="register">
				<h2>Register</h2>
				<form:form class="form" action="/register" method="post" modelAttribute="newUser">
					<div class="formItem">
						<form:label path="username">Username: </form:label>
						<form:input path="username"/>
					</div>
					<form:errors class="errors" path="username"/>
					<div class="formItem">
						<form:label path="email">Email: </form:label>
						<form:input path="email"/>
					</div>
					<form:errors class="errors" path="email"/>
					<div class="formItem">
						<form:label path="password">Password: </form:label>
						<form:input path="password"/>
					</div>
					<form:errors class="errors" path="password"/>
					<div class="formItem">
						<form:label path="confirm">Confirm Password: </form:label>
						<form:input path="confirm"/>
					</div>
					<form:errors class="errors" path="confirm"/>
					<div class="btn">
						<button class="btn btn-primary">Register</button>
					</div>
				</form:form>
			</div>
			<div class="login">
				<h2>Login</h2>
				<form:form class="form" action="/login" method="post" modelAttribute="newLogin">
					<div class="formItem">
						<form:label path="email">Email: </form:label>
						<form:input path="email"/>
					</div>
					<form:errors class="errors" path="email"/>
					<div class="formItem">
						<form:label path="password">Password: </form:label>
						<form:input path="password"/>
					</div>
					<form:errors class="errors" path="password"/>
					<div class="btn">
						<button class="btn btn-primary">Login</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>