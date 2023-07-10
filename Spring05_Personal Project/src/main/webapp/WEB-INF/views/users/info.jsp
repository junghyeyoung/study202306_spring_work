<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/info.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="users" name="current"/>
	</jsp:include>
	<div class="container">
		<h1>가입 정보 입니다.</h1>
		<table>
			<tr>
				<th>아이디</th>
				<td>${id }</td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
				<c:choose>
					<c:when test="${empty dto.profile }">
						<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
						  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
					</c:when>
					<c:otherwise>
						<img id="profileImage" 
							src="${pageContext.request.contextPath}${dto.profile}"/>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><a href="${pageContext.request.contextPath}/users/pwd_updateform">변경하기</a></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.email }</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${dto.regdate }</td>
			</tr>
		</table>
		<a href="${pageContext.request.contextPath}/users/updateform">개인정보 수정</a>
		<a href="${pageContext.request.contextPath}/users/logout">로그아웃 하기</a>
		<br />
		<a href="javascript:deleteConfirm()">탈퇴</a>
	</div>
	<script>
		function deleteConfirm(){
			const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
			if(isDelete){
				location.href="${pageContext.request.contextPath}/users/delete";
			}
		}
</script>
</body>
</html>