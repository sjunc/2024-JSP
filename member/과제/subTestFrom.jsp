<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<title>과제 회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<b>회원이 되어 다양한 혜택을 경험해 보세요!</b>
	<br>
	<form method ="post" action ="insertTestSub.jsp">
		아이디 <br><input type = "text" name = "id" maxlength ="50"><input type = "submit" value = "중복 확인"><br>
		비밀번호<br><input type = "password" name = "passwd" maxlength ="16"><br>
		비밀번호 확인 <br><input type = "password" name = "passwd" maxlength ="16"><br>
		이름<br><input type = "text" name = "name" maxlength ="10"><br>
		전화번호<br><input type = "text" name = "phone" maxlength ="20"><br>
		이메일<br><input type = "text" name = "email" maxlength ="50"><br>
		생년월일 <br>
		<input type = "text" name = "birth" maxlength ="50"> <br>
		<input type = "submit" value = "가입하기">
	</form>
	</body>
</html>