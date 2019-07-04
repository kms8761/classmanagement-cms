<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 기본 예제 : 게시 폼 작성</title>
</head>

<!-- 파일 boardform.js : 폼의 각 입력 값이 있는지를 검토하는 함수 구현 -->
<script language=JavaScript src="boardform.js"></script>

<body>

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

<h2>공지사항</h2> <hr>

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
		     <td width=50>이 름 : </td>
		     <td width=100>
				<input  name=name value="<%=name%>" size=30 maxlength=20></td>
		     <td width=80>전자메일 :</td>
		     <td width=100>
				<input type=text name=email size=30 value="<%=email%>" maxlength=30></td>
		    </tr>	
			<tr >
		     <td width=50>제 목 : </td>
		     <td colspan=3>
				<input type=text name=title size=80 value="<%=title%>" maxlength=100></td>
			</tr>
		</table>
	</td> </tr>

    <tr><td colspan=2>
			<textarea name=content rows=10 cols=90><%=content%></textarea></td></tr>
	<tr>
     
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
	
		<!-- 목록보기 버튼은 listboard.jsp로 이동 -->
		<input type=button value="목록보기" onClick="location.href='listboard.jsp'"> 
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
