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
	TestDAO tdao = new TestDAO();

	request.setCharacterEncoding("EUC-KR");

	String u_id = (String)session.getAttribute("ID");
	if(u_id==null){
		response.sendRedirect("../index.html");
	}
	
	int l_id = Integer.parseInt(request.getParameter("l_id"));

	String[] q_box = request.getParameterValues("q_box"); //questionlist에서 체크된 q_id들을 받아옴
	int q_id;

	ResultSet rs = null;
	for(int i=0; i<q_box.length; i++){		//받은 q_id 리스트를 int로 형변환 후 한개씩 페이지로 불러옴
		q_id = Integer.parseInt(q_box[i]);
		rs = tdao.testQuestion(q_id);
%>
<%
		while(rs.next()){
			String q_content = rs.getString("q_content");
			String answer1 = rs.getString("answer1");
			String answer2 = rs.getString("answer2");
			String answer3 = rs.getString("answer3");
			String answer4 = rs.getString("answer4");
			String answer5 = rs.getString("answer5");
%>
			문제<%=i+1%>) <%=q_content%>
			<%if(answer1 !=null){%>
			<br>
				<input type="radio" name="choice<%=i%>"><%=answer1%><br>
				<input type="radio" name="choice<%=i%>"><%=answer2%><br>
				<input type="radio" name="choice<%=i%>"><%=answer3%><br>
				<input type="radio" name="choice<%=i%>"><%=answer4%><br>
				<input type="radio" name="choice<%=i%>"><%=answer5%><br><br>
			<%}%>
<%
		}
	}
%>
</body>
</html>