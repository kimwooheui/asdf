<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Package.*,java.util.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<%
	ArrayList<Vote> voteList = (ArrayList<Vote>)request.getAttribute("VL");
%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h1>투표검수조회</h1>
		<table>
			<tr>
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보전호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			</tr>
	<%
		for(Vote v:voteList){
	%>
			<tr>
				<td><%= v.getV_NAME()%></td>
				<td><%= v.getV_JUMIN()%></td>
				<td><%= v.getV_AGE()%></td>
				<td><%= v.getV_GENDER()%></td>
				<td><%= v.getM_NO()%></td>
				<td><%= v.getV_TIME()%></td>
				<td><%= v.getV_CONFIRM()%></td>
			</tr>
	<%
		}
	%>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>