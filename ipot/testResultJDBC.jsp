<%@ page import=Proj.*" %>
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
	ResultSet rs = tdao.testlist(l_id); //시험문제 목록 가져옴
	int score = 0;
	GradeDAO gdao = new GradeDAO();
	//결과 받아서 해당 type의 그래프 만들기
	//grade 테이블 채우기
	while(rs.next()){
		int q_id = rs.getInt("q_id");
		int q_score = rs.getInt("q_score");
		String answer = request.getParameter(Integer.toString(q_id));
		String corAnswer = rs.getString("corAnswer");
		int tryTimes = tdao.getTryTimes(q_id); //먼저 시도횟수를 1 늘린다
		tryTimes++;
		tdao.updateTryTimes(tryTimes, q_id);

		if(answer.equals(corAnswer)){//맞췄으면
			score += q_score; //배점만큼 점수올리고
			int rightTimes = tdao.getRightTimes(q_id); //맞은 횟수 조회
			rightTimes++; //증가
			tdao.updateRightTimes(rightTimes,q_id); //업데이트
		}
		gdao.insert(q_id, type, score, u_id, l_id, corAnswer); //각 문제별 결과 저장
	}
	response.sendRedirect("../Lecture/Lecture.jsp?l_id="+l_id);
%>
</body>
</html>