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
li{
   padding-top:10px;
   display:inline-block;
   width : 16%;
   height : 30px;
   text-align:center;
   font-size : 25px;
   margin-right : 3%;
   padding-bottom: 10px;

}
#board_title{
   background-image: url("../img/2.JPG");
   background-repeat: repeat-x;
   border : 1px solid    #DCDCDC;
   border-bottom: 2px solid #00BFFF;
   height:21px;
   padding-top:7px;
   padding-left:20px;

}
#list_btn{
   float: left;
   margin-top: 5%;
   margin-left: 40%;
   margin-right: 20px;
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

#test_rule_list>li{
	text-align : justify;
	display : block;
	width : 100%;
	font-size : 15px;
	font-family: sans-serif;

}
#test_table{
	width : 100%;
	margin-top : -24px;
	border : 1px solid 	#D3D3D3;
}
#test_start_btn{
	position : relative;
	text-decoration: none;
	top : -50px;
	left : 25%;
	font-size : 27px;
	color : black;
	font-family: serif;	

}
#add_btn{
	position : relative;
	font-size : 27px;
	top : -80px;
	left : 40%;
	text-decoration: none;
	display : block;
	font-family: serif;
}
#cancel_btn{
	position : relative;
	font-size : 27px;
	top : -110px;
	left : 56%;
	text-decoration: none;
	display : block;
	font-family: serif;
}
.table_td{
	border-right: 1px solid #D3D3D3;
	border-bottom: 1px solid #D3D3D3;
}
.pagenum{
	top : 580px;
	left : 300px;
	position: relative;
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
function cancel(){
	alert("진행중인 시험이 종료 됐습니다.");
}
</script>
</head>
<body>

<div id="main">
   <div id="Main_bar">
      <div style="float:left" id="logo">
         <span><a href="../index.html" style="text-decoration: none; color: white;">CMS</a></span><img src="../img/Mainlogo4.jpg" width="30" height="30">
      </div>
      <div style="float:right" id="Userbar">
       
         <span><a href="../userUpdate/InfoUpdateDp.jsp" style="text-decoration: none;color:white;" >회원정보 수정 | </a></span>
         <span><a href="../Login/Logout.jsp"style="text-decoration: none;color:white;" >로그아웃 </a></span>
      </div>
   </div>
   
</div>
<div id="bar">
 
</div>

<!-- -------------------------수정할부분--------------------------- -->
<div style="margin-top:5%; width:60%; margin-left:20%;">
	<div style=" margin-bottom: 11%;">
		<hr width="820">
		<p id="test_rule" >
			<div style="float : left">
			<span style="margin-left: 38%; font-weight: bold">※시험 규칙※ </span>
			<ul id="test_rule_list">
				<li>1. 시험 문제는 주관식, 객관식 출제가 가능합니다.</li>
				<li>2. 주관식 경우 문제 생성시 보기를 선택하지 않으시면 됩니다.</li>
				<li>3. 객관식의 경우 5지 선다형만 가능합니다.</li>
				
				<li>4. 시험 시작을 원하실 경우 한 문제 이상을 체크해 주십시오.</li>
			</ul>
			</div>
			<img src = "../img/bus.jpg" width="300" height="300" style="margin-left : 8%;">
		</p>
		<hr width="820">
	</div>




<%@ page import="java.util.ArrayList, Proj.testDAOEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="brddb" class="Proj.TestDAO" scope="page" />


<% 
		//게시 목록을 위한 배열리스트를 자바진즈를 이용하여 확보 
		ArrayList<testDAOEntity> list = brddb.gettestDAOList(); 
	   	int counter = list.size();
	   	int row = 0;
	   	System.out.println("l");
	   	if (counter > 0) {
	%>
	System.out.println("l");
	<table width=800 border=0 cellpadding=1 cellspacing=3>
 <tr>
       <th><font color=blue><b>번호</b></font></th>
       <th><font color=blue><b>제목</b></font></th>
       <th><font color=blue><b>작성자</b></font></th>
       <th><font color=blue><b>작성일</b></font></th>
       <th><font color=blue><b>전자메일</b></font></th>
    </tr>
<%
		//게시 등록일을 2010-3-15 10:33:21 형태로 출력하기 위한 클래스 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for( testDAOEntity brd : list ) {
			//홀짝으로 다르게 색상 지정
			String color = "papayawhip";
			if ( ++row % 2 == 0 ) color = "white"; 
	%>
    <tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='SkyBlue'"
    	onmouseout="this.style.backgroundColor='<%=color %>'">
		<!-- 수정과 삭제를 위한 링크로 id를 전송 -->
		
       <td align=center><a href="editboard1.jsp?id=<%= brd.getContent()%>"><%= brd.getContent()%></a></td>
       <td align=left><%= brd.getAnswer1() %></td>
       <td align=center><%= brd.getAnswer2() %></td>
		<!-- 게시 작성일을 2010-3-15 10:33:21 형태로 출력 -->
       <td align=center><%= df.format(brd.getAnswer3()) %></td>
       <td align=center><%= brd.getAnswer4() %></td>
       <td align=center><%= brd.getAnswer5() %></td>
       <td align=center><%= brd.getScore() %></td>
    </tr>
	<%
	    }
	%>
	</table>
<% 	}
%>

			
				<a href="#" onclick="check(); return false" id="test_start_btn">시험시작</a>
			</form>

	
	
	<a href="questionlist.jsp" class="pagenum">[다음]</a>
	<!-- 다음 페이지를 보여준다. -->   
	
	<a href="addQuestion.jsp" id="add_btn">문제 추가</a>
	<a href="quitTest.jsp>" id="cancel_btn" onclick="cancel();">시험종료</a>
	
</table>
</div>



<!-- -------------------------수정할부분--------------------------- -->


</body>
</html>