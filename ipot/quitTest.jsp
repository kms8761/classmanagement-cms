<%@ page import="Proj.*" %>
<%@ page import="java.sql.*" %>
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
	request.setCharacterEncoding("EUC-KR");

	String u_id = (String)session.getAttribute("ID");
	if(u_id==null){
		response.sendRedirect("../index.html");
	}
	
	int l_id = Integer.parseInt(request.getParameter("l_id"));
	
	TestDAO tdao = new TestDAO();
	
	tdao.updateOffTest(l_id);
	
	response.sendRedirect("questionlist.jsp?l_id="+l_id);
%>
</body>
</html>