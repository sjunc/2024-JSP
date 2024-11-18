<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<html>
<head>
<title>회원명부</title>
</head>
<body>
  <h2>회원분들의 정보입니다.</h2>
  <table border="1">
  <tr>
  	<td width="100">아이디</td>
  	<td width="100">이름</td>
  	<td width="250">전화번호</td>
  	<td width="250">이메일</td>
  	<td width="250">생년월일</td>
  </tr>
<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	 String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
     String dbId="jspid";
     String dbPass="jsppass";
	 
	 Class.forName("com.mysql.jdbc.Driver");
	 conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass);

	 String sql= "select * from users";
	 pstmt=conn.prepareStatement(sql);
	 rs=pstmt.executeQuery();

	 while(rs.next()){
	   String id= rs.getString("id");
       String name= rs.getString("name");
       String phone= rs.getString("phone");
       String email= rs.getString("email");
       String birth= rs.getString("birth");

%>
       <tr>
  	     <td width="100"><%=id%></td>
  	     <td width="100"><%=name%></td>
  	     <td width="250"><%=phone%></td>
  	     <td width="250"><%=email%></td>
  	     <td width="250"><%=birth%></td>

       </tr>
<%  }  
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
  </table>
</body>
</html>