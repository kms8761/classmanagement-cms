<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �⺻ ���� : �Խ� �� �ۼ�</title>
</head>

<!-- ���� boardform.js : ���� �� �Է� ���� �ִ����� �����ϴ� �Լ� ���� -->
<script language=JavaScript src="boardform.js"></script>

<body>

	<%@ page import="Proj.*" %>
	<%
		String name = ""; 
		String email = ""; 
		String title = ""; 
		String content = ""; 
		String headline = "���";
		
		String id = request.getParameter("id");
		if (id != null) {
			//����� �ƴ� ���, ����� ���� ������ �Խ��� �� �ʵ� ������ ���� 
			int idnum = Integer.parseInt(id);
			BoardDBCP brddb = new BoardDBCP(); 
			BoardEntity brd = brddb.getBoard(idnum);
			name = brd.getName();
			email = brd.getEmail();
			title = brd.getTitle();
			content = brd.getContent();
			headline = "���� ����";
		};
	%>

<h2>��������</h2> <hr>

<center><form name=boardform method=post action="processboard.jsp" >
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ���� �Ǵ� ������ ���� �Խ� id�� hidden���� ���� -->
<input type=hidden name="id" value=<%=id %>>

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
		     <td width=50>�� �� : </td>
		     <td width=100>
				<input  name=name value="<%=name%>" size=30 maxlength=20></td>
		     <td width=80>���ڸ��� :</td>
		     <td width=100>
				<input type=text name=email size=30 value="<%=email%>" maxlength=30></td>
		    </tr>	
			<tr >
		     <td width=50>�� �� : </td>
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
	
		<!-- ��Ϻ��� ��ư�� listboard.jsp�� �̵� -->
		<input type=button value="��Ϻ���" onClick="location.href='listboard.jsp'"> 
      	<input type=reset value="���"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>

</form>
</center>

</body>
</html>
