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

.box{
	width : 100%;
	border : 1px solid #DCDCDC;
	background-color: white;
}
.box2{
	border : 1px solid #F8F8FF;
	margin-left: 15px;
	border-bottom : 1px solid #FFFFFF;
}
.box3{
	width : 90%;
	height : 20px;
	border : 1px solid #DCDCDC;

}
.q_name{
	border-bottom: 2px solid #1E90FFx	;
	font-size : 25px;
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
#ok_btn{
	text-decoration: none;
	font-size: 20px;
	margin-left: 43%;
	font-family: serif;
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
function check(){
	if(document.frm.answer1.value.length == 0 ){
		if(document.frm.answer2.value.length != 0 || document.frm.answer3.value.length != 0 || document.frm.answer4.value.length != 0 || document.frm.answer5.value.length != 0){
			alert("1번 보기문항을 선택 안 하실 경우 주관식 문제입니다.");
			frm.answer1.focus();
			return;
		}
	}// 보기 1번이 null 값일때 and 다른 보기가 하나라도 null 값아니면 return false
	if(document.frm.answer1.value.length != 0){
		if(document.frm.answer2.value.length == 0 || document.frm.answer3.value.length == 0 || document.frm.answer4.value.length == 0 || document.frm.answer5.value.length == 0 ){
			alert("모든 보기 문항을 입력해 주세요.");
			frm.answer1.focus();
			return;
		}
	}// 1번 보기가 null 아닌경우 and 다른 보기가 하나라도 null 이면 return false
	if(document.frm.CAnswer.value.length == 0 || document.frm.question.value.length == 0){
		alert("문제 와 정답은 필수 입력 사항입니다.");
		return;
	}
	else{
		
		document.frm.submit();	
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
<div style="margin-top:3%; width:50%; margin-left:25%;">
<div>
	<form method="post" action="addQuestionJDBC.jsp" name="frm">
		<p style="margin-bottom: 20px;"><span class="q_name">problem</span></p>
		<div class="box">
			<textarea rows="6" cols="112" name="question" class="box2"></textarea> <!-- 질문이랑 정답은 not null로 자바 스크립트 생성하기 -->
		</div>
		<div>
			<ul style="padding-left: 0px;"><span class="q_name" style="">sample</span>
				<br><br>
			
				<li class="bogi">sample1 : <input type="text" name="answer1" size="100" class="box3"></li>
			
				<li class="bogi" style="margin-top:10px;">sample2 : <input type="text" name="answer2"  size="100" class="box3"></li>
	
				<li class="bogi" style="margin-top:10px;">sample3 : <input type="text" name="answer3" size="100" class="box3"></li>
				
				<li class="bogi" style="margin-top:10px;">sample4 : <input type="text" name="answer4" size="100" class="box3"></li>
	
				<li class="bogi" style="margin-top:10px;">sample5 : <input type="text" name="answer5" size="100" class="box3"></li>
		
			</ul>
		</div>
		<p>
			<span class="q_name">solution</span>
		</p>
		<p>
			<input type="text" name="CAnswer" size="100" class="box3" style="width: 100%; height : 20px;">
		</p>
		<p style="margin-bottom: 3%;">
			<span class="q_name">score</span><br><br>
			<span><input type="text" name="score" size="3">score</span>	
		</p>
			<a href="#" onclick="check(); return false" id="ok_btn">add question</a>
	</form>
</div>
</div>
<!-- -------------------------수정할부분--------------------------- -->


</body>
</html>