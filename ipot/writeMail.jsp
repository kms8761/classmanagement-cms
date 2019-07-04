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
   margin-top: 3%;
   font-size: 40px;
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

#footer{
   margin-top : 10%;   
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
.table_data{
   width: 40px;
   font-weight : bold;
}
#write_board_title{
   border : 1px solid white;
   border-bottom: 1px solid gray;
} 
ol,li{
display:inline-block;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
   function check() {
      if (document.writeform.title.value == "") {
             alert("제목을 입력하세요");
             return false;
      }
      if (document.writeform.main.value == "") {
             alert("내용을 입력하세요");
             return false;
      }
   }
</script>
</head>
<body>
<%
   
   String u_id = (String)session.getAttribute("ID");
   if(u_id==null){
      response.sendRedirect("../index.html");
   }
   int l_id = Integer.parseInt(request.getParameter("l_id"));
   DAO dao = new DAO();
   LectureDAO ldao = new LectureDAO();
   boolean isInstructor = dao.isInstructor(u_id);
   String id = "";
   ResultSet rs = null;
   if(isInstructor){
	   rs = dao.getStudentAllName(l_id);
   }else{
	   rs = ldao.getInstructorId(l_id);
	   rs.next();
	   id = rs.getString("i_id");
	   rs.beforeFirst();
   }
   
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
   <div id="main_title">C M S</div>
</div>
<div id="bar">
   <ul id="menu_bar" name="menu_bar">
      <li><a href="../Lecture/Lecture.jsp?l_id=<%=l_id%>">공지사항</a></li>
      <li><a href="">메일함</a></li>
      <li><a href="#">성적관리</a></li>
      <li><a href="#">시험</a></li>
      <li><a href="#">기능보류</a></li>
   </ul>
</div>

<div style="margin-top:5%; width:80%; margin-left:10%">
   <form action="writeMailJDBC.jsp?l_id=<%=l_id%>"  method="post" name="writeform" onSubmit="return check()">
      <div style="width:100%; margin-left: 18%;">
         <div style="margin-bottom: 20px;">
            <span class="table_data">제목</span>
            <span><input type="text" name="title" size="113" maxlength="30" id="write_board_title"></span>
         </div>
         <div style="margin-bottom: 20px;">
            <span class="table_data">받는 사람</span>
            <span>
            <%while(rs.next()){ 
            	if(isInstructor){
            %>	
            		<%=rs.getString("s_name")%><input type="checkbox" name="member" value="<%=rs.getString("s_name")%>">	
            <%
            	}else{
			%>
					<%=id%><input type="checkbox" name="member" value="<%=id%>">
            <%
            	}
           	 }
            %>
            </span>
         </div>
         <div height="">
            <span class="table_data" style="display:inline-block;">   내용</span>
            <div><textarea rows="20" cols="120" name="main" maxlength="300" style="margin"></textarea></div>
         </div>
      </div>
      <input type="submit" value="보내기" style="float:left; margin-left:45%; margin-top: 5%; margin-right: 30px;">
   </form>
   <form id = "GoBoard" action="../Lecture/Lecture.jsp?l_id=<%=l_id%>" method="post">
      <input type="button" value="취소" onclick="document.getElementById('GoBoard').submit();" style="margin-top:5%;">
   </form>
</div>

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