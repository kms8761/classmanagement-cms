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
	</head>
	<body>
		<jsp:useBean id="loginProc" class="Proj.loginProcessBean" scope="page"/>
		<jsp:useBean id="stud" class="Proj.StudentEntity" scope="page"/>
		<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
		<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
		<%@ page import="java.util.ArrayList"%>
		<%@ page import="java.util.List"%>
		<%@ page import="java.util.Arrays"%>
		<%@ page import="Proj.StudentEntity" %>
		<%
			String ID = request.getParameter("id");
			String Password = request.getParameter("pw");
			String Page = "";
			String sNum = "";
			String level = "";
			ArrayList<String> classList = new ArrayList<String>();
			ArrayList<String> classCodeList = new ArrayList<String>();
			String[] solvedList = null;


			StudentEntity ent = loginProc.getStudentEntity(ID, Password);


			if(ent != null){
				level = ent.getLevel();
				sNum = ent.getStudentid();
				classList = loginProc.getClassList(sNum);
				classCodeList = loginProc.getCodeList(sNum);
				solvedList = loginProc.getSolved(sNum).split(" ");
				Page = "Homepage1.html";
			}
			else {
				Page = "loginError.jsp";
			}

			session.setAttribute("snum", sNum);
			session.setAttribute("priv", level);
			session.setAttribute("loginID", ID);
			session.setAttribute("className", classList);
			session.setAttribute("classCode", classCodeList);
			session.setAttribute("solvedCode", solvedList);
			response.sendRedirect(Page);
		%>
		
	</body>
</html>