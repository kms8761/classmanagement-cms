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
ul{   margin : 0px;
   padding : 0px;}
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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">



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
   LectureDAO ldao = new LectureDAO();
   String l_name = ldao.getLectureName(l_id);
   
   
   DAO dao = new DAO();
   boolean isInstructor = dao.isInstructor(u_id);
%>
<div id="main">
   <div id="Main_bar">
      <div style="float:left" id="logo">
         <span><a href="../index.html" style="text-decoration: none; color: white;">CMS</a></span><img src="../img/Mainlogo4.jpg" width="30" height="30">
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
      <li><a href="../Lecture/Lecture.jsp?l_id=<%=l_id%>")>공지사항</a></li>
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

<!-- -------------------------수정할부분--------------------------- -->
<div style="margin-top:5%; width:60%; margin-left:20%;">
<%
   int m_id = Integer.parseInt(request.getParameter("m_id"));
   String my_id = (String)session.getAttribute("ID");
   if(my_id == null){
      response.sendRedirect("../index.html");
   }   
   MailBoardDAO mbdao = new MailBoardDAO();
   mbdao.updateIsHit(m_id);
   ResultSet mrs = mbdao.showOne(m_id); //m_id에 해당하는 메일을 불러옴
   
   while(mrs.next()){   
      String title = mrs.getString("title");
      String context = mrs.getString("context");
      String send_id = mrs.getString("send_id");
      String time = mrs.getString("time");
%>
   <div id="board_title">제목 : <%=title %></div>
   <div style="height:30px; border-bottom:1px solid #DCDCDC;">
      <div style="float : right">
         <span>보낸 사람 : <%=send_id %></span>
         <span>보낸 날짜 : <%=time %></span>
      </div>
   </div>
   <div style="height:250px; border-bottom:1px solid #DCDCDC;">
      <span><%=context %></span>
   </div>
<%   
   }
%>
   <div>
   		<form id = "GoBoard" action="maillist.jsp?l_id=<%=l_id %>" method="post">
        	 <input type="button" value="목록" onclick="document.getElementById('GoBoard').submit();" id="list_btn">
      	</form>
        <form id = "GoDelete" action="deleteMail.jsp?m_id=<%=m_id%>&l_id=<%=l_id %>" method="post">
             <input type="button" value="삭제" onclick="document.getElementById('GoDelete').submit();" style="margin-top: 5%;">
        </form>
      <%
         //}
      %>
   </div>
</div>
<!-- -------------------------수정할부분--------------------------- -->

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