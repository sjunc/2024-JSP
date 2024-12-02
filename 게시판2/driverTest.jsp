<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<h2>JDBC 드라이버 테스트</h2>

<%
  Connection conn = null;

  try {
    // 사용하고자 하는 DataBase명을 포함한 URL
    String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
    String dbId = "jspid";
    String dbPass = "jsppass";

    // DataBase와 연동하기 위해 DriverManager에 등록
    // MySQL 5.1에서는 com.mysql.jdbc.Driver를 사용
    Class.forName("com.mysql.jdbc.Driver");

    // DriverManager로부터 Connection 객체를 얻어옴
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
    
    // 연결 성공 시 출력
    out.println("제대로 연결되었습니다.");

  } catch (Exception e) {
    // 예외 발생 시 예외 메시지를 웹 페이지에 출력
    out.println("오류 발생: " + e.getMessage());
    e.printStackTrace(); // 서버 로그에 예외 내용 출력
  } finally {
    // 자원 해제: 연결을 닫는 부분을 추가하는 것이 좋습니다.
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException se) {
        out.println("DB 연결 해제 오류: " + se.getMessage());
      }
    }
  }
%>

