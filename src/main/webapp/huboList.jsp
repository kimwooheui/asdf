<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Package.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<%
	ArrayList<Vote> huboList = (ArrayList<Vote>)request.getAttribute("HL");
%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h1>후보조회</h1>
		<table>
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			</tr>
	<%
		for(Vote v:huboList){
	%>
			<tr>
				<td><%= v.getM_NO() %></td>
				<td><%= v.getM_NAME() %></td>
				<td><%= v.getP_NAME() %></td>
				<td><%= v.getP_SCHOOL() %></td>
				<td><%= v.getM_JUMIN() %></td>
				<td><%= v.getM_CITY() %></td>
				<td><%= v.getP_TEL() %></td>
			</tr>
	<%
		}
	%>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
