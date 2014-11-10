<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		function commentsubmit() {
			if($("#comment").val() == '') {
				alert("코멘트를 입력해주세요");
				return;
			}
			
			frm = document.form;
			frm.action = "newview.do";
			form.submit();
		}
		
		function deleteSubmit() {
			frm = document.form;
			frm.action = "deleteBoard.do";
			form.submit();
		}
	</script>
	<title>Insert title here</title>	
</head>
<body>
	<form name="form" method="post" action="#">
		<input type="hidden" name="b_no" value="<% if(newBoardDTO != null)  { %><%=newBoardDTO.getB_no() %><% } %>">
		
		<table cellpadding="0" cellspacing="0" border="0" width="100%"  class="table table-bordered">
			<tr>
				<th width="15%">이름</th>
				<td width="85%"><%=newBoardDTO.getName() %></td>
			</tr>
			<tr>
				<th width="15%">제목</th>
				<td width="85%"><%=newBoardDTO.getSubj() %></td>
			</tr>		
			<tr>
				<td width="100%" colspan="2" style="text-align:left;">
					<%=newBoardDTO.getNewcontents() %><br /><br /><br />
		
					<div id="fb-root"></div>
					<script>(function(d, s, id) {
					  	var js, fjs = d.getElementsByTagName(s)[0];
					  	if (d.getElementById(id)) return;
					  		js = d.createElement(s); js.id = id;
					  		js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.0";
					  		fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
					</script>
						
					<div class="fb-like" data-href="http://127.0.0.1:8080/web/view/board/newview.do?b_no=<%=newBoardDTO.getB_no()%>" 
						data-width="700" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>				
				</td>
			</tr>
		</table>
		
		<div style="width:100%;text-align:right;margin-bottom:15px;">
			<input type="button" value="목록보기" class="btn btn-sx btn-primary"  onclick="javascript:location.href='newlist.do'">
			<input type="button" value="수정하기" class="btn btn-sx btn-primary"  onclick="javascript:location.href='newwrite.do?b_no=<%=newBoardDTO.getB_no()%>'">
			<input type="button" value="답글" class="btn btn-sx btn-primary"  onclick="javascript:location.href='newReply.do?b_no=<%=newBoardDTO.getB_no()%>'">
			<input type="button" value="삭제" class="btn btn-sx btn-primary"  onclick="deleteSubmit();">
		</div>
		
		<c:if test="${not empty listBoardComment}">
		<table cellpadding="0" cellspacing="0" border="0" width="700" class="table table-striped table-bordered table-hover table-condensed">
			<c:forEach items="${listBoardComment}" var="commentBoard"  varStatus="status">
				<tr>
					<td>${commentBoard.comment}</td>
				</tr>
			</c:forEach>
		</table>
		</c:if>

		<table cellpadding="0" cellspacing="0" border="0" width="100%"  class="table table-bordered">
			<tr>
				<td width="95%"  style="text-align:left;height:60px;">
					<textarea id="comment" name="comment" style="width:95%;height:50px;"></textarea>
				</td>
				<td width="5%"  style="text-align:right;height:60px;" valign="middle">
					<input type="button" value="코멘트" class="btn btn-lg btn-primary"  onclick="commentsubmit();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>