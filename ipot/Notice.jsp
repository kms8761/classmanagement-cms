<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<style type="text/css">
			@import url("style.css");
			.button{
				width: 100%;
				background-color: #555555;
				color: white;
				padding: 14px 20px;
				margin: 8px 0;
				border: none;
				border-radius: 4px;
				cursor: pointer;
			}
			.button:hover{
				background-color: black;
			}
		</style>
		<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
		<title>Admin Page</title>
	</head>
	<body>
		<%String LOGINID = request.getParameter("loginId");%>
		<%String LEVEL = request.getParameter("Level");%>
		
		<%@ page import="java.util.ArrayList, Proj.ClassEntity" %>
		<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
		<jsp:useBean id="probdb" class="Proj.ProblemDBCP" scope="page"/>
		<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
		<ul class="topnav">
			<form name="nameForm" action="loginProcess.jsp" method="post">
				<input type="hidden" name="id" value=""/>
				<input type="hidden" name="pw" value=""/>
			</form>			
			<li><a href="#" onclick="mainCheck(); return false;" style="color:rgb(123,123,223); font-weight:bold;">CODE-METER Online Judge System</a></li>
			<li class="dropdown" style="float:right">
				<a href="javascript:void(0)" class="dropbtn">Wellcome <%=LOGINID%>!</a>
				<div class="dropdown-content">
					<a onclick="logOut(); return false;">Log-Out</a>
				</div>
			</li>
			<script>
				function logOut(){
					location.replace("index.html");
				}
				function mainCheck(){
					document.nameForm.id.value = "<%=LOGINID%>";
					document.nameForm.pw.value = "<%=studdb.getPassword(LOGINID)%>";
					document.nameForm.submit();
				}
			</script>
		</ul>
		<ul class="leftnav">

			<form id="adminForm" name="adminForm" method="post" action="">
				<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
				<input type="hidden" name="Level" value="<%=LEVEL%>"/>
			</form>

			<li><a href="#" onclick="adminCheck('Problem_List.jsp'); return false;">Problem</a></li>
			<li><a href="#" onclick="adminCheck('Student_Management.jsp'); return false;">Student Management</a></li>
			<li><a href="#" onclick="adminCheck('Class_Management.jsp'); return false;">Class Management</a></li>
			<li><a href="#" onclick="adminCheck('Notice.jsp'); return false;" class="active">Notice</a></li>
			<script>
				function adminCheck(address){
					document.adminForm.loginId.value = "<%=LOGINID%>";
					document.adminForm.Level.value = "<%=LEVEL%>";
					document.adminForm.action=address;
					document.adminForm.submit();
				}
			</script>
		</ul>

		<div style="margin-left:15%;padding:1px 16px;height:1000px;">
			<br>
			<b><a style="font-size:25px">Send Notifications</a></b>
			<hr>
			
			<div class="formDiv">
				<form name="noticeForm" method="post" action="noticeProcess.jsp">
					<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
					<input type="hidden" name="Level" value="<%=LEVEL%>"/>
					<input type="hidden" name="menu" value="insert">
					<input type="hidden" name="groupName" value="">
					<input type="hidden" name="groupId" value="">
					<label for="nName">Notification Name</label>
					<input type="text" id="nName" name="nName" />
					<label for="gName">Group Name</label>
					<select class="searchSelect" name="gName" id="gName">
						<option value="---">---</option>
					<%
						ArrayList<ClassEntity> list = clasdb.getClassList();
						int count = list.size();
						int memCnt;
						for(ClassEntity clas : list) {
					%>
						<option value="<%=clas.getId()%>"><%=clas.getName()%></option>
					<%
						}
					%>
					</select>
					<label for="pContent">Notification Content</label>
					<textarea name="pContent"></textarea>
					<script>
						CKEDITOR.config.height = '400px';
						CKEDITOR.replace( 'pContent' );
					</script>
					<input type="button" onClick="insertCheck()" value="Send" class="button">
				</form>	
			</div>
		</div>
		<script>
			function insertCheck(){
				if(document.noticeForm.nName.value==""){
					alert("Please insert notice name.");
					document.noticeForm.pCode.focus();
					return;
				}
				var e = document.getElementById("gName");
				if(e.options[e.selectedIndex].text=="---"){
					alert("Please select group.");
					document.noticeForm.pName.focus();
					return;
				}
				document.noticeForm.menu.value="insert";
				document.noticeForm.groupName.value = e.options[e.selectedIndex].text;
				document.noticeForm.groupId.value = e.options[e.selectedIndex].value;
				document.noticeForm.submit();
			}
			function myFunction() {
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("SearchInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("ProblemTable");
			  tr = table.getElementsByTagName("tr");
			  var sel = document.getElementById("sel");
			  var index = sel.options[sel.selectedIndex].value;
			  for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[index];
				if (td) {
				  if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				  } else {
					tr[i].style.display = "none";
				  }
				}       
			  }
			}
		</script>
	</body>
</html>
