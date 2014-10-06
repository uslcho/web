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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>게시판</title>
    <meta name="description" content="" />
    <meta name="author" content="" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />	    
    <link href="/web/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/web/bootstrap/css/font-awesome.css" type="text/css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="/web/bootstrap/css/style.css" type="text/css" media="screen" title="no title" charset="utf-8"/>    	
	<script src="/web/script/jquery-1.3.2.js"> </script> 
	<script src="/web/script/newpaging.js" type="text/javascript"></script>	

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
	<table cellpadding="0" cellspacing="0" border="1" class="tableTd" width="700">
		<thead class="titleThead">
			<tr>
				<td width="80">no</td>
				<td width="350">제목</td>
				<td width="100">이름</td>
				<td width="170">등록일시</td>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${newboardList}" var="goods"  varStatus="status">
				<tr>
					<td width="80"><c:out value="${goods.num}" /></td>
					<td width="350">
						<a href="./newview.do?b_no=${goods.b_no}"><c:out value="${goods.subj}" /></a>
					</td>
					<td width="100"><c:out value="${goods.name}" /></td>
					<td width="170"><c:out value="${goods.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div style="width:700px;" id="divpaging" class="pagination pagination-mini pagination-centered">
		<ul id="paging"></ul>
	</div>
	
	<div style="width:700px;text-align:center;">
		<input type="button" value="글쓰기"  class="btn" onclick="javascript:location.href='newwrite.do'">
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