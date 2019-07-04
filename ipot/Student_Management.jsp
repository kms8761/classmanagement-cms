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

		<%@ page import="java.util.ArrayList, Proj.StudentEntity" %>
		<jsp:useBean id="probdb" class="Proj.ProblemDBCP" scope="page"/>
		<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
		<ul class="topnav">
			<form name="nameForm" action="loginProcess.jsp" method="post">
				<input type="hidden" name="id" value=""/>
				<input type="hidden" name="pw" value=""/>
			</form>			
			<li><a href="#" onclick="mainCheck(); return false;" style="color:rgb(123,123,223); font-weight:bold;">i-pot system</a></li>
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

			<li><a href="#" onclick="adminCheck('Problem_List.jsp'); return false;">Test</a></li>
			<li><a href="#" onclick="adminCheck('Student_Management.jsp'); return false;" class="active">Student Management</a></li>
			<li><a href="#" onclick="adminCheck('Class_Management.jsp'); return false;">Class Management</a></li>
			<li><a href="#" onclick="adminCheck('editboard.jsp'); return false;">Notice</a></li>
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
			<b><a style="font-size:25px">Student Management</a></b>
			<button onclick="adminCheck('Add_Student.jsp'); return false;" class="addBtn">Add Student</button>
			<hr>
			<table style="width:100%">
				<th style="width:15%">
				<select class="searchSelect" name="sel" id="sel">
					<option value="0">ID</option>
					<option value="1">Student ID</option>
					<option value="2">Name</option>
					<option value="3">Level</option>
				</select>
				</th>
				<th style="width:85%">
				<input type="text" id="SearchInput" onkeyup="myFunction()" placeholder="Search for ..." title="Type in a name">
				</th>
			</table>
			<form name="studentForm" method="post" action="studentProcess.jsp">
				<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
				<input type="hidden" name="Level" value="<%=LEVEL%>"/>
				<input type="hidden" name="menu" value="delete"/>
				<input type="hidden" name="sId" value="sId"/>
				<table id="MainTable">
					<tr class="header">
						<th style="width:25%;">ID</th>
						<th style="width:25%;">Student ID</th>
						<th style="width:30%;">Name</th>
						<th style="width:10%;">Level</th>
						<th style="width:5%;"></th>
						<th style="width:5%;"></th>
					</tr>
					<%
						ArrayList<StudentEntity> list = studdb.getStudentList();
						int count = list.size();
							
						for(StudentEntity stud : list) {
							if(Integer.parseInt(stud.getLevel()) <= Integer.parseInt(LEVEL)){
						%>
						<tr>
							<td><%=stud.getId()%></td>
							<td><%=stud.getStudentid()%></td>
							<td><%=stud.getName()%></td>
							<td><%=stud.getLevel()%></td>
							<td>
								<!-- <input class="mainBtn" type="button" value="Edit"/> -->
							</td>
							<td><input onClick="deleteCheck('<%=stud.getStudentid()%>', '<%=stud.getLevel()%>')" class="mainBtn" type="button" value="Delete"/></td>
						</tr>
						<%
							}
						}
						%>
				</table>
			</form>
		</div>
		<script>
			function deleteCheck(sId, level){
				if(parseInt(level) >= parseInt(document.adminForm.Level.value)){
					alert("You do not have permission. Please contact your administrator.");
					return;
				}
				ok = confirm('Are you sure you want to delete?');
				if(ok){
					document.studentForm.menu.value = 'delete';
					document.studentForm.sId.value = sId;
					document.studentForm.submit();
				} else {
					return;
				}
			}
			function myFunction() {
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("SearchInput");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("MainTable");
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
