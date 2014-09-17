<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>

<% 
	NewBoardDTO newBoardDTO = (NewBoardDTO)request.getAttribute("newBoardDTO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/web/ckeditor/ckeditor.js"></script>
<script src="/web/ckeditor/sample.js" type="text/javascript"></script>
<link href="/web/ckeditor/sample.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
	<script type="text/javascript">
		function savesubmit() {
			frm = document.form;
			var oEditor = CKEDITOR.instances.content;
			var con = document.getElementById('content');
			con.value = oEditor.getData();
			frm.action = "newwrite.do";
			form.submit();
		}
	</script>
</head>
<body>
<form name="form" method="post" action="#">
	<input type="hidden" name="b_no" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getB_no() %><% } %>" >
	이름 : <input type="text" name="name" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getName() %><% } %>"><br>
	제목 : <input type="text" name="subj" value="<%  if(newBoardDTO != null) {  %><%=newBoardDTO.getSubj() %><% } %>"><br>
		<textarea cols="100" id="content" name="content" rows="10"><%  if(newBoardDTO != null) {  %><%=newBoardDTO.getNewcontents() %><% } %></textarea>
		<script type="text/javascript">
			var editor = CKEDITOR.replace( 'content' ,{customConfig:'/web/ckeditor/config.js', width:'750px', height:'450px'});			
		</script>	
	<input type="button" value="글쓰기" onclick="savesubmit();">
	<input type="button" value="목록보기" onclick="javascript:location.href='newlist.do'">
</form>
</body>
</html>