<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<input type="text" id="inputText">
	<button onclick="request()">ajax 요청하기</button>
	<hr>

	<!--  
      동기 : 요청을 서버에서 처리하고, 페이지를 응답하는 형식
          페이지 전체가 바뀌어야 하는 경우 사용
      
      비동기 : 요청을 서버에서 처리하고 , 데이터를 응답
            페이지 이동 X > 서버 처리중에 사용자가 다른 행동이 가능
          페이지 일부가 바뀌는 경우에 사용
    -->
	<!-- jquery 라이브러리 가져오기 -->
	<!-- 
   http://localhost:8087/web/resources/js/jquery.js
   == webapp/resources/js/jquery.js
   == resources/js/jquery.js ( 같은 프로젝트 내부라 생략할 수 있음
    -->
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script>
      function request(){
         
         //POJO 에게 ajax 요청
         $.ajax({
            url:'ajax01.do', // 어디로 요청을 보낼 것인가?
            type :'post', // get? post?
            data: {
               // 어떤 데이터를 보낼것인가?
               // "name" : value...
               "data" : "data 전송", // 어떤 이름으로 보낼지 "name값" : 보내줄 값
               "data2" : $('#inputText').val() //$('선택자') : html태그 선택
            },
            success : function(res){ // 매개변수는 컨트롤러에서 리턴 해주는 데이터
               // 요청이 성공했을 때 실행되는 기능
               console.log('요청성공!');
               console.log('응답받은 내용 : '+ res);
               
               // $('선택자').html('코드') : 안에 있는 코드 덮어쓰기
               // $('선택자').before('코드') : 선택한 태그 앞에 추가
               // $('선택자').after('코드') : 선택한 태그 뒤에 추가
               // $('선택자').append('코드') : 선택한 태그 안에 추가
               
               $('hr').after('<p>'+res+'</p>')
               
            },
            error : function(){
               // 요청이 실패했을때 실행되는 기능
               alert("error!");
            }
         });
         
      }
   
   
   </script>


</body>
</html>