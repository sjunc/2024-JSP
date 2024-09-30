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

### 실행방법
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
과거 작성된 웹 문서가 대부분인 상황이기에 필요 get과 post는 브라우저나 기본 방식을 가져오는 방식 등 서로 다른 방식임.

저장하고 reflash 해야 서버에 적용

header 파일 확인을 통해 제대로 정보를 받았는지 알 수 있음. f12
캐시 없는(브라우저 캐시)로 설정하면 빠른 이용 가능.

### jsp  주석처리
<%-- 주석 내용 --%>

버퍼
기본으로 False가 디폴트(버퍼 사이즈 고정). 버퍼 사이즈를 자동 활성화 설정을 하면 정상적 호출 가능. 
그래서 왜 뻗은 거지? 버퍼 사이즈가 모잘라서
서블릿이 뭘까... 
네트워크를 알아야할까



외부 페이지 호출해서 사용
<jsp:param> 액션 태그 ?name=XXX
./ch0X/XXX.jsp
. 현재 디렉토리에서 이동
java.lang.NullPointerException 에러
 view.jsp?code=A
 이렇게 페이지 호출을 해야 정상적으로 호출가능.

쿠키 -> 세션 -> 토큰(최근 성향)
브라우저 정보, 개인정보가 들어가있음.
쿠키는 이름과 값, 유효시간이 존재
