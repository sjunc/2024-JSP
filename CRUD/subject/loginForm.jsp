<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>로그인</title>
</head>
<body>
  <h2>로그인 해주세요.</h2>
    
  <form method="post" action="login.jsp">
      아이디와 비밀번호를 정확하게 입력하시오<br><br>
      
      아이디: <input type="text" name="id" maxlength="50"><br>
      패스워드: <input type="password" name="pass" maxlength="16"><br>
      <input type="submit" value="로그인">
  </form>
</body>
</html>