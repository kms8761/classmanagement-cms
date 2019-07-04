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
			<li><a href="#" onclick="adminCheck('Class_Management.jsp'); return false;" class="active">Class Management</a></li>
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
			<b><a style="font-size:25px">Add Class</a></b>
			<hr>
			
			<div class="formDiv">
				<form name="classForm" method="post" action="classProcess.jsp">
					<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
					<input type="hidden" name="Level" value="<%=LEVEL%>"/>
					<input type="hidden" name="menu" value="insert">
					<input type="hidden" name="members" value="">
					<input type="hidden" name="instructor" value="">
					<table width=100%>
						<tr>
							<td style="width:7%"><td>
							<td style="width:10%">Class Name</td>
							<td style="width:30%">
								<input type="text" id="cName" name="cName" />
							</td>
							<td style="width:5%"></td>
							<td style="width:10%">Class Number</td>
							<td style="width:30%">
								<input type="text" id="cNum" name="cNum" />
							</td>
							<td style="width:7%"></td>
						</tr>
					</table>
					<br>
					<table width=100%>
					<tr>
							<td style="width:7%"></td>
							<td style="width:35%">
								<label for="cMember">Class Member</label>
								<select multiple size="20" name="cMember" id="rightValues">
								</select>
							</td>
							<td style="width:10%; text-align:center">
								<input type='button' id='btnRight' value='<'>
								<input type='button' id='btnLeft' value='>'>
							</td>
							<td style="width:35%">
								<label for="student">Student list</label>
								<select multiple size="20" name="student" id="leftValues">
								<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
								<%@ page import="java.util.ArrayList, Proj.StudentEntity" %>
								<%
									ArrayList<StudentEntity> list = studdb.getStudentList();										
									for(StudentEntity stud : list) {
										if(stud.getLevel().equals("0")){
								%>
											<option><%=stud.getStudentid()%> / <%=stud.getName()%></option>
								<%
										}
									}
								%>
								</select>
								<script>
									$("#btnLeft").click(function () {
									  var selectedItem = $("#rightValues option:selected");
									  $("#leftValues").append(selectedItem);
									});

									$("#btnRight").click(function () {
										var selectedItem = $("#leftValues option:selected");
										$("#rightValues").append(selectedItem);
									});
								</script>
							</td>
							<td style="width:7%"></td>
						</tr>
					</table>
					<br>
					<input type="button" onClick="insertCheck()" value="Save" class="button">
				</form>	
			</div>
		</div>
		<script>
			function insertCheck(){
				if(document.classForm.cName.value==""){
					alert("Please insert class name.");
					document.classForm.cName.focus();
					return;
				}
				if(document.classForm.cNum.value==""){
					alert("Please insert class number.");
					document.classForm.cNum.focus();
					return;
				}
				document.classForm.menu.value="insert";
				var select = document.getElementById("rightValues");
				var mems = "";
				for(var i=0; i<select.length; i++){
					mems += select.options[i].value.substr(0, 9);
					mems += " ";
				}
				document.classForm.members.value = mems;
				document.classForm.submit();
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
