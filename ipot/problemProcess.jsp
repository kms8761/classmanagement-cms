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
	<jsp:useBean id="prob" class="Proj.ProblemEntity" scope="page"/>
	<jsp:useBean id="probdb" class="Proj.ProblemDBCP" scope="page"/>
	<jsp:useBean id="submitProc" class="Proj.SubmitProcess" scope="page"/>
	<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
	<%@ page import="java.util.ArrayList, Proj.ProblemEntity, Proj.ClassEntity" %>
	
	<%String LOGINID = request.getParameter("loginId");%>
	<%String LEVEL = request.getParameter("Level");%>
	<%
		String menu = request.getParameter("menu");
		String code = request.getParameter("code");

		if(menu.equals("delete")){
			submitProc.DeleteProbDir(code);
			probdb.deleteCode(code);
			ArrayList<ClassEntity> cList = clasdb.getClassList();
			for(ClassEntity clas : cList) {
				ArrayList<String> pList = clasdb.getProblemList(String.valueOf(clas.getId()));
				for(String pCode : pList){
					if(code.equals(pCode)){
						clasdb.deleteProblem(String.valueOf(clas.getId()), pCode);
					}
				}
			}
		}
		else if(menu.equals("insert")){%>
			<jsp:setProperty name="prob" property="*"/>
			<%
			if(!submitProc.isCodeExist(code)){
				submitProc.CreateProbDir(code);
				probdb.insertDB(prob);
			}else {
				out.print("<script>");
				out.print("alert('Duplicate code. Could not create problem.');");
				out.print("history.back();");
				out.print("</script>");
			}
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
			adminCheck("Problem_List.jsp");
		</script>

	</body>
</html>