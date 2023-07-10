<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css" />
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');
   /* card 이미지 부모요소의 높이 지정 */
   .img-wrapper{
      height: 250px;
      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
      transition: transform 0.3s ease-out;
   }
   
   /* 화면의 폭이 575px 이하 일 때 적용할 css */
   @media(max-width: 575px){
   		.img-wrapper{
   			height: 350px;
   		}
   }
   
   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
   .img-wrapper:hover{
      /* 원본 크기의 1.1 배로 확대 시키기*/
      transform: scale(1.1);
   }
   
   .card .card-text{
      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
      display:block;
      white-space : nowrap;
      text-overflow: ellipsis;
      overflow: hidden;
   }
      .img-wrapper img{
         width: 100%;
         height: 100%;
         /* fill | contain | cover | scale-down | none(default) */
         /*   
            cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
            contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
            fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
            scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
         */
      object-fit: cover;   
    }
    
    h1 {
	  position: relative;
	  padding: 0;
	  margin: 0;
	  font-family: 'Noto Sans KR', sans-serif;
	  font-weight: 700;
	  font-size: 40px;
	  color: #080808;
	  -webkit-transition: all 0.4s ease 0s;
	  -o-transition: all 0.4s ease 0s;
	  transition: all 0.4s ease 0s;
	}

	h1 span {
	  display: block;
	  font-size: 0.5em;
	  line-height: 1.3;
	}
	h1 em {
	  font-style: normal;
	}
	.two h1 {
  	text-transform: capitalize;
	}
	.two h1:before {
	  position: absolute;
	  left: 0;
	  bottom: 0;
	  width: 60px;
	  height: 2px;
	  content: "";
	  background-color: #c50000;
	}
	
	.two h1 span {
	  font-size: 18px;
	  font-family: 'Noto Sans KR', sans-serif;
	  font-weight: 400;
	  text-transform: uppercase;
	  letter-spacing: 1px;
	  line-height: 3em;
	  padding-left: 0.25em;
	  color: rgba(0, 0, 0, 0.4);
	  padding-bottom: 10px;
	}
	.alt-two h1 {
	  text-align:center;
	}
	.alt-two h1:before {
	  left:50%; margin-left:-30px;
	}
	
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="gallery" name="current"/>
	</jsp:include>
    <br />
	<div class="container">
	<div class="two">
	<h1>멋진 무료사진들
	<span>여러사람이 올린 사진을 마음껏 구경해보세요 !</span>
	</h1>
	<br />
	<!-- 검색 폼 -->
    <form action="list" method="get">
         <label for="condition">검색조건</label>   
         <select name="condition" id="condition">
            <option value="caption" ${condition eq 'caption' ? 'selected' : '' }>제목</option>
            <option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
         </select>
         <input type="text" name="keyword" placeholder="검색어..." value="${keyword }"/>
         <button type="submit">검색</button>
      </form>
      <c:if test="${not empty keyword }">
         <p>
            <strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
            <a href="list">리셋</a>
         </p>
      </c:if>
      </div>
    <br />
	<div class="row">
	<c:forEach var="tmp" items="${list }">
		<div class="col-6 col-md-4 col-lg-3">
	        <div class="card mb-3">
	           <a href="${pageContext.request.contextPath}/gallery/detail?num=${tmp.num}">
	                <div class="img-wrapper">
	                	<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
	           		</div>
	           </a>
	           <div class="card-body">
	                 <p class="card-text">${tmp.caption}</p>
	                 <p class="card-text">by <strong>${tmp.writer}</strong></p>
	                 <p><small>${tmp.regdate}</small></p>
	           </div>
	        </div>
		</div>
	</c:forEach>
	</div>
		<nav>
	   	<ul class="pagination justify-content-center">
      	<c:choose>
        	<c:when test="${startPageNum ne 1 }">
            	<li class="page-item">
                	<a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${startPageNum - 1}">Prev</a>
               	</li>
         	</c:when>
		<c:otherwise>
			<li class="page-item disabled">
            	<a class="page-link" href="javascript:">Prev</a>
            </li>
		</c:otherwise>
      	</c:choose>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
        <c:choose>
            <c:when test="${i eq pageNum }">
               <li class="page-item active">
                        <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${i}">${i }</a>
                     </li>
            </c:when>
            <c:otherwise>
               <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${i}">${i}</a>
                     </li>
            </c:otherwise>
		</c:choose>
      	</c:forEach>
		<c:choose>
         	<c:when test="${endPageNum lt totalPageCount }">
            <li class="page-item">
                     <a class="page-link" href="${pageContext.request.contextPath}/gallery/list?pageNum=${endPageNum + 1}">Next</a>
               </li>
         	</c:when>
         	<c:otherwise>
            <li class="page-item disabled">
            	<a class="page-link" href="javascript:">Next</a>
            </li>
         	</c:otherwise>
      	</c:choose>
      	</ul>
		</nav>
	</div>
</body>
</html>