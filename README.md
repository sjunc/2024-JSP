# 2024-JSP
### WAS (web application server)

버전과 스팩의 차이

아파치 톰캣으로 서비스(수업)


client	  	web server - was	 		DB
브라우저		보안을 위해서 db와 바로 연결된 was 분리(서비스 속도, 구글은 톰캣 여러개) 
	      	  정적 자원-동적 자원
		        이미지,css -
		        구분없는 경우도 존재
	http 요청

포트? listening?
포트는 ip의 밑 단 느낌
http는 8080 s는 4333 으로 약속되어 있기 때문에 따로 입력하진 않음
ex) 구글의 뉴스 항목은 다른 포트를 사용해서 표현할 수도 있고 경로를 이용해서 사용할 수도 있다. 


jsp는 html? 계산식? 무슨 방식인건지?

1. 프로젝트를 생성한다.
2. 라이브러리를 다운로드한다.
 Project 선택
 마우스 우클릭 -> [Properties]
 [Project Facets]
 Dynamic Web Module 3.1
 Java 11
3. 포트를 변경한다.
4. 실행한다. 
5. 경로를 제대로 확인해서 주소를 입력한 후에 접속한다. 


time.jsp 와 invalidcharset 의 차이: charset 의 차이로 한글 입력시 깨짐 utf8, euc-kr로 바꿔야함
과거 작성된 웹 문서가 대부분인 상황이기에 필요
