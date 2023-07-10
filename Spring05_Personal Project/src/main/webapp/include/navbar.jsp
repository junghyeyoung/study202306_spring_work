<%@page import="com.acorn.spring05.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar bg-dark navbar-expand-md" data-bs-theme="dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath }/gallery/list">
      <img src="${pageContext.request.contextPath }/resources/images/Pixabay-logo-new.svg.png" alt="Logo" width="35" height="35 class="d-inline-block align-text-top">
      Pixabay
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    		data-bs-target="#navbarText">
     		<span class="navbar-toggler-icon"></span>
   	</button>
    <div class="collapse navbar-collapse" id="navbarText">
	   	<ul class="navbar-nav me-auto">
        	<li class="nav-item">
          		<a class="nav-link ${param.current eq 'users' ? 'active' : '' }" href="${pageContext.request.contextPath }/users/info">마이페이지</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link ${param.current eq 'upload' ? 'active' : '' }" href="${pageContext.request.contextPath }/gallery/upload_form">업로드</a>
        	</li>
      	</ul>
      	<c:choose>
      		<c:when test="${empty profile }">
      			<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
      		</c:when>
      		<c:otherwise>
      			<img id="profileImage" 
					src="${pageContext.request.contextPath}${sessionScope.profile}"/>
      		</c:otherwise>
      	</c:choose>
      	<span class="navbar-text ms-3" data-bs-theme="dark">
      		<a href="${pageContext.request.contextPath }/users/info">${id }</a>님 로그인중
      	</span>
    </div>
  </div>
</nav>