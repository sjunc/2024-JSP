<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<h2>게시판</h2>

<table border="1" width="600" cellpadding="0" cellspacing="0">
    <tr>
        <td><hr size="1" noshade></td>
    </tr>
</table>

<table border="0" cellspacing="1" cellpadding="2" width="600">
    <tr bgcolor="cccccc">
        <td><font size="2"><center><b>번호</b></center></font></td>
        <td><font size="2"><center><b>글 제목</b></center></font></td>
        <td><font size="2"><center><b>작성자</b></center></font></td>
        <td><font size="2"><center><b>작성일</b></center></font></td>
        <td><font size="2"><center><b>조회</b></center></font></td>
    </tr>

<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
    String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
    String dbId = "jspid";
    String dbPass = "jsppass";

    Class.forName("com.mysql.jdbc.Driver"); // MySQL 드라이버 로드
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

    String sql = "SELECT * FROM tblboard";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    if (!rs.next()) {
        out.println("게시글이 없습니다.");
    } else {
        do {
            int num = rs.getInt("num");
            String title = rs.getString("title");
            String email = rs.getString("email");
            String name = rs.getString("name");
            String writedate = rs.getString("writedate");
            int readcount = rs.getInt("readcount");
%>
    <tr bgcolor="ededed">
        <td align="center"><font size="2" color="black"><%= num %></font></td>
        <td align="left">
            <a href="write_output.jsp?num=<%= num %>">
                <font size="2" color="black"><%= title %></font></a>
        </td>
        <td align="center">
            <a href="mailto:<%= email %>">
                <font size="2" color="black"><%= name %></font></a>
        </td>
        <td align="center"><font size="2"><%= writedate %></font></td>
        <td align="center"><font size="2"><%= readcount %></font></td>
    </tr>

<%
        } while (rs.next());  // 게시글이 여러 개 있을 수 있으므로 반복문으로 출력
    }
  } catch (Exception e) {
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (conn != null) conn.close();
    } catch (SQLException e) {
      out.println("Error closing resources: " + e.getMessage());
      e.printStackTrace();
    }
  }
%>
</table>

<table border="0" width="600" cellpadding="0" cellspacing="0">
    <tr>
        <td><hr size="1" noshade></td>
    </tr>
</table>

<table border="0" width="600">
    <tr>
        <td align="left"></td>
        <td align="right">
            <a href="write.jsp">[등록]</a>
        </td>
    </tr>
</table>



