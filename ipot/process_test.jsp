<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title</title>
</head>
<body>

	<jsp:useBean id="tst" class="Proj.Test_Entity" scope="page" />
	<jsp:useBean id="tstdb" class="Proj.Test_DBCP" scope="page" />

	<% 
		request.setCharacterEncoding("UTF-8");
	 	String menu = request.getParameter("menu"); 
	 	if ( menu.equals("delete") || menu.equals("update") ) { 
			String id = request.getParameter("id");
			int idnum = Integer.parseInt(id);	
			if ( menu.equals("delete") ) {		
				tstdb.deleteDB(idnum);
			} else if ( menu.equals("update") ) { 
	%>
				<jsp:setProperty name="tst" property="id" />
				<jsp:setProperty name="tst" property="name" />
				<jsp:setProperty name="tst" property="question_score" />
				<jsp:setProperty name="tst" property="question" />
				<jsp:setProperty name="tst" property="answer" />
				<jsp:setProperty name="tst" property="open_multi" />
				<jsp:setProperty name="tst" property="score" />
	<%			
				tstdb.updateDB(tst);
			}
			response.sendRedirect("play_test.jsp");					 		
		}
	 	 else if ( menu.equals("insert") ) {
	%>
				<jsp:setProperty name="tst" property="name" />
				<jsp:setProperty name="tst" property="question" />
				<jsp:setProperty name="tst" property="question_score" />
				<jsp:setProperty name="tst" property="answer" />
				<jsp:setProperty name="tst" property="open_multi" />
				<jsp:setProperty name="tst" property="score" />
	<%			
			tstdb.insertDB(tst);
			response.sendRedirect("play_test.jsp");					 		
	 	}
	%>

</body>
</html>