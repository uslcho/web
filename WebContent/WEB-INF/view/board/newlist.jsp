<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="/web/css/style.css" media="screen"/>
	<script src="/web/script/jquery-1.3.2.js"> </script> 
	<script src="/web/script/jquery.paginate.js" type="text/javascript"></script>	
<title>Insert title here</title>
	<script>
		function nexpage(npage) {
			var frm = document.form;
			frm.page.value = npage;
			frm.submit();
		}
	</script>
</head>
<body>
<form name="form" method="post" action="#">
	<input type="hidden" id="page" name="page" value="${nowpage}" />
	<table cellpadding="0" cellspacing="0" border="1" class="tableTd" width="80%">
		<thead class="titleThead">
			<tr>
				<td width="10%">no</td>
				<td width="70%">제목</td>
				<td width="10%">이름</td>
				<td width="10%">등록일시</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${newboardList}" var="goods"  varStatus="status">
				<tr>
					<td width="10%"><c:out value="${goods.num}" /></td>
					<td width="70%">
						<a href="./newview.do?b_no=${goods.b_no}"><c:out value="${goods.subj}" /></a>
					</td>
					<td width="10%"><c:out value="${goods.name}" /></td>
					<td width="10%"><c:out value="${goods.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<table width="80%" cellpadding="0" cellspacing="0" border="0" style="margin-top:5px;">
		<tr>
			<td><div id="paging"></div></td>
		</tr>
	</table>
	
	<div style="width:80%;text-align:center;">
		<input type="button" value="글쓰기" onclick="javascript:location.href='newwrite.do'">
	</div>
</form>

<script type="text/javascript">
	$(function() {
		var tpage = "${totalpage}";
		var nowpage = "${nowpage}";
		$("#paging").paginate({
			count 		: tpage,
			start 		: nowpage,
			display     : 10,
			border					: true,
			border_color			: '#BEF8B8',
			text_color  			: '#000000',
			background_color    	: '#ffffff',	
			border_hover_color		: '#68BA64',
			text_hover_color  		: 'white',
			background_hover_color	: '#CAE6C6', 
			rotate                     : false,
			images					: false,
			mouse					: 'press',
			onChange     			: function(page) {
											  nexpage(page);
										  }
		});
	});
</script>	
</body>
</html>