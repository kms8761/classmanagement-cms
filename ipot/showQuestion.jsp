<%@ page import = "Proj.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#main{
   background-color: #232f3f;
   height : 250px;
}
#main_title{
   margin-top: 1%;
   font-size: 90px;
   text-align :center;
   color : white;
}
#Main_bar{
   wdith:100%;
   margin-top:0px;
   height:40px;
}
#logo{
   margin-left:20%;
   margin-top:7px;
   font-size : 30px;
}
#Userbar{
    margin-top:10px;
    margin-right:15%;
    font-family: sans-serif;
    font-weight: 400;
    color:white;
}
#bar{
   width : 80%;
}
#menu_bar{
   margin-left: 30%;
   list-style:none;
   display : block;
   
}
#menubar>li{  margin : 0px;
   padding : 0px; }
li>a{display : block;text-decoration: none;}
li>a:HOVER, li>a:FOCUS{
   color: white;
   background-color: #f40;
   border: 1px solid #f40;
   border-radius: 7px;
   height: 40px;
}
.menu{
   padding-top:10px;
   display:inline-block;
   width : 16%;
   height : 30px;
   text-align:center;
   font-size : 25px;
   margin-right : 3%;
   padding-bottom: 10px;
}
.table{
	width : 100%;
	text-align: center;

}
.th{
	font-family: arial serif;
	font-weight : 500;
	font-size: 15px;
	background-color: #FFFAFA;
}
.td{
	border-top : 1px solid 	#D3D3D3;
	width : 33%;
	font-weight: 100;
	background-color: #FFFAFA;
}
.q_name{
	border-bottom: 2px solid #0076C0;
	font-size : 25px;
}
.q_content{
	font-size : 15px;
}
.q_answer{
	border-bottom: 2px solid #0076C0;
	font-size : 25px;
}
.q_answer_content{
	font-size: 15px;
	margin-bottom: 5%;
}
.change{
	text-decoration: none;
	margin-left : 45%;
	font-size: 20px;

}
.bogi{
	padding-top: 5px;
	margin-left :2%;
	text-align: justify;

   	width : 100%;
   	height : 20px;
   	font-size : 15px;
   	list-style: square;
}
#footer{
   margin-top : 5%;   
   height:200px;
   background-color: #E6E6E6;
   text-align: center;
}
.foot_img{
   height:30px;
   width: 30px;
   padding-top: 30px;
   margin-right: 25px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

var Question = document.getElementsByName("q_box");
function check(){
	var checkval = null;
	
	for(var i=0; i<Question.length; i++){
		if(Question[i].checked==true){
			 document.frm.submit();
			 checkval = 2;
		}//한문제라도 checked 되면 submit
	}
	if(checkval !=2){
		alert("출제 문제를 선택해 주세요.");
	}
}

$(document).ready(function(){

 	$('#test_table tr:odd').css("backgroundColor","#f5f5fc");         // odd 홀수
 	$('#test_table tr:even').css("backgroundColor","#fff");   // even 짝수
 });

</script>
</head>
<body>



<!-- -------------------------수정할부분--------------------------- -->
<div style="margin-top:5%; width:50%; margin-left:25%;">
<%
	int q_id = Integer.parseInt(request.getParameter("q_id"));
	
	TestDAO tdao = new TestDAO();
	
	ResultSet rs = tdao.showOneQuestion(q_id);
	
	while(rs.next()){
		String q_content = rs.getString("q_content");
		String answer1 = rs.getString("answer1");
		String answer2 = rs.getString("answer2");
		String answer3 = rs.getString("answer3");
		String answer4 = rs.getString("answer4");
		String answer5 = rs.getString("answer5");
		String corAnswer = rs.getString("corAnswer");
		float rightTimes = rs.getInt("rightTimes");
		float tryTimes = rs.getInt("tryTimes");
		float rating = ((rightTimes+1) / (tryTimes+1))*100;
%>
		<div>
<%
		if(answer1.length()!=0){
%>
		<table class="table">
			<tr>
				<td class="th">정답수</td>
				<td class="th">제출수</td>
				<td class="th">정답비율</td>
			<tr>
			<tr>
				<td class="td"><%=(int)rightTimes %></td>
				<td class="td"><%=(int)tryTimes %></td>
				<td class="td"><%=rating%></td>
			</tr>
		</table>
		<p style="margin-top:5%;"><span class="q_name">문제</span></p> 
		<p class="q_content"><%=q_content%></p>
		<p>
			<ul style="padding-left: 0px;"><span class="q_name" style="">보기</span>
				<br><br>
				<li class="bogi">보기1 : <%=answer1 %></li>
				<li class="bogi">보기2 : <%=answer2 %></li>
				<li class="bogi">보기3 : <%=answer3 %></li>
				<li class="bogi">보기4 : <%=answer4 %></li>
				<li class="bogi">보기5 : <%=answer5 %></li>
			</ul>
		</p>
		<p><span class="q_answer">정답</span></p>
		<p class="q_answer_content"><%=corAnswer %></p>
		<a href="updateQuestion.jsp?&q_id=<%=q_id%>" class="change" style="margin-top">수정하기</a>
<%
		}else{
%>
		<table class="table">
			<tr>
				<td class="th">정답수</td>
				<td class="th">제출수</td>
				<td class="th">정답비율</td>
			<tr>
			<tr>
				<td class="td"><%=(int)rightTimes %></td>
				<td class="td"><%=(int)tryTimes %></td>
				<td class="td"><%=rating%></td>
			</tr>
		</table>
		<p style="margin-top:5%;"><span class="q_name">문제</span></p> 
		<p class="q_content"><%=q_content%></p>
		<p><span class="q_answer">정답</span></p>
		<p class="q_answer_content"><%=corAnswer %></p>
		<a href="updateQuestion.jsp?l_id&q_id=<%=q_id%>" class="change">수정하기</a>
		</div>
<%		
		}
	}
%>
</div>
</div>
<!-- -------------------------수정할부분--------------------------- -->

</body>
</html>