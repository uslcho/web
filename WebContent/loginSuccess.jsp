<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import ="test.login.dto.LoginDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%=request.getSession().getAttribute("usernm") %>님 로그인성공
		<input type="submit" value="로그아웃" onclick="javascript:location.href='loginout.do'"/>
</body>
</html>