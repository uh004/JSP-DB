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
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="student" class="homework.StudentBean" scope="page" />
	<jsp:setProperty name="student" property="*" />

	<h1>수강과목 신청결과</h1>
	<%-- 
		학생 학과 : <jsp:getProperty name="student" property="subject" /><br>
		학생 이름 : <jsp:getProperty name="student" property="name" /><br>
		학생 학번 : <jsp:getProperty name="student" property="number" /><br>
		신청 과목 : <jsp:getProperty name="student" property="sub" /><br>
	--%>	
	<table border=1>
		<tr bgcolor="#BoC4DE">
			<td>학생 학과</td>
			<td>학생 이름</td>
			<td>학생 학번</td>
			<td>신청 과목</td>
		</tr>
		<tr>
			<td><jsp:getProperty name="student" property="subject" /></td>
			<td><jsp:getProperty name="student" property="name" /></td>
			<td><jsp:getProperty name="student" property="number" /></td>
			<td><jsp:getProperty name="student" property="sub" /></td>
		</tr>
	</table>
	
</body>
</html>
