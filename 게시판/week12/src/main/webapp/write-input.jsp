<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("utf-8");%>

<% 
   String name = request.getParameter("name");
   String pass= request.getParameter("pass");
   String email = request.getParameter("email"); 
   String title = request.getParameter("title"); 
   String contents = request.getParameter("contents");
   Timestamp writedate=new Timestamp(System.currentTimeMillis());

   Connection conn=null;
   PreparedStatement pstmt=null;
   String str="";
 
  String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
  String dbId="jspid";
 String dbPass="jsppass";
 	 
 Class.forName("com.mysql.jdbc.Driver");
  conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
  
  
  str = "INSERT INTO tblboard(name, pass, email, title, contents, writedate, readcount)";
  str = str + "VALUES (?,?,?,?,?,?,?)";
  pstmt=conn.prepareStatement(str);
  pstmt.setString(1,name);
  pstmt.setString(2,pass);
  pstmt.setString(3,email);
  pstmt.setString(4,title);
  pstmt.setString(5,contents);
  pstmt.setTimestamp(6,writedate);
  pstmt.setInt(7,0);
  pstmt.executeUpdate();
  pstmt.close();
  conn.close();
  
  response.sendRedirect("listboard_st.jsp");
 	 
  str= "세션 로그인한 사람이름 물고들어오는 문제 ";
 %>