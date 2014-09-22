<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Iterator, test.nboard.dto.NewBoardDTO" %>

<%
	@SuppressWarnings("unchecked")
	List<NewBoardDTO> newboardList = (List<NewBoardDTO>)request.getAttribute("newboardList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td>no</td>
			<td>제목</td>
			<td>이름</td>
			<td>등록일시</td>
		</tr>
	</thead>
	<tbody>
	<%
	if(newboardList != null && newboardList.size() > 0) {
		Iterator<NewBoardDTO> iterator = newboardList.iterator();
		while(iterator.hasNext()) {
			NewBoardDTO newBoardDTO = iterator.next();
	%>
		<tr>
			<td><%=newBoardDTO.getNum() %></td>
			<td>
				<% if(newBoardDTO.getB_level().intValue() != 0) { %>
					<% for(int i=1; i < newBoardDTO.getB_level().intValue(); i++) {  %>
						&nbsp;&nbsp;
					<% } %>				
					<img src="../../image/tip_reple.gif" width="22" height="12" border="0" alt="">
				<% } %>
				<a href="./newview.do?b_no=<%=newBoardDTO.getB_no()%>"><%=newBoardDTO.getSubj() %></a>
			</td>
			<td><%=newBoardDTO.getName() %></td>
			<td><%=newBoardDTO.getRegdate() %></td>
		</tr>
	<%
		}
	} else {
	%>
		<tr>
			<td colspan="4" align="center">목록이 없습니다.</td>
		</tr>
	<%
	}
	%>
	</tbody>
	</table>
	<input type="button" value="글쓰기" onclick="javascript:location.href='newwrite.do'">
</body>
</html>