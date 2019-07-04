<%@ page import="com.DB.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		int q_id = Integer.parseInt(request.getParameter("q_id"));
		int l_id = Integer.parseInt(request.getParameter("l_id"));
		
		TestDAO tdao = new TestDAO();
		
		tdao.deleteQuestion(q_id);
		
		response.sendRedirect("questionlist.jsp?l_id="+l_id);
	%>
</body>
</html>