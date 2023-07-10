<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/login.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom2.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<style>
	.login-form h1{
		font-family: 'Noto Sans KR', sans-serif;
		letter-spacing :1px;
		font-size: 28px; color: #fff;
		text-align: center;
		magin-bottom: 60px;
	}
</style>
</head>
<body>
	<section class="login-form">
		<c:choose>
			<c:when test="${not empty sessionScope.id }">
				<h1>${sessionScope.id }님 로그인 되었습니다.</h1>
				<div class="btn-area">
					<button id="btn" type="button" onclick="location.href ='${pageContext.request.contextPath}/gallery/list'">사진구경가기</button>	
				</div>	
			</c:when>
			<c:otherwise>
				<h1>회원정보가 맞지 않습니다 !</h1>
				<div class="btn-area">
				<button id="btn" type="button" onclick="location.href ='${pageContext.request.contextPath}?url=${requestScope.encodedUrl }'">다시 시도</button>
				</div>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>