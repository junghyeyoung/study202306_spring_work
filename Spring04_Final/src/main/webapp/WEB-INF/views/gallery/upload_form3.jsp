<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/gallery/upload_form.jsp</title>
<style>
   #dropZone{
      width: 400px;
      height: 400px;
      border: 2px dashed black;
      border-radius: 20px;
      /* 아래는 자식 contents를 상하좌우로 가운데 정렬하기 위한 css */
      display: flex;
      justify-content: center;
      align-items: center;
   }
   /* img 요소에 적용할 css*/
   #preview{
      display: none;
      object-fit: cover;
      width: 100%;
      height: 100%;
      border-radius: 20px;
   }
   #image{
      display: none;
   }
</style>
</head>
<body>
   <div class="container">
      <h1>이미지 업로드 폼</h1>
      <form action="${pageContext.request.contextPath }/gallery/upload" method="post" enctype="multipart/form-data">
         <div>
            <label for="caption">설명</label>
            <input type="text" name="caption" id="caption" autocomplete="off"/>
         </div>
         <input type="file" name="image" id="image" accept=".jpg, .jpeg, .png, .gif, .JPG, .JPEG"/>
      </form>
      <br />
      <!-- drag and drop을 할 div -->
      <a href="javascript:" id="dropZoneLink" title="업로드 할 이미지 선택">
         <div id="dropZone">
            <p>이미지를 드래그하거나 여기를 클릭하세요</p>
            <img src="" id="preview" />
         </div>
      </a>
      <button id="submitBtn">업로드</button>
   </div>
   <script>
      //업로드 버튼을 눌렀을 때
      document.querySelector("#submitBtn").addEventListener(
            "click", ()=>{
               //입력한 caption을 읽어온다
               const caption = document.querySelector("#caption").value;
               const files = document.querySelector("#image").files;
               //만약 caption을 3글자 미만으로 입력하거나 선택한 파일이 없다면
               if(caption.length < 3 || files.length == 0){
                  alert("caption을 3글자 이상 입력하고 업로드할 이미지를 선택해주세요");
                  return;   //함수 종료
               }
               //ajax 전송할 데이터를 FormData() 객체에 담는다
               const data = new FormData();
               //caption이라는 파라미터명으로 input 요소에 입력한 문자열을 담는다
               data.append("caption", document.querySelector("#caption").value);
               //image라는 파라미터명으로 현재 선택한 파일을 객체에 담는다
               const file = document.querySelector("#image").files[0];
               data.append("image", file);
               /*
                  fetch() 함수를 호출하면서 method: "post", body: FormData 객체를 전달하면
                  <form method="post" enctype="multipart/form-data"> 폼을 전송한 것과 같다
               */
               fetch("${pageContext.request.contextPath }/gallery/ajax_upload",{
                  method: "post",
                  body: data
               })
               .then(res => res.json())
               .then(data => {
                  console.log(data);
                  if(data.isSuccess){
                     alert(file.name + " 이미지를 성공적으로 업로드 했습니다");
                     //UI를 초기 상태로 되돌리기
                     document.querySelector("#preview").style.display = "none";
                     document.querySelector("#dropZone p").style.display = "block";
                     //input type = "file"을 reset하는 방법
                     document.querySelector("#image").value="";
                     document.querySelector("#caption").value="";
                  }
               });
            }
      );
      //dropZone을 클릭해도 파일 선택장을 띄우도록 한다
      document.querySelector("#dropZoneLink").addEventListener(
         "click", ()=>{
            //input type="file"을 강제 클릭시킨다
            document.querySelector("#image").click();
         }
      );
      //dropZone div의 참조값 얻어오기
      const dropZone = document.querySelector("#dropZone");
      //이벤트 리스너 함수 등록하기
      dropZone.addEventListener("dragover", (e)=>{e.preventDefault();});
      dropZone.addEventListener("drop", (e)=>{
         e.preventDefault();
         
         //drop된 파일의 정보를 얻어오기
         const files = e.dataTransfer.files;
         console.log(files[0]);
         //drop된 파일의 정보를 조사해서 이미지 파일이 아니라면 함수를 여기서 종료시키기
         const type = files[0].type;
         if(type != "image/png" && type != "image/jpg" && type != "image/gif"){
            alert("이미지 파일이 아닙니다");
            return;
         }
         
         //만약 파일 데이터가 존재한다면
         if(files.length > 0){
            //파일로부터 데이터를 읽어들일  객체 생성
            const reader = new FileReader();
            //로딩이 완료(파일 데이터를 모두 읽었을 때)되었을 때 실행할 함수 등록
            reader.onload = (event) => {
               //읽은 파일 데이터 얻어내기
               const data = event.target.result;
               //img 요소에 이미지를 출력하고 보이게 하고 p 요소를 숨긴낟
               document.querySelector("#preview").setAttribute("src", data);
               document.querySelector("#preview").style.display = "block";
               document.querySelector("#dropZone p").style.display = "none";
            };
            //파일을 DataURL 형식의 문자열로 읽어들이기
            reader.readAsDataURL(files[0]);
            //선택된 파일의 정보를 input type="file" 요소에 넣어주기
            document.querySelector("#image").files = files;
         }
      });
      
      document.querySelector("#image").addEventListener(
         "change", (e)=>{
            //선택된 파일 객체를 얻어낸다
            const files = e.target.files;
            //만약 파일 데이터가 존재한다면
            if(files.length > 0){
               //파일로부터 데이터를 읽어들일  객체 생성
               const reader = new FileReader();
               //로딩이 완료(파일 데이터를 모두 읽었을 때)되었을 때 실행할 함수 등록
               reader.onload = (event) => {
                  //읽은 파일 데이터 얻어내기
                  const data = event.target.result;
                  console.log(data);
                  //img 요소에 이미지를 출력하고 보이게 하고 p 요소를 숨긴낟
                  document.querySelector("#preview").setAttribute("src", data);
                  document.querySelector("#preview").style.display = "block";
                  document.querySelector("#dropZone p").style.display = "none";
               };
               //파일을 DataURL 형식의 문자열로 읽어들이기
               reader.readAsDataURL(files[0]);
            }
         }
      );
   </script>
</body>
</html>