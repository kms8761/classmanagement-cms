<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
			@import url("style.css");
			.button{
				width: 100%;
				background-color: #555555;
				color: white;
				padding: 14px 20px;
				margin: 8px 0;
				border: none;
				border-radius: 4px;
				cursor: pointer;
			}
			.button:hover{
				background-color: black;
			}
		</style>


<title>게시판 기본 예제 : 게시 폼 작성</title>
</head>

<!-- 파일 boardform.js : 폼의 각 입력 값이 있는지를 검토하는 함수 구현 -->
<script language=JavaScript src="boardform.js"></script>

<body>

<%String LOGINID = request.getParameter("loginId");%>
		<%String LEVEL = request.getParameter("Level");%>
		
<%@ page import="java.util.ArrayList, Proj.ClassEntity" %>
		<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
		<jsp:useBean id="probdb" class="Proj.ProblemDBCP" scope="page"/>
		<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
<ul class="topnav">
			<form name="nameForm" action="loginProcess.jsp" method="post">
				<input type="hidden" name="id" value=""/>
				<input type="hidden" name="pw" value=""/>
			</form>			
			<li><a href="Homepage1.html" onclick="mainCheck(); return false;" style="color:rgb(123,123,223); font-weight:bold;">i-pot system</a></li>
			<li class="dropdown" style="float:right">
				
				<div class="dropdown-content">
					<a onclick="logOut(); return false;">Log-Out</a>
				</div>
			</li>
		
		
		
		
		<script>
				function logOut(){
					location.replace("index.html");
				}
				function mainCheck(){
					document.nameForm.id.value = "<%=LOGINID%>";
					document.nameForm.pw.value = "<%=studdb.getPassword(LOGINID)%>";
					document.nameForm.submit();
				}
			</script>
		</ul>
		<ul class="leftnav">

			<form id="adminForm" name="adminForm" method="post" action="">
			<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
				<input type="hidden" name="Level" value="<%=LEVEL%>"/>
			</form>

			<li><a href="#" onclick="adminCheck('Problem_List.jsp'); return false;">Problem</a></li>
			<li><a href="#" onclick="adminCheck('Student_Management.jsp'); return false;">Student Management</a></li>
			<li><a href="#" onclick="adminCheck('Class_Management.jsp'); return false;">Class Management</a></li>
			<li><a href="#" onclick="adminCheck('Notice.jsp'); return false;" class="active">Notice</a></li>


</ul>
	<script>
				function adminCheck(address){
					document.adminForm.loginId.value = "<%=LOGINID%>";
					document.adminForm.Level.value = "<%=LEVEL%>";
					document.adminForm.action=address;
					document.adminForm.submit();
				}
			</script>







	<%@ page import="Proj.*" %>
	<%
		String name = ""; 
		String email = ""; 
		String title = ""; 
		String content = ""; 
		String headline = "등록";
		
		String id = request.getParameter("id");
		if (id != null) {
			//등록이 아닌 경우, 출력을 위해 선택한 게시의 각 필드 내용을 저장 
			int idnum = Integer.parseInt(id);
			BoardDBCP brddb = new BoardDBCP(); 
			BoardEntity brd = brddb.getBoard(idnum);
			name = brd.getName();
			email = brd.getEmail();
			title = brd.getTitle();
			content = brd.getContent();
			headline = "수정 삭제";
		};
	%>



<center><form name=boardform method=post action="processboard.jsp" >
<!-- menu : 등록, 수정 또는 삭제 구분을 위한 매개변수로 이용 -->
<input type=hidden name="menu" value="insert">
<!-- 수정 또는 삭제를 위한 게시 id를 hidden으로 전송 -->
<input type=hidden name="id" value=<%=id %>>

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
		     <td width=50>name </td>
		     <td width=100>
				<input type=text name=name value="<%=name%>" size=30 maxlength=20></td>
		     
		    </tr>	
			<tr >
		     <td width=50>title </td>
		     <td colspan=3>
				<input type=text name=title size=80 value="<%=title%>" maxlength=100></td>
			</tr>
		</table>
	</td> </tr>

    <tr><td colspan=2>
    content
			<textarea name=content rows=10 cols=90><%=content%></textarea></td></tr>
	<tr>
     <td colspan=2>department
	     <input type=password name=passwd size=20 maxlength=15><font color=red>  
         </font></td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
		<% if (id == null) { %>
		       	<!-- 버튼을 누르면 boardform.js의 함수를 실행하여 processboard.jsp로 이동 -->
		 		<input type=button value="apply" onClick="insertcheck()">
		<% } else { %>
		       	<!-- 버튼을 누르면 boardform.js의 각 함수를 실행하여 processboard.jsp로 이동 -->
		  		<input type=button value="finish" onClick="updatecheck()">
		    	<input type=button value="delete" onClick="deletecheck()"> 
		<% } %>
		<!-- 목록보기 버튼은 listboard.jsp로 이동 -->
		<input type=button value="목록보기" onClick="location.href='editboard.jsp'"> 
      	<input type=reset value="취소"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>

</form>
</center>

</body>
</html>
