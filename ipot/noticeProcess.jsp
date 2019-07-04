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
	<jsp:useBean id="noti" class="Proj.NoticeEntity" scope="page"/>
	<jsp:useBean id="notidb" class="Proj.NoticeDBCP" scope="page"/>
	<%@ page import="java.util.ArrayList, Proj.NoticeEntity" %>
	<%
		String menu = request.getParameter("menu");

		if(menu.equals("insert")){%>
		
			<jsp:setProperty name="noti" property="name" param="nName"/>
			<jsp:setProperty name="noti" property="content" param="pContent"/>
			<jsp:setProperty name="noti" property="groupname" param="groupName"/>
			<jsp:setProperty name="noti" property="groupid" param="groupId"/>
			<%
			notidb.insertDB(noti);
		}
		response.sendRedirect("Notice.jsp");
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
			adminCheck("Notice.jsp");
		</script>
	</body>
</html>