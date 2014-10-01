<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>

<% 
	NewBoardDTO newBoardDTO = (NewBoardDTO)request.getAttribute("newBoardDTO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/web/css/style.css" media="screen"/>
	<script type="text/javascript">
		function savesubmit() {
			frm = document.form;		
			frm.action = "newwrite.do";
			form.submit();
		}
	</script>
<title>Insert title here</title>

</head>
<body>
<form name="form" method="post" action="#">

	<table cellpadding="0" cellspacing="0" border="1" class="tableTd" width="700">
		<tr>
			<td width="100" class="titleThead">이름</td>
			<td width="600" style="text-align:left;">
				<input type="text" name="name" style="width:550px;" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getName() %><% } %>">
			</td>
		</tr>
		<tr>
			<td width="100" class="titleThead">제목</td>
			<td width="600" style="text-align:left;">
				<input type="text" name="subj" style="width:550px;" value="<%  if(newBoardDTO != null) {  %><%=newBoardDTO.getSubj() %><% } %>">
			</td>
		</tr>		
		<tr>
			<td width="700" colspan="2" style="text-align:left;">
				<textarea cols="100" id="content" name="content" rows="10"><%  if(newBoardDTO != null) {  %><%=newBoardDTO.getNewcontents() %><% } %></textarea>
			</td>
		</tr>
	</table>

	<input type="button" value="글쓰기" onclick="savesubmit();">
	<input type="button" value="목록보기" onclick="javascript:location.href='newlist.do'">
</form>
</body>
</html>