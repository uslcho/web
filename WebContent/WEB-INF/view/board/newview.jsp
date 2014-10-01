<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>
<% 
	NewBoardDTO newBoardDTO = (NewBoardDTO)request.getAttribute("newBoardDTO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/web/css/style.css" media="screen"/>
<title>Insert title here</title>
</head>
<body>
	<table cellpadding="0" cellspacing="0" border="1" class="tableTd" width="700">
		<tr>
			<td width="100" class="titleThead">이름</td>
			<td width="600"><%=newBoardDTO.getName() %></td>
		</tr>
		<tr>
			<td width="100" class="titleThead">제목</td>
			<td width="600"><%=newBoardDTO.getSubj() %></td>
		</tr>		
		<tr>
			<td width="700" colspan="2" style="text-align:left;"><%=newBoardDTO.getNewcontents() %></td>
		</tr>
	</table>
	
	<div style="width:700px;text-align:center;margin-top:5px;">
		<input type="button" value="목록보기" onclick="javascript:location.href='newlist.do'">
		<input type="button" value="수정하기" onclick="javascript:location.href='newwrite.do?b_no=<%=newBoardDTO.getB_no()%>'">
		<input type="button" value="답글" onclick="javascript:location.href='newReply.do?b_no=<%=newBoardDTO.getB_no()%>'">
	</div>
</body>
</html>