<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Package.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<%
	ArrayList<Vote> huboRank = (ArrayList<Vote>)request.getAttribute("HR");
%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h1>투표검수조회</h1>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
	<%
		for(Vote v:huboRank){
	%>
			<tr>
				<td><%= v.getM_NO()%></td>
				<td><%= v.getM_NAME()%></td>
				<td><%= v.getTOTAL()%></td>
			</tr>
	<%
		}
	%>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>