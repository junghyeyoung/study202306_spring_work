<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom2.css" />
</head>
<body>
	<section class="login-form">
		<h1>Pixabay</h1>
		<form action="${pageContext.request.contextPath }/users/login" method="post">
			<c:choose>
				<c:when test="${ empty param.url }">
					<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="url" value="${param.url }"/>
				</c:otherwise>
			</c:choose>
			<div class="int-area">
				<input type="text" name="id" id="id"
				autocomplete="off" required/>
				<label for="id">USER NAME</label>
			</div>
			<div class="int-area">
				<input type="password" name="pwd" id="pwd"
				autocomplete="off" required/>
				<label for="pwd">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button id="btn" type="submit">LOGIN</button>
			</div>
		</form>
		<div class="caption">
			<a href="${pageContext.request.contextPath }/users/signup_form">회원가입하기</a>
		</div>
	</section>
</body>
</html>