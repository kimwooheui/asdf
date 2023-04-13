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
	ArrayList<Vote> voteSelect = (ArrayList<Vote>)request.getAttribute("HN");
%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<h1>투표하기</h1>
		<form action="voteInsert.do" method="post">
		<table>
			<tr>
				<th>주민번호</th>
				<td>
					<input type="text" name="JUMIN"> 예 : 8906153154726
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="NAME">
				</td>
			</tr>
			<tr>
				<th>투표번호</th>
				<td>
					<select name="VNUM">
						<%
						for(Vote v:voteSelect){
					%>
						<option value="<%= v.getM_NO() %>">
							[<%= v.getM_NO() %>]<%= v.getM_NAME()%></option>
					<%
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>투표시간</th>
				<td>
					<input type="text" name="TIME">
				</td>
			</tr>
			<tr>
				<th>투표장소</th>
				<td>
					<input type="text" name="CITY">
				</td>
			</tr>
			<tr>
				<th>유권자확인</th>
				<td>
					<input type="radio" value="Y" name="CONFIRM"> 확인 
					<input type="radio" value="N" name="CONFIRM"> 미확인
				</td>
			</tr>
			<tr>
			</tr>
			<tr></tr>
		</table>
		<div class="centerDiv">
			<input value="투표하기" type="submit" onClick="submitFn()">
			<input value="다시하기" type="reset" onClick="resetFn()">
		</div>
		</form>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>