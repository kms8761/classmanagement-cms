<%@ page import = "Proj.*" %>
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
<%@ include file="Time.jsp" %>
	<%
	 	request.setCharacterEncoding("euc-kr");
		
		String u_id = (String)session.getAttribute("ID");
		String title = request.getParameter("title");
		String context = request.getParameter("main");
		String[] receive_id = request.getParameterValues("member");
		String time = year+"-"+month+"-"+date;
		int l_id = Integer.parseInt(request.getParameter("l_id"));
		
		MailBoardDAO mbdao = new MailBoardDAO();
		
		for(int i=0; i<receive_id.length; i++){
			mbdao.mailInsert(u_id, receive_id[i], title, context, time, l_id);
		}
		
		response.sendRedirect("maillist.jsp?l_id="+l_id);
	%>
</body>
</html>