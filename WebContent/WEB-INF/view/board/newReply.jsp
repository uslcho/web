<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>

<% 
	NewBoardDTO newBoardDTO = (NewBoardDTO)request.getAttribute("newBoardDTO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form name="form" method="post" action="#">
	<input type="hidden" name="b_no" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getB_no() %><% } %>">
	<input type="hidden" name="ref" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getRef() %><% } %>">
	<input type="hidden" name="b_level" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getB_level() %><% } %>">
	<input type="hidden" name="step" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getStep() %><% } %>">
	이름 : <input type="text" name="name" value=""><br>
	제목 : <input type="text" name="subj" value=""><br>
		<textarea cols="100" id="content" name="content" rows="10"><%  if(newBoardDTO != null) {  %><%=newBoardDTO.getNewcontents() %><% } %></textarea>
	<input type="button" value="글쓰기" onclick="savesubmit();">
	<input type="button" value="목록보기" onclick="javascript:location.href='newlist.do'">
</form>
</body>
</html>