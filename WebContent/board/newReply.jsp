<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
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
    <link href="/web/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/web/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/web/bootstrap/css/style.css" type="text/css" media="screen" title="no title" charset="utf-8"/>
    <script src="/web/script/jquery-1.3.2.js"> </script>

	<script type="text/javascript">
		function savesubmit() {						
			if($("#name").val() == '') {
				alert("이름을 입력해주세요");
				return;
			}
			
			if($("#subj").val() == '') {
				alert("제목을 입력해주세요");
				return;
			}
			
			if($("#content").val() == '') {
				alert("내용을 입력해주세요");
				return;
			}
			
			frm = document.form;
			frm.action = "newReply.do";
			form.submit();
		}
	</script>

</head>
<body>
<form name="form" method="post" action="#">
	<input type="hidden" name="b_no" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getB_no() %><% } %>">
	<input type="hidden" name="ref" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getRef() %><% } %>">
	<input type="hidden" name="b_level" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getB_level() %><% } %>">
	<input type="hidden" name="step" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getStep() %><% } %>">
	
	<table cellpadding="0" cellspacing="0" border="0" width="700"  class="table table-bordered">
		<tr>
			<th width="100">이름</th>
			<td width="600" style="text-align:left;">
				<input type="text" name="name" id="name" style="width:550px;" value="">
			</td>
		</tr>
		<tr>
			<th width="100">제목</th>
			<td width="600" style="text-align:left;">
				<input type="text" name="subj" id="subj" style="width:550px;" value="">
			</td>
		</tr>
		<tr>
			<td width="700" colspan="2" style="text-align:left;">
				<textarea id="content" name="content" style="width:680px;height:100px;"><%  if(newBoardDTO != null) {  %><%=newBoardDTO.getNewcontents() %><% } %></textarea>
			</td>
		</tr>
	</table>	

	<div style="width:700px;text-align:right;margin-top:5px;">
		<input type="button" value="글쓰기" class="btn btn-sx btn-primary" onclick="savesubmit();">
		<input type="button" value="목록보기" class="btn btn-sx btn-primary" onclick="javascript:location.href='newlist.do'">
	</div>
	
</form>
</body>
</html>