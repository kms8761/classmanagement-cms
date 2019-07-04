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
.finish_btn{
	font-family: serif;
	font-size : 25px;
	font-weight : bold;
	text-decoration: none;
	margin-right: 20px;
}
</style>
<script type="text/javascript">
function submit(){
	document.frm.submit();
	
}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");

	String u_id = (String)session.getAttribute("ID");
	if(u_id==null){
		response.sendRedirect("../index.html");
	}
	
	int l_id = Integer.parseInt(request.getParameter("l_id"));
	
	GradeDAO gdao = new GradeDAO();
	
	
	
	LectureDAO ldao = new LectureDAO();
	String l_name = ldao.getLectureName(l_id);
	
	DAO dao = new DAO(); //현제 시험 과목의 교수 이름 get
	
	ResultSet lrs = ldao.getInstructorId(l_id);
	String i_id = "";
	String u_name = "";
	
	while(lrs.next()){
		i_id = lrs.getString("i_id");
	}
	String i_name = dao.getName(i_id);
	
	boolean isInstructor = dao.isInstructor(u_id);
	int total=0;
	
	if(isInstructor){
		u_name = dao.getName(u_id);
	}else{
		u_name = dao.getSName(u_id);
	}
	TestDAO tdao = new TestDAO();
	String type = tdao.getType(l_id);
	
	int index = 1;
	int cnt = tdao.count(l_id);
	if(cnt==0){
	%>
	<script type="text/javascript">
	alert("진행중인 시험이 없습니다.");
	history.back();
	</script>
	<%
	}
	boolean twoTimes = gdao.twoTimes(l_id, u_id, type);
	if(twoTimes){
	%>
		<script type="text/javascript">
		alert("이미 시험을 응시 하셨습니다.");
		history.back();
		</script>
<%
	}
%>
<%
ResultSet rs = tdao.testlist(l_id);
if(cnt!=0){
	%>
<div id="main" style="height:100px; border : 2px solid black; margin-bottom: 30px;">
	<div style="float:left; width:33%; height:100%; ">
		<div id="Lecture_name"><%=l_name %></div> <!-- ---------------------강의이름 --------------->
	</div>
	<div style="float:right; width:67%; height:100%;">
		<div style="float:left; width:50%; height:100%;">
			<div style=" height:100%; border-left: 2px solid black;">
				<div id="test_name"><%=type %></div><!-- ------------------시험type이름-------------- -->
			</div>
		</div>
		<div style="float: right;width:50%; height:100%; ">
			<div style="height : 100%;border-left : 2px solid black;">
				<spa  id="stu_name"n>Name : <%=u_name%> </span><!-- ---------------------------학생 이름 -->
			</div>
		</div>
	</div>
</div>
<div style="margin-top : 30px;" id="mid">
<form method="post" action="testResultJDBC.jsp?l_id=<%=l_id%>&type=<%=type%>" name="frm">
<input type="hidden" name="type">
<%
	while(rs.next()){
		int q_id = rs.getInt("q_id");
		String q_content = rs.getString("q_content");
		int q_score = rs.getInt("q_score");
		String answer1 = rs.getString("answer1");
		String answer2 = rs.getString("answer2");
		String answer3 = rs.getString("answer3");
		String answer4 = rs.getString("answer4");
		String answer5 = rs.getString("answer5");
		%>
				
	문제<%=index++%>) <%=q_content%> (<%=q_score%>점)
		<%if(answer1.length() != 0){%>
			<br>
			<input type="radio" name="<%=q_id%>" value="<%=answer1%>" checked><%=answer1%><br>
			<input type="radio" name="<%=q_id%>" value="<%=answer2%>"><%=answer2%><br>
			<input type="radio" name="<%=q_id%>" value="<%=answer3%>"><%=answer3%><br>
			<input type="radio" name="<%=q_id%>" value="<%=answer4%>"><%=answer4%><br>
			<input type="radio" name="<%=q_id%>" value="<%=answer5%>"><%=answer5%><br><br><br>
		<%
			}else{
		%>
			<br>
			<input type="text" name="<%=q_id%>"><%=answer1%><br><br><br>

<%
			}
%>
<script>

</script>
<%
		}
%>
</div>
<hr width="100%">
<div style="width : 40%; margin-left:30%;">
	<div style="margin-bottom: 500px; margin-top : 60px;">
	<center>
<%
	if(isInstructor){
%>
		<a href="#" onclick="location.href='questionlist.jsp?l_id=<%=l_id %>'" class="finish_btn">뒤로 가기</a>
		<a href="#" onclick="location.href='quitTest.jsp?l_id=<%=l_id %>'" class="finish_btn">시험 종료</a>
<%
	}else{
%>
		<a href="#" onclick="submit(); return false" class="finish_btn">제출하기</a>
<%	} 
}
%>
	</center>
</form>
	</div>
</div>
</body>
</html>