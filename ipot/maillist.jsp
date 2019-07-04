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
         <span><%=u_id%> �� |</span><!-- �α���  ���¶ߴ°� -->
         <span><a href="../userUpdate/InfoUpdateDp.jsp" style="text-decoration: none;color:white;" >ȸ������ ���� | </a></span>
         <span><a href="../Login/Logout.jsp"style="text-decoration: none;color:white;" >�α׾ƿ� </a></span>
      </div>
   </div>
   <div id="main_title"><%=l_name%></div>
</div>
<div id="bar">
   <ul id="menu_bar" name="menu_bar">
      <li><a href="../Lecture/Lecture.jsp?l_id=<%=l_id%>">��������</a></li>
      <li><a href="maillist.jsp?l_id=<%=l_id%>">������</a></li>
      <li><a href="#">��������</a></li>
      <%if(isInstructor){%>
   	   <li><a href="../test/questionlist.jsp?l_id=<%=l_id%>">����</a></li>
      <%}else{%>
    	<li><a href="../test/testStart.jsp?l_id=<%=l_id%>">����</a></li>
      <%} %>
      <li><a href="../fileUpload/uploadBoardlist.jsp?l_id=<%=l_id%>">�ڷ��</a></li>
   </ul>
</div>
<!-- ---------------------====------�����Һκ� =================--------- -->
<div style="width : 60%; margin-left : 20%; margin-top : 2%;">
	<div>
	<center></center>
	<img src="../img/mail.png" id="mailphoto">
	</div>
	<div style="margin-top:30px;">
		<form id = "GoBoard" action="writeMail.jsp?l_id=<%=l_id%>" method="post">
			<a href="#" onclick="document.getElementById('GoBoard').submit();" id="write_btn">���Ͼ���</a>
		</form>
	</div>
	<table border="0" id="table" style="width : 100%">
		<tr style="background-color :#87CEFA; font-size: 18px;" id="th">
			<td style="width:60%; border-right: 1px solid white;">����</td>
			<td style="width:20%; border-right: 1px solid white;">���� ���</td>
			<td style="width:20%; border-right: 1px solid white;">�ð�</td>
		</tr>
		
		<% 
			request.setCharacterEncoding("EUC-KR");
	
			String pageNum_temp = request.getParameter("pageNum");
			int pageNum=1;
			
			if(pageNum_temp != null){
				pageNum = Integer.parseInt(pageNum_temp);
			}
			
			MailBoardDAO mdao = new MailBoardDAO();
        	int pagePerNum = 10; //�� �������� 10����
        	ResultSet mrs = mdao.showMyMail(l_id, u_id, (pageNum-1) * pagePerNum, pagePerNum);
        	boolean isHit = mdao.isHit(l_id, u_id);
        	int p_cnt = mdao.mail_count(l_id, u_id); //��ü �� ����
			int m_num = (p_cnt+1) - ((pageNum-1) * pagePerNum); //�۹�ȣ �� ����
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
			int PageBlock = 10; //����¡ �� ���� (10����)
	        int pageCount = p_cnt / pagePerNum + (p_cnt % pagePerNum == 0 ? 0 : 1); //����¡ ���� ��ü ī��Ʈ 2
	        int startPage = (PageBlock * ((pageNum - 1) / PageBlock)) + 1; //���������� 1
	        int endPage = startPage + (PageBlock - 1); //�������� 10
	        String temp = null;
	        if (pageCount < endPage)
	        	endPage = pageCount; //������ �������� ��ü ����¡ ���� ���� ũ�� ���� ���� �Ѵ�.
	        if (startPage > PageBlock) { //���� �������� ���������� ũ�� [����] ��ư ����
	        	temp = Integer.toString(startPage - 1);
	    %>
	   	<a href="maillist.jsp?l_id=<%=l_id%>&pageNum=<%=temp%>">[����]</a>
	   	<%
	        }
	        for (int i = startPage; i <= endPage; i++) { //���� �������̸� ��ũ ���ִ� ���
	        	if (pageNum == i) { //������������ ���� �������� ������
	    %>
	    <span class="pagenum">[<%=i%>]</span>
	    <!-- ��ũ�� ���ش�. -->
	    <%
	         	} else {
	         		temp = Integer.toString(i);
	    %>
	      <!-- ���� �ٸ��� -->
	      <a href="maillist.jsp?l_id=<%=l_id%>&pageNum=<%=temp%>" class="pagenum">[<%=i%>]</a>
	      <!-- ��ũ�� �ɾ��ش�. -->
	      <%
	         	}
	        }
	        if (endPage < pageCount) { //������ ���������� ��ü ����¡ ������ ũ��
	        	temp = Integer.toString(startPage + PageBlock);
	      %>
	     	 <a href="maillist.jsp?l_id=<%=l_id%>&pageNum=<%=temp%>" class="pagenum">[����]</a>
	      	</div>
	      <!-- ���� �������� �����ش�. -->
	      <%
	        }
		%>
</div>
</div>
 <!-- --------------------------------������ �κ�----------------------------- -->
 <div id="footer" style="width:80%; margin-left:10%;">
      <div>
         <span><img src="../img/faceb.jpg" class="foot_img" style="margin-left:10px;"></span>
         <span><img src="../img/insta.png" class="foot_img"></span>
         <span><img src="../img/twit.jpg" class="foot_img"></span>
         <span><img src="../img/chonb.jpg" class="foot_img"></span>
      </div>   
      <div style="text-align: center; font-family: arial,Sans-serif; margin-top: 15px;">
         <p>
         å���� : Hong Dong Uk, Park Seong Min<br>
         ����ó : 010-8669-0448 , 010-4188-3512   
         </p>
         <p>
         �̿��� ��������ó����ħ<br>
         Copyright �� CMS
         </p>
      </div>
 </div>
</body>
</html>