<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/signup.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom2.css" />
<style>
	.login-form h1{
		font-family: 'Noto Sans KR', sans-serif;
		letter-spacing :1px;
		font-size: 25px; color: #fff;
		text-align: center;
		magin-bottom: 60px;
	}
</style>
</head>
<body>
	<section class="login-form">
		<h1>${param.id } 회원님 가입 되었습니다.</h1>
		<div class="btn-area">
			<button id="btn" type="button" onclick="location.href ='${pageContext.request.contextPath}/'">로그인 하러가기</button>
		</div>
	</section>
</body>
</html>