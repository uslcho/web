<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/web/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/web/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/web/bootstrap/css/style.css" type="text/css" media="screen" title="no title" charset="utf-8"/>
    <link rel="stylesheet" href="/web/bootstrap/css/bootstrap-datetimepicker.min.css" type="text/css" media="screen" title="no title" charset="utf-8"/>
	<script src="/web/script/jquery-1.3.2.js"> </script>
	<script type="text/javascript" src="/web/script/jquery.min.js"></script>
	<script src="/web/script/newpaging.js" type="text/javascript"></script>
	<script src="/web/bootstrap/js/bootstrap.min.js"></script>

	<title>Insert title here</title>
	<script>
		function nexpage(npage) {
			var frm = document.form;
			frm.page.value = npage;
			frm.submit();
		}

		$(function() {
			var tpage = "${totalpage}";			
			if(tpage > 1) {						
				var nowpage = "${nowpage}";
				$("#tablepaging").paginate({
					count 		: tpage,
					start 		: nowpage,
				});
			}
		});
		
		function searchList() {
			var frm = document.form;
			frm.page.value = 1;
			frm.submit();
		}		
	</script>
</head>
<body>

<c:import url="http://127.0.0.1:8080/web/test.do"></c:import>

<form name="form" method="post" action="#">
	<input type="hidden" id="page" name="page" value="${nowpage}" />	
	
	<div style="width:100%;float:left;">
		등록일 : 
		<il id="datetimepicker01" class="input-append" style="margin:5px;">
		   	<input data-format="yyyy-MM-dd" type="text" id="sdate" name="sdate" style="width:120px;" value="${newBoardDTO.sdate}"></input>
			<span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>
		</il>
		~
		<il id="datetimepicker02" class="input-append" style="margin:5px;">
		    <input data-format="yyyy-MM-dd" type="text" id="edate" name="edate" style="width:120px;" value="${newBoardDTO.edate}"></input>
		    <span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>
		</il>
		
		<il  id="searchdiv">
			<select id="search" name="search" style="width:120px;">
				<option value="1" <c:if test="${newBoardDTO.search eq '1'}">selected="selected"</c:if>>제목</option>
				<option value="2" <c:if test="${newBoardDTO.search eq '2'}">selected="selected"</c:if>>이름</option>
				<option value="3" <c:if test="${newBoardDTO.search eq '3'}">selected="selected"</c:if>>내용</option>
				<option value="4" <c:if test="${newBoardDTO.search eq '4'}">selected="selected"</c:if>>제목+내용</option>
			</select>
			<input type="text" style="width:250px;" id="searchText" name="searchText" value="${newBoardDTO.searchText}"></input>
		</il>

		<il  id="buttom">
			<input type="button" value="검색"  class="btn btn-sx btn-primary" onclick="javascript:searchList();">
		</il>
	</div>
	
	<table cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-hover table-condensed">
		<thead>
			<tr> 
				<th width="5%">no</th>
				<th width="65%">제목</th>
				<th width="15%">이름</th>
				<th width="15%">등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${newboardList}" var="goods"  varStatus="status">
				<tr>
					<td width="5%"><c:out value="${goods.num}" /></td>
					<td width="65%">
						<c:if test="${goods.b_level ne 0}">							
							<c:forEach begin="1" end="${goods.b_level}">
								&nbsp;&nbsp;
							</c:forEach>
							Re : 
						</c:if>
						<a href="./newview.do?b_no=${goods.b_no}"><c:out value="${goods.subj}" /></a>
					</td>
					<td width="15%"><c:out value="${goods.name}" /></td>
					<td width="15%"><c:out value="${goods.regdate}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div style="width:100%;" id="divpaging" class="pagination pagination-small pagination-centered">
		<ul id="tablepaging"></ul>
	</div>
	
	<div style="width:100%;text-align:right;">
		<input type="button" value="글쓰기"  class="btn btn-sx btn-primary" onclick="javascript:location.href='newwrite.do'">
	</div>
</form>
<script src="/web/bootstrap/js/bootstrap-datetimepicker.min.js"> </script>
<script src="/web/bootstrap/js/bootstrap-datetimepicker.pt-BR.js"> </script>
<script type="text/javascript">
	$(function() {
	    $('#datetimepicker01').datetimepicker({
	        format: 'yyyy-MM-dd',
	        language: 'pt-BR'
	    });		
	});
	
    $('#datetimepicker02').datetimepicker({
        format: 'yyyy-MM-dd',
        language: 'pt-BR'
    });
</script>
</body>
</html>