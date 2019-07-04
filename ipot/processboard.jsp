<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �⺻ ���� : �Խ� ��� ���� ���� ó��</title>
</head>
<body>

	<!-- �Խ��� ���, ����, ������ ���� �ڹٺ��� �̿� ����-->
	<jsp:useBean id="brd" class="Proj.BoardEntity" scope="page" />
	<jsp:useBean id="brddb" class="Proj.BoardDBCP" scope="page" />

	<% 
		//�ѱ� ó���� ���� �������ڵ� ����
		request.setCharacterEncoding("euc-kr");
		//���(inser), ����(update), ����(delete) �� �ϳ��� ����
	 	String menu = request.getParameter("menu"); 
		// ��� �Ǵ� ���� ó�� ��� 
	 	if ( menu.equals("delete") || menu.equals("update") ) { 
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			int idnum = Integer.parseInt(id);	
			//�����ͺ��̽� �ڹٺ�� ������ �޼ҵ� isPasswd()�� id�� ��ȣ�� ��ġ�ϴ��� �˻�
			if ( !brddb.isPasswd(idnum, passwd) ) {
	%>
				<!-- ��ȣ�� Ʋ���� ���� ȭ������ �̵� -->
				<script>alert("��й�ȣ�� �ٸ��ϴ�."); history.go(-1);</script>
	<%
			} else {
				if ( menu.equals("delete") ) {
					//������ ���� �����ͺ��̽� �ڹٺ�� ������ �޼ҵ� deleteDB() ���� 			
					brddb.deleteDB(idnum);
				} else if ( menu.equals("update") ) { 
	%>
					<!-- ���� �� BoardEntity�� �����ؾ� �ϴ� �ʵ� id -->
					<jsp:setProperty name="brd" property="id" />
					<jsp:setProperty name="brd" property="name" />
					<jsp:setProperty name="brd" property="title" />
					<jsp:setProperty name="brd" property="email" />
					<jsp:setProperty name="brd" property="content" />
	<%		
					//������ ���� �����ͺ��̽� �ڹٺ�� ������ �޼ҵ� updateDB() ���� 			
					brddb.updateDB(brd);
				}
				//��� ���� �� �ٽ� �Խ� ��� ����� �̵�
				response.sendRedirect("listboard.jsp");					 		
			}
	 	} else if ( menu.equals("insert") ) {
	%>
			<!-- ��� �� BoardEntity�� �����ؾ� �ϴ� �ʵ� passwd -->
			<jsp:setProperty name="brd" property="name" />
			<jsp:setProperty name="brd" property="title" />
			<jsp:setProperty name="brd" property="email" />
			<jsp:setProperty name="brd" property="content" />
			<jsp:setProperty name="brd" property="passwd" />
	<%		
			//��ϸ� ���� �����ͺ��̽� �ڹٺ�� ������ �޼ҵ� insertDB() ���� 			
			brddb.insertDB(brd);
			//��� ���� �� �ٽ� �Խ� ��� ����� �̵�
			response.sendRedirect("listboard.jsp");					 		
	 	}
	%>

</body>
</html>