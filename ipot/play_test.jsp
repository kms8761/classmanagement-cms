<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>타이틀</title>
</head>
<body>
<h2>시험 보는 웹페이지</h2>
<hr>
<center>

	<%@ page import="java.util.ArrayList, Proj.Test_Entity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="tstdb" class="Proj.Test_DBCP" scope="page" />
	<% 
		ArrayList<Test_Entity> list = tstdb.getTestList(); 
	   	int counter = list.size();
	   	int row = 0;
	   	String open_multi = "";
	   	if (counter > 0) {
	%>
    <table width=800 border=0 cellpadding=1 cellspacing=3>
    
    <tr>
       <th><font color=blue><b>번호</b></font></th>
       <th><font color=blue><b>문제 내용</b></font></th>
       <th><font color=blue><b>문제 배점</b></font></th>
       <th><font color=blue><b>정답 선택</b></font></th>
    </tr>
	<%
		for( Test_Entity tst : list ) {
			String color = "papayawhip";
			if ( ++row % 2 == 0 ) color = "white"; 
	%>
    <tr>
       <td align=center><%= tst.getId()%></a></td>
       <td align=left><%= tst.getQuestion() %></td>
       <td align=center><%= tst.getQuestion_score() %></td>
       <% open_multi = tst.getOpen_multi();
       if(open_multi.equals("multi")){%>
    		<td>
    		<input type=radio name=answer value="1" checked> 1
    		<input type=radio name=answer value="2"> 2
    		<input type=radio name=answer value="3"> 3
    		<input type=radio name=answer value="4"> 4
    		<input type=radio name=answer value="5"> 5
    		</td>
       <%}else if(open_multi.equals("open")){%>
       <td align=center><input type=text name=answer size=30 value="" maxlength=30></td>
       <%}%>
    </tr>
	<%
	    }
	%>
	</table>
<% 	}
%>

<hr width=90%>
<p>목록 갯수 <%=counter%>.
</center><hr>
<center>
<form name=form method=post action=DB_Input.jsp>
      <input type=submit value="버튼"> 
</form>

</form>
</center>

</body>
</html>
