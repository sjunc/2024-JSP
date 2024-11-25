<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

</HEAD>
<BODY>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
    String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
    String dbId = "jspid";
    String dbPass = "jsppass";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

    String sql = "SELECT * FROM tblboard";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    if (!rs.next()) {
      out.println("게시글이 없습니다.");
    } else {
      do {
        String num = rs.getString("num");
        String title = rs.getString("title");
        String email = rs.getString("email");
        String name = rs.getString("name");
        String writedate = rs.getString("writedate");
        String readcount = rs.getString("readcount");
%>

<center><font size='3'><b> 게시판 </b></font></center>

<TABLE border='1' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE>

<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      
    <TR bgcolor='cccccc'>      
        <TD><font size=2><center><b>번호</b></center></font></TD>      
        <TD><font size=2><center><b>글 제목</b></center></font></TD>      
        <TD><font size=2><center><b>작성자</b></center></font></TD>      
        <TD><font size=2><center><b>작성일</b></center></font></TD>      
        <TD><font size=2><center><b>조회</b></center></font></TD>      
    </TR>   

    <TR bgcolor='ededed'>     
        <TD align=center><font size=2 color='black'><%= num %></font></TD>     
        <TD align=left>
            <a href="write_output.jsp?num=<%= num %>">
                <font size=2 color="black"><%= title %></font></a>
        </TD>
        <TD align=center>    
            <a href="mailto:<%= email %>">
                <font size=2 color="black"><%= name %></font></a>     
        </TD>     
        <TD align=center><font size=2><%= writedate %></font></TD>     
        <TD align=center><font size=2><%= readcount %></font></TD>     
    </TR>  

</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD><hr size='1' noshade></TD>
    </TR>
</TABLE>

<TABLE border=0 width=600>
    <TR>
        <TD align='left'></TD>
        <TD align='right'>
            <a href='write.jsp'>[등록]</a> 
        </TD>
    </TR>
</TABLE>

<%
      } while (rs.next());  // 게시글이 여러 개 있을 수 있으므로 반복문으로 출력
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
%>

</BODY>
</HTML>

