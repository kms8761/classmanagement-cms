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
	ResultSet rs = tdao.testlist(l_id); //���蹮�� ��� ������
	int score = 0;
	GradeDAO gdao = new GradeDAO();
	//��� �޾Ƽ� �ش� type�� �׷��� �����
	//grade ���̺� ä���
	while(rs.next()){
		int q_id = rs.getInt("q_id");
		int q_score = rs.getInt("q_score");
		String answer = request.getParameter(Integer.toString(q_id));
		String corAnswer = rs.getString("corAnswer");
		int tryTimes = tdao.getTryTimes(q_id); //���� �õ�Ƚ���� 1 �ø���
		tryTimes++;
		tdao.updateTryTimes(tryTimes, q_id);

		if(answer.equals(corAnswer)){//��������
			score += q_score; //������ŭ �����ø���
			int rightTimes = tdao.getRightTimes(q_id); //���� Ƚ�� ��ȸ
			rightTimes++; //����
			tdao.updateRightTimes(rightTimes,q_id); //������Ʈ
		}
		gdao.insert(q_id, type, score, u_id, l_id, corAnswer); //�� ������ ��� ����
	}
	response.sendRedirect("../Lecture/Lecture.jsp?l_id="+l_id);
%>
</body>
</html>