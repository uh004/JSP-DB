<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-color: #F3EBF6;
		font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
        height: 400px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 40px;
        color: #8C55AA;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form1 {
        padding-top: 40px;
    }
    
    .pass {
	    width: 76%;
	    color: rgb(38, 50, 56);
	    font-weight: 700;
	    font-size: 14px;
	    background: rgba(136, 126, 126, 0.04);
	    padding: 10px 20px;
	    border: none;
	    border-radius: 20px;
	    box-sizing: border-box;
	    border: 2px solid rgba(0, 0, 0, 0.02);
	    margin-bottom: 50px;
	    margin-left: 46px;
	    text-align: center;
	    margin-bottom: 27px;
	    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      	cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }  
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        text-decoration: none
    }
    
    @media (max-width: 600px) {
        .main {
            border-radius: 0px;
        }
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
<form method ="post">
  <div class="main">
    <p class="sign" align="center">Sign in</p>
    <form class="form1">
      <input class="un " type="text" align="center" name="id" placeholder="ID">
      <input class="pass" type="text" name="pwd" placeholder="password">  
      <input class="submit" align="center" type="submit" value="로그인">
      <input type="button" value="회원가입" onClick="location.href='member.jsp'">
    </div>
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
	
</form>
</center>
</body>
</html>
