<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="student" class="homework.StudentBean" scope="page" />
	<jsp:setProperty name="student" property="*" />

	<h3>수강과목 신청결과</h3>
	
	학생 학과 : <jsp:getProperty name="student" property="subject" /><br>
	학생 이름 : <jsp:getProperty name="student" property="name" /><br>
	학생 학번 : <jsp:getProperty name="student" property="number" /><br>
	신청 과목 : <jsp:getProperty name="student" property="sub" /><br>
	
	
</body>
</html>
