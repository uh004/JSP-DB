<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.size input{
	width: 150px;
	height: 40px;
	text-align:center;
}
.input1{
	width: 300px;
	height: 50px;
}

</style>
</head>
<body>
<%@ page import="java.sql.*" %>
<center>
<h1>Login</h1>

<form method ="post">
		<input class="input1" type="text" name="id" placeholder="ID"><p>
		<input class="input1" type="text" name="pwd" placeholder="password"><p>
	<%
	String mid = request.getParameter("id");
	String mpwd = request.getParameter("pwd");
	%>
	
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	String driverName = "com.mysql.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/memberdb";
	String sql = "select * from member infi where pwd=?";

	
	try{
		Class.forName(driverName);
		con = DriverManager.getConnection(dbURL,"root","1234");
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,mpwd);
		ResultSet result = pstmt.executeQuery();
	
		if (result.next()){
			String dbpwd = result.getString(1);
			
			if (mpwd.equals(dbpwd)){
				response.sendRedirect("http://localhost:8080/homework/student.html");
			} else {
				System.out.println("잘못된 비밀번호를 입력하였습니다.");
			}
	
		}
	%>
	
	<%
	}catch(Exception e){
		out.println("Mysql 데이터베이스 memberdb의 student 조회에 문제가 있습니다.<hr>");
		out.println(e.toString());
		e.printStackTrace();
	}
	finally{
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
	
	%>	
	<div class="size">
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onClick="location.href='member.jsp'">
	</div>
</form>
</center>
</body>
</html>
