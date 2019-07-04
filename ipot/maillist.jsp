<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "Proj.*" %>
<%@ page import="java.sql.*" %>
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
ul{   margin : 0px;
   padding : 0px;}
li>a{display : block;text-decoration: none;}
li>a:HOVER, li>a:FOCUS{
   color: white;
   background-color: #f40;
   border: 1px solid #f40;
   border-radius: 7px;
}
li{
   padding-top:10px;
   display:inline-block;
   width : 16%;
   height : 30px;
   text-align:center;
   font-size : 25px;
   margin-right : 3%;
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
#write_btn{
	text-decoration: none;
	margin-left : 92%;
	font-family: arial;
}
.pagenum{
	margin-left : 50%;
}
#mailphoto{
	width: 250px;
	height : 250px;
	margin-left : 35%;
}
#table{
	text-align: center;

}
#mailicon{
	width : 30px;
	height : 30px;
	position : relative;
	top : -613px;
	left : 685px;

}
#img{
	position: relative;
	top : -613px;
	left : 685px;

}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(document).ready(function(){

});


</script>
</head>
<body>
<%
   
   String u_id = (String)session.getAttribute("ID");
   if(u_id==null){
      response.sendRedirect("../index.html");
   }
   int l_id = Integer.parseInt(request.getParameter("l_id"));
   LectureDAO ldao = new LectureDAO();
   String l_name = ldao.getLectureName(l_id);
   
   
   DAO dao = new DAO();
   boolean isInstructor = dao.isInstructor(u_id);
   
%>
<div id="main">
   <div id="Main_bar">
      <div style="float:left" id="logo">
         <span><a href="../GroupSelect.jsp" style="text-decoration: none; color: white;">CMS</a></span><img src="../img/Mainlogo4.jpg" width="30" height="30">
      </div>
      <div style="float:right" id="Userbar">
         <span><%=u_id%> 님 |</span><!-- 로그인  상태뜨는곳 -->
         <span><a href="../userUpdate/InfoUpdateDp.jsp" style="text-decoration: none;color:white;" >회원정보 수정 | </a></span>
         <span><a href="../Login/Logout.jsp"style="text-decoration: none;color:white;" >로그아웃 </a></span>
      </div>
   </div>
   <div id="main_title"><%=l_name%></div>
</div>
<div id="bar">
   <ul id="menu_bar" name="menu_bar">
      <li><a href="../Lecture/Lecture.jsp?l_id=<%=l_id%>">공지사항</a></li>
      <li><a href="maillist.jsp?l_id=<%=l_id%>">메일함</a></li>
      <li><a href="#">성적관리</a></li>
      <%if(isInstructor){%>
   	   <li><a href="../test/questionlist.jsp?l_id=<%=l_id%>">시험</a></li>
      <%}else{%>
    	<li><a href="../test/testStart.jsp?l_id=<%=l_id%>">시험</a></li>
      <%} %>
      <li><a href="../fileUpload/uploadBoardlist.jsp?l_id=<%=l_id%>">자료실</a></li>
   </ul>
</div>
<!-- ---------------------====------수정할부분 =================--------- -->
<div style="width : 60%; margin-left : 20%; margin-top : 2%;">
	<div>
	<center></center>
	<img src="../img/mail.png" id="mailphoto">
	</div>
	<div style="margin-top:30px;">
		<form id = "GoBoard" action="writeMail.jsp?l_id=<%=l_id%>" method="post">
			<a href="#" onclick="document.getElementById('GoBoard').submit();" id="write_btn">메일쓰기</a>
		</form>
	</div>
	<table border="0" id="table" style="width : 100%">
		<tr style="background-color :#87CEFA; font-size: 18px;" id="th">
			<td style="width:60%; border-right: 1px solid white;">제목</td>
			<td style="width:20%; border-right: 1px solid white;">보낸 사람</td>
			<td style="width:20%; border-right: 1px solid white;">시간</td>
		</tr>
		
		<% 
			request.setCharacterEncoding("EUC-KR");
	
			String pageNum_temp = request.getParameter("pageNum");
			int pageNum=1;
			
			if(pageNum_temp != null){
				pageNum = Integer.parseInt(pageNum_temp);
			}
			
			MailBoardDAO mdao = new MailBoardDAO();
        	int pagePerNum = 10; //한 페이지에 10개씩
        	ResultSet mrs = mdao.showMyMail(l_id, u_id, (pageNum-1) * pagePerNum, pagePerNum);
        	boolean isHit = mdao.isHit(l_id, u_id);
        	int p_cnt = mdao.mail_count(l_id, u_id); //전체 글 갯수
			int m_num = (p_cnt+1) - ((pageNum-1) * pagePerNum); //글번호 재 설정
				if(!isHit){
			%>
				<script>
				$("#table").css("margin-top","-120px");
				</script>
			<%
			%>
				<div id="mailicon">
				<img src="../img/mailicon.JPG" id="mailimg">
				</div>
				<img src="../img/bol.JPG" id="img">
			<%
				}
			while(mrs.next()){
				int m_id = mrs.getInt("m_id");
				String send_id = mrs.getString("send_id");
				String title = mrs.getString("title");
				String time = mrs.getString("time");
				String ishit = mrs.getString("ishit");
		%>
				<tr style="font-size:19px;">
					<td><a style="text-decoration: none;"href="showMail.jsp?m_id=<%=m_id%>&l_id=<%=l_id%>"><%=title%></a></td>
					<td><%=send_id%></td>
					<td><%=time %></td>
				</tr>
		<%
			}
		%>
			</table>
			<div style="width : 100%; margin-top:2%;">
		<%	
			int PageBlock = 10; //페이징 블럭 갯수 (10개씩)
	        int pageCount = p_cnt / pagePerNum + (p_cnt % pagePerNum == 0 ? 0 : 1); //페이징 개수 전체 카운트 2
	        int startPage = (PageBlock * ((pageNum - 1) / PageBlock)) + 1; //시작페이지 1
	        int endPage = startPage + (PageBlock - 1); //끝페이지 10
	        String temp = null;
	        if (pageCount < endPage)
	        	endPage = pageCount; //마지막 페이지가 전체 페이징 개수 보다 크면 값을 같게 한다.
	        if (startPage > PageBlock) { //시작 페이지가 블럭갯수보다 크면 [이전] 버튼 생성
	        	temp = Integer.toString(startPage - 1);
	    %>
	   	<a href="maillist.jsp?l_id=<%=l_id%>&pageNum=<%=temp%>">[이전]</a>
	   	<%
	        }
	        for (int i = startPage; i <= endPage; i++) { //현재 페이지이면 링크 없애는 기능
	        	if (pageNum == i) { //시작페이지가 현재 페이지와 같으면
	    %>
	    <span class="pagenum">[<%=i%>]</span>
	    <!-- 링크를 없앤다. -->
	    <%
	         	} else {
	         		temp = Integer.toString(i);
	    %>
	      <!-- 만악 다르면 -->
	      <a href="maillist.jsp?l_id=<%=l_id%>&pageNum=<%=temp%>" class="pagenum">[<%=i%>]</a>
	      <!-- 링크를 걸어준다. -->
	      <%
	         	}
	        }
	        if (endPage < pageCount) { //마지막 페이지보다 전체 페이징 개수가 크면
	        	temp = Integer.toString(startPage + PageBlock);
	      %>
	     	 <a href="maillist.jsp?l_id=<%=l_id%>&pageNum=<%=temp%>" class="pagenum">[다음]</a>
	      	</div>
	      <!-- 다음 페이지를 보여준다. -->
	      <%
	        }
		%>
</div>
</div>
 <!-- --------------------------------수정할 부분----------------------------- -->
 <div id="footer" style="width:80%; margin-left:10%;">
      <div>
         <span><img src="../img/faceb.jpg" class="foot_img" style="margin-left:10px;"></span>
         <span><img src="../img/insta.png" class="foot_img"></span>
         <span><img src="../img/twit.jpg" class="foot_img"></span>
         <span><img src="../img/chonb.jpg" class="foot_img"></span>
      </div>   
      <div style="text-align: center; font-family: arial,Sans-serif; margin-top: 15px;">
         <p>
         책임자 : Hong Dong Uk, Park Seong Min<br>
         연락처 : 010-8669-0448 , 010-4188-3512   
         </p>
         <p>
         이용약관 개인정보처리방침<br>
         Copyright ⓒ CMS
         </p>
      </div>
 </div>
</body>
</html>