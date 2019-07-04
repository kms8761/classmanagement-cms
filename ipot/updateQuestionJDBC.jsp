<%@ page import="com.DB.*" %>
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
	String question = request.getParameter("question");
	String answer1 = request.getParameter("answer1");
	String answer2 = request.getParameter("answer2");
	String answer3 = request.getParameter("answer3");
	String answer4 = request.getParameter("answer4");
	String answer5 = request.getParameter("answer5");
	String cAnswer = request.getParameter("CAnswer");
	int l_id = Integer.parseInt(request.getParameter("l_id"));
	int q_id = Integer.parseInt(request.getParameter("q_id"));
	
	TestDAO tdao = new TestDAO();
	tdao.updateQuestion(question, answer1, answer2, answer3, answer4, answer5, cAnswer, q_id);
	
	response.sendRedirect("showQuestion.jsp?l_id="+l_id +"&q_id=" + q_id);
%>
</body>
</html>