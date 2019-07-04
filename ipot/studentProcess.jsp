<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style type="text/css">
			@import url("style.css");
		</style>
		<title>Admin Page</title>
	</head>
	<body>
	<%String LOGINID = request.getParameter("loginId");%>
	<%String LEVEL = request.getParameter("Level");%>
	<%
		if(LOGINID == null || LEVEL== null){
			response.sendRedirect("adminError.jsp");
		}
		%>
	<%@ page import="java.util.ArrayList, Proj.ClassEntity" %>
	<jsp:useBean id="stud" class="Proj.StudentEntity" scope="page"/>
	<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
	<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
	<%
		String menu = request.getParameter("menu");
		String sId = request.getParameter("sId");
		String level = request.getParameter("level");
		if(menu.equals("delete")){
			String newMem = "";
			ArrayList<ClassEntity> cList = clasdb.getClassList();
			for(ClassEntity clas : cList) {
				String[] memArray = clas.getMembers().split(" ");
				newMem = "";
				for(String mem : memArray){
					if(!sId.equals(mem)){
						newMem += mem;
						newMem += " ";
					}
				}
				clasdb.editMember(String.valueOf(clas.getId()), newMem);
			}

			studdb.deleteSid(sId);
			studdb.deleteScoreDB(sId);
		}
		else if(menu.equals("insert")){%>
			<jsp:setProperty name="stud" property="id" param="Id"/>
			<jsp:setProperty name="stud" property="password" param="password"/>
			<jsp:setProperty name="stud" property="studentid" param="sId"/>
			<jsp:setProperty name="stud" property="name" param="sName"/>
			<jsp:setProperty name="stud" property="level" param="level"/>
			<jsp:setProperty name="stud" property="phone" param="phone"/>
			<jsp:setProperty name="stud" property="email" param="email"/>
		<%
		studdb.insertDB(stud);
		studdb.insertScoreDB(stud.getStudentid());
		}
	%>
	
	<form id="adminForm" name="adminForm" method="post" action="">
		<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
		<input type="hidden" name="Level" value="<%=LEVEL%>"/>
	</form>
	
	<script>
		function adminCheck(address){
			document.adminForm.loginId.value = "<%=LOGINID%>";
			document.adminForm.Level.value = "<%=LEVEL%>";
			document.adminForm.action=address;
			document.adminForm.submit();
		}
		adminCheck("index.html");
	</script>
	</body>
</html>