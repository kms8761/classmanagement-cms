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
	String type = request.getParameter("type");
	TestDAO tdao = new TestDAO();
	GradeDAO gdao = new GradeDAO();
	String gType = gdao.getType(l_id, type);
	System.out.println(gType);
	System.out.println(type);
	if(gType.equals(type)){
	%>
		<script type="text/javascript">
			alert("이미 존재하는 시험 종류 입니다.");
			history.back();
		</script>
	<%
	}else{
		int length = Integer.parseInt(request.getParameter("length"));
		String temp = request.getParameter("q_box");
		int q_id;
		tdao.updateOffTest(l_id);
		for(int i=0; i<length; i++){
			q_id = Integer.parseInt(temp.split("/")[i]);
			tdao.updateOnTest(type, q_id, l_id);
		}
		
		response.sendRedirect("testStart.jsp?l_id="+l_id+"&type="+type);
	}
%>
</body>
</html>