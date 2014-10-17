<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>
<% 
	NewBoardDTO newBoardDTO = (NewBoardDTO)request.getAttribute("newBoardDTO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>게시판</title>
    <meta name="description" content="" />
    <meta name="author" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />	    
    <link href="/web/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/web/bootstrap/css/font-awesome.css" type="text/css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="/web/bootstrap/css/style.css" type="text/css" media="screen" title="no title" charset="utf-8"/>    	
	<script src="/web/script/jquery-1.3.2.js"> </script> 
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