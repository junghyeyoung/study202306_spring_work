<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom2.css" />
</head>
<body>
	<section class="login-form">
		<h1>Sign up</h1>
		<form action="${pageContext.request.contextPath}/users/signup" method="post" id="myForm">
			<div class="int-area">
				<input type="text" name="id" id="id" autocomplete="off" required/>
				<label for="id">USER NAME</label>		
			</div>
			<div class="int-area">
				<input type="password" name="pwd" id="pwd" autocomplete="off" required/>	
				<label for="pwd">PASSWORD</label>	
			</div>
			<div class="int-area">
				<input type="password" name="pwd2" id="pwd2" autocomplete="off" required/>
				<label for="pwd2">VERIFY PASSWORD</label>
			</div>
			<div class="int-area">
				<input type="text" name="email" id="email" autocomplete="off" required/>
				<label for="email">EMAIL</label>
			</div>
			<div class="btn-area">
			<button id="btn" type="submit">SUBMIT</button>
			</div>
		</form>
	</section>	
</body>
</html>