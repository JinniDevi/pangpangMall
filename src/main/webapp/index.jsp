<%
	if(session.getAttribute("mem_id")==null){
		response.sendRedirect("login.jsp");
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
	location.href="/mainList.do";
</script>
</head>
<body id="page-top">
</body>
</html>
