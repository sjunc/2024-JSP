<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<%  request.setCharacterEncoding("utf-8"); %>

<%
  String id= request.getParameter("id");
  String passwd= request.getParameter("pass");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
    String dbId="jspid";
    String dbPass="jsppass";
	 
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);
	
	String sql= "select id, pass from users where id= ?";
	pstmt=conn.prepareStatement(sql);
    pstmt.setString(1,id);
	rs=pstmt.executeQuery();
    
	if(rs.next()){ 
		String rId=rs.getString("id");
		String rPasswd=rs.getString("pass");
      if(id.equals(rId) && passwd.equals(rPasswd)){
	     out.println("로그인에 성공하셨습니다.");
%>
<html>
<head>
<title>결과</title>
</head>
<body>
         저희 사이트에 오신걸 환영합니다.
</body>
</html>
<%
      }else
		out.println("패스워드가 틀려 로그인에 실패했습니다.");
	}else
		 out.println("아이디가 틀려 로그인에 실패했습니다.");
  }catch(Exception e){ 
	  e.printStackTrace();
  }finally{
	  if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>