<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 10px;
  }
</style>
</head>
<body>
<center>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="cafe" class="homework2.CoffeeBean" scope="page" />
	<jsp:setProperty name="cafe" property="*" />

	<h1>주문하신 메뉴</h1>
	<table border=1>
<%
	String mid = request.getParameter("coffee");
	String mpwd = request.getParameter("size");
	String mname = request.getParameter("count");
%>

<%
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	StringBuffer SQL = new StringBuffer("insert into memberdb.od ");
	SQL.append("values(?,?,?)");
	
	try{
		Context initCtx = new InitialContext();
		Context env = (Context) initCtx.lookup("java:comp/env/");
		DataSource ds = (DataSource) env.lookup("jdbc/mysql");
		con = ds.getConnection();
		
		pstmt = con.prepareStatement(SQL.toString());
		pstmt.setString(1, mid);
		pstmt.setString(2, mpwd);
		pstmt.setString(3, mname);
	
		
		int rowCount = pstmt.executeUpdate();
		
		
		stmt = con.createStatement();
		ResultSet result = stmt.executeQuery("select * from memberdb.od;");
%>
	<table width=100% border=2 cellpadding=1>
	<tr bgcolor="orange">
		<td align=center><b>커피</b></td>
		<td align=center><b>사이즈</b></td>
		<td align=center><b>개수</b></td>
	</tr>
<%
	while (result.next()){
%>
	<tr>
		<td align=center><%= result.getString(1) %></td>
		<td align=center><%= result.getString(2) %></td>
		<td align=center><%= result.getString(3) %></td>
	</tr>
<%
	}
	result.close();
	}
	catch(Exception e){
		/*out.println("MySQL 데이터베이스 univdb의 student에 삽입 또는 조회에 문제가 있습니다.<hr>");
		out.println(e.toString());
		e.printStackTrace();*/
	}
	finally{
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
%>
<form method ="post">
	<input type="button" value="이전메뉴" onClick="location.href='menu.html'">
	<input type="button" value="주문완료" onClick="location.href='order.jsp'">
</form>
	</table>
</center>	
</body>
</html>
