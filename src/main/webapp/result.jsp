<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String result = 
		request.getParameter("R");
	if(result.equals("T")){
%>
		<script type="text/javascript">
			alert("등록 성공");

			location.href="index.jsp";
		</script>		
<%
	}else{
		%>
		<script type="text/javascript">
			alert("등록 싪패");

			location.href="index.jsp";
		</script>		
<%
	}
	
%>
</body>
</html>