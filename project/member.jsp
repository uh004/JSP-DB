<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
.size {
	width: 150px;
	height: 40px;
}
.input1{
	width: 300px;
	height: 50px;
}
</style>
</head>
<body>
<center>
<h1>회원가입페이지</h1>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
	<form method ="post" action="">
		
		<input class="input1" type="text" name="mid" placeholder="아이디"><p>
		<input class="input1" type="text" name="mpwd" placeholder="비밀번호"><p>
		<input class="input1" type="text" name="mname" placeholder="이름"><p>
		<input class="size" type="submit" value="가입완료">
		<input class="size" type="button" value="돌아가기" onClick="location.href='login.jsp'">
		
		


<%
	String mid = request.getParameter("mid");
	String mpwd = request.getParameter("mpwd");
	String mname = request.getParameter("mname");
%>

<%
	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	StringBuffer SQL = new StringBuffer("insert into memberdb.member ");
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
		ResultSet result = stmt.executeQuery("select * from memberdb.member;");
%>
	<table width=100% border=2 cellpadding=1>
	<tr>
		<td align=center><b>아이디</b></td>
		<td align=center><b>암호</b></td>
		<td align=center><b>이름</b></td>
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
	</table>
		
	</form>
</center>
</body>
</html>
