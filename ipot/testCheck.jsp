<%@ page import="Proj.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#mainbar{
	width:100%;
	height : 10%;
	text-align: center;
	font-size : 50px;
	font-weight: bold;
	margin-top: 15px;
}
#Lecture_name{
	margin-top : 5%;
	margin-left : 20%;
	font-size : 40px;
}
#test_name{
	padding-top : 5%;
	margin-left : 30%;
	font-size : 40px;
}
#stu_name{
	position : relative;
	top : 20%;
	left : 20%;
	font-size : 40px;
	height:100%;
	}
#mid{
	column-count: 2;
	font-size:22px;
}
#test_style{
	font-size : 18px;
}
#typetext{
	border : 1px solid #A9A9A9;
	height : 40px;
	font-size : 25px;
	text-align: center;
}
#start_btn{
	text-decoration: none;
	margin-right : 20px;
	font-size : 20px;
	font-family: serif;
}
#cancel_btn{
	font-size : 20px;
	text-decoration: none;
	font-family: serif;
}
</style>
<script type="text/javascript">
	function submit(){
		var findString = " ";
		if(document.frm.type.value.indexOf(findString)!=-1){
			alert("������ ������ �ֽʽÿ�.");
			return;
		}
		if(document.frm.type.value==""){
			alert("���������� �Է����ּ���.");
			return;
		}
		document.frm.submit();
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String u_id = (String)session.getAttribute("ID");
	if(u_id==null){
		response.sendRedirect("Homepage1.html");
	}
	
	int l_id = Integer.parseInt(request.getParameter("l_id"));
	String[] q_box = request.getParameterValues("q_box"); //questionlist���� üũ�� q_id���� �޾ƿ�

	int q_id;
	String u_name = "";
	DAO dao = new DAO();
	boolean isInstructor = dao.isInstructor(u_id);
	if(isInstructor){
		u_name = dao.getName(u_id);
	}else{
		u_name = dao.getSName(u_id);
	}
	LectureDAO ldao = new LectureDAO();
	String l_name = ldao.getLectureName(l_id);
	TestDAO tdao = new TestDAO();
	boolean testing = tdao.testing(l_id);
	   if(testing){
	      %>
	      <script type="text/javascript">
	      alert("�̹� �������� ������ �ֽ��ϴ�.");
	      history.back();
	      </script>
	      <%
	   }
	ResultSet rs = null;
	String temp = "";
	for(int i=0; i<q_box.length; i++){
		temp += q_box[i].concat("/");
	}
%>
<div id="mainbar">
	<span>���� ��� Ȯ��</span>
</div>
<div id="main" style="height:100px; border : 2px solid black; margin-bottom: 30px;">
	<div style="float:left; width:33%; height:100%; ">
		<div id="Lecture_name"><%=l_name%></div> <!-- ---------------------�����̸� --------------->
	</div>
	<div style="float:right; width:67%; height:100%;">
		<div style="float:left; width:50%; height:100%;">
			<div style=" height:100%; border-left: 2px solid black;">
				<div id="test_name">Test Type</div><!-- ------------------���賻�̸�-------------- -->
			</div>
		</div>
		<div style="float: right;width:50%; height:100%; ">
			<div style="height : 100%;border-left : 2px solid black;">
				<span  id="stu_name"n>Name : <%=u_name%> </span><!-- ---------------------------�л� �̸� -->
			</div>
		</div>
	</div>
</div>
<div style="margin-top : 30px;" id="mid">
<form method="post" action="testJDBC.jsp?l_id=<%=l_id%>&q_box=<%=temp%>&length=<%=q_box.length%>" name="frm">
<%
	for(int i=0; i<q_box.length; i++){		//���� q_id ����Ʈ�� int�� ����ȯ �� �Ѱ��� �������� �ҷ���
		q_id = Integer.parseInt(q_box[i]);
		rs = tdao.testQuestion(q_id);
		while(rs.next()){
			String q_content = rs.getString("q_content");
			int q_score = rs.getInt("q_score");
			String answer1 = rs.getString("answer1");
			String answer2 = rs.getString("answer2");
			String answer3 = rs.getString("answer3");
			String answer4 = rs.getString("answer4");
			String answer5 = rs.getString("answer5");
			String corAnswer = rs.getString("corAnswer");
			%>
			
		����<%=i+1%>) <%=q_content%> (<%=q_score%>��)
			<%if(answer1.length() != 0){%>
				<br>
				<input type="radio" name="choice<%=i%>" value="<%=answer1%>"><%=answer1%><br>
				<input type="radio" name="choice<%=i%>" value="<%=answer2%>"><%=answer2%><br>
				<input type="radio" name="choice<%=i%>" value="<%=answer3%>"><%=answer3%><br>
				<input type="radio" name="choice<%=i%>" value="<%=answer4%>"><%=answer4%><br>
				<input type="radio" name="choice<%=i%>" value="<%=answer5%>"><%=answer5%><br>
				����:<%=corAnswer%>
				<br><br>
			<%
				}else{
			%>
				<br>
				<input type="text" name="choice<%=i%>" value="<%=corAnswer%>"><%=answer1%><br><br><br>
<%				
				}
			}
		}
%>
</div>
<hr width="100%">
<div style="width : 40%; margin-left:30%;">
	<div style="margin-bottom: 500px;">
	<center>
		<div style="margin-top: 40px; margin-bottom: 30px;">
			<p style="font-family: serif; font-size : 20px">�ؽ������� �Է¡�</p>
			<input type="text" name="type" placeholder=" ex) Mid" size="30" id="typetext">
		</div>
		<a href="#" onclick="submit(); return false" id="start_btn">�������</a>
		<a href="#" onclick="location.href='questionlist.jsp?l_id=<%=l_id %>'" id="cancel_btn">���</a>
	</center>
</form>
	</div>	
</div>
</body>
</html>