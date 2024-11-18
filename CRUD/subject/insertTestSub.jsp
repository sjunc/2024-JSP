<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8");%>

<% 
   String id = request.getParameter("id");
   String passwd= request.getParameter("pass");
   String name = request.getParameter("name");
   String phone = request.getParameter("phone"); 
   String email = request.getParameter("email"); 
   String birth = request.getParameter("birth"); 
   Timestamp register=new Timestamp(System.currentTimeMillis());

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
 
  String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
  String dbId="jspid";
 String dbPass="jsppass";
 	 
 Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
 	
  String sql= "insert into users values (?,?,?,?,?,?)";
  pstmt=conn.prepareStatement(sql);
  pstmt.setString(1,id);
  pstmt.setString(2,passwd);
  pstmt.setString(3,name);
  pstmt.setString(4,phone);
  pstmt.setString(5,email);
  pstmt.setString(6,birth);
  pstmt.executeUpdate();
 	 
  str= "users 사이트에 신규 가입에 성공하셨습니다.";
 %>

<html>
<head>
<title>레코드 추가</title>
</head>
<body>
  <%=str %>
</body>
</html>