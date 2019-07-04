<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀</title>
</head>

<style>
ul{width:100%;height:30px;background:black;list-style:none;padding-top:15px}
ul li{float:left;margin-right:10px;font-family:dotum}
ul li a{font-size:12px;color:white;font-weight:bold;text-decoration:none}
</style>

<script language=JavaScript src="make_test.js"></script>

<body>

	<%@ page import="Proj.*" %>
	<%
		String name = ""; 
		String answer = ""; 
		String question_score = ""; 
		String question = "";
		String score = "";
		String open_multi = "";
		String headline = "시험 문제 입력 페이지";
		
		String id = request.getParameter("id");
		if (id != null) {
			int idnum = Integer.parseInt(id);
			Test_DBCP tstdb = new Test_DBCP(); 
			Test_Entity tst = tstdb.getTest(idnum);
			name = tst.getName();
			answer = tst.getAnswer();
			question_score = tst.getQuestion_score();
			question = tst.getQuestion();
			score = tst.getScore();
			open_multi = tst.getOpen_multi();
			headline = "시험 문제 입력 페이지";
		};
	%>
	
<ul>
<li><a href="#">notice</a></li>
<li><a href="#">test</a></li>
<li><a href="#">mail</a></li>
<li><a href="#">myaccount</a></li>
</ul>
<hr width=100%>
<h2><center><%=headline %></h2> <hr>

<center><form name=testform method=post action="process_test.jsp" >
<input type=hidden name="menu" value="insert">
<input type=hidden name="id" value=<%=id %>>

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
		     <td width=50>시험 이름 : </td>
		     <td width=100>
				<input type=text name=name value="<%=name%>" size=30 maxlength=20></td>
		     </tr>
		     <tr>
		     <td width=80>문제 배점 :</td>
		     <td width=100>
				<input type=text name=question_score size=30 value="<%=question_score%>" maxlength=30></td>
		    </tr>	
		</table>
	</td> </tr>
	<tr>
	<td>문제 내용</td>
	<tr>

    <tr><td colspan=2>
    		
			<textarea name=question rows=10 cols=90 value="<%=question%>"></textarea></td></tr>
	<tr>
     <td colspan=2>정답 설정 :
	     <input type=text name=answer value="<%=answer%>" size=20 maxlength=15> 
     </td>
    </tr>
    <tr>
    	<td>
    	<input type=radio name=open_multi value="<%=open_multi="open" %>" checked> 주관식
    	<input type=radio name=open_multi value="<%=open_multi="multi" %>"> 객관식
    	</td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
		<% if (id == null) { %>
		 		<input type=button value="제출" onClick="insertcheck()">
		<% } else { %>
		  		<input type=button value="수정" onClick="updatecheck()">
		    	<input type=button value="삭제" onClick="deletecheck()"> 
		<% } %>
		<input type=button value="목록" onClick="location.href='play_test.jsp'"> 
      	<input type=reset value="취소"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>

</form>
</center>

<hr width=100%>

</body>
</html>
