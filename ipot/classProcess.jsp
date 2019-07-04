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

	<jsp:useBean id="clas" class="Proj.ClassEntity" scope="page"/>
	<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
	<jsp:useBean id="notidb" class="Proj.NoticeDBCP" scope="page"/>

	<%
		String menu = request.getParameter("menu");
		String id = request.getParameter("id");
		if(menu.equals("delete")){
			clasdb.deleteId(id);
			clasdb.deleteTable(id);
			notidb.deleteClass(id);
		}
		else if(menu.equals("insert")){%>
			<jsp:setProperty name="clas" property="number" param="cNum"/>
			<jsp:setProperty name="clas" property="name" param="cName"/>
			<jsp:setProperty name="clas" property="members" param="members"/>
			<jsp:setProperty name="clas" property="instructor" value="<%=LOGINID%>"/>
	<%
		String autoKey = clasdb.insertDB(clas);
		clasdb.makeClassTable(autoKey);
		}
		//response.sendRedirect("Class_Management.jsp");
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
		adminCheck("Class_Management.jsp");
	</script>
	</body>
</html>