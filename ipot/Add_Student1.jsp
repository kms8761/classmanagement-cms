<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">
<head>
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

	input[type=password]{
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-sizing: border-box;
	}
</style>
<title></title>
</head>
	<body>
		 
		<%String LOGINID = request.getParameter("loginId");%>
		<%String LEVEL = request.getParameter("Level");%>
		<%--/ <%
		if(LOGINID == null || LEVEL== null){
			response.sendRedirect("adminError.jsp");
		}
		%>--%>
		<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
		<ul class="topnav">
			<form name="nameForm" action="loginProcess.jsp" method="post">
				<input type="hidden" name="id" value=""/>
				<input type="hidden" name="pw" value=""/>
			</form>			
			
			<li class="dropdown" style="float:right">
				
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
			</script>
		</ul>

		<div style="margin-left:15%;padding:1px 16px;height:1000px;">
			<br>
			<b><a style="font-size:25px">회원가입</a></b>
			<hr>
			
			<div class="formDiv">
				<form name="studentForm" method="post" action="studentProcess.jsp">
					<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
					<input type="hidden" name="Level" value="<%=LEVEL%>"/>
					<input type="hidden" name="menu" value="insert">
					<table width=100%>
					<tr>
						<td style="width:7%"></td>
						<td style="width:10%">ID</td>
						<td style="width:30%">
							<input type="text" id="Id" name="Id" />
						</td>
						<td style="width:5%"></td>
						<td style="width:10%">Student ID</td>
						<td style="width:30%">
							<input type="text" id="sId" name="sId" />
						</td>
						<td style="width:7%"></td>
					</tr>
					<tr>
						<td style="width:7%"></td>
						<td style="width:10%">Student Name</td>
						<td style="width:30%">
							<input type="text" id="sName" name="sName" />
						</td>
						<td style="width:5%"></td>
						<td style="width:10%">E-mail</td>
						<td style="width:30%">
							<input type="text" id="email" name="email" />
						</td>
						<td style="width:7%"></td>
					</tr>
					<tr>
						<td style="width:7%"></td>
						<td style="width:10%">Phone Number</td>
						<td style="width:30%">
							<input type="text" id="phone" name="phone" />
						</td>
						<td style="width:5%"></td>
						<td style="width:10%">Access Level</td>
						<td style="width:30%">
							<select class="searchSelect" name="level" id="level">
								<option value="0">student</option>
								<option value="1">professor</option>
							
							</select>
						</td>
						<td style="width:7%"></td>
					</tr>
					<tr>
						<td style="width:7%"></td>
						<td style="width:10%">Password</td>
						<td style="width:30%">
							<input type="password" id="password" name="password" />
						</td>
						<td style="width:5%"></td>
						<td style="width:10%">Password Check</td>
						<td style="width:30%">
							<input type="password" id="passwordCheck" name="passwordCheck" />
						</td>
						<td style="width:7%"></td>
					</tr>
					<tr>
						<td style="width:7%"></td>
						<td style="width:10%"></td>
						
						<td style="width:5%"></td>
						<td style="width:10%"></td>
						<td style="width:30%"></td>
						<td style="width:7%"></td>
					</tr>
					</table>
					<script>
						function showPassword() {
							var x = document.getElementById("password");
							if (x.type === "password") {
								x.type = "text";
							} else {
								x.type = "password";
							}
							var y = document.getElementById("passwordCheck");
							if (y.type === "password") {
								y.type = "text";
							} else {
								y.type = "password";
							}
						}
					</script>
					<br>
					<table width=100%>
					<tr>
					<td style="width:7%"></td>
					<td style="width:86%">
						<input type="button" onClick="insertCheck()" value="회원가입" class="button">
					</td>
					<td style="width:7%"></td>
					</tr>
					</table>
				</form>	
			</div>
		</div>
		<script>
			function insertCheck(){
				if(document.studentForm.Id.value==""){
					alert("Please insert user id.");
					document.studentForm.Id.focus();
					return;
				}
				if(document.studentForm.sId.value==""){
					alert("Please insert student id.");
					document.studentForm.sId.focus();
					return;
				}
				if(document.studentForm.sName.value==""){
					alert("Please insert student name.");
					document.studentForm.sName.focus();
					return;
				}
				if(document.studentForm.email.value==""){
					alert("Please insert e-mail.");
					document.studentForm.email.focus();
					return;
				}
				if(document.studentForm.phone.value==""){
					alert("Please insert phone number.");
					document.studentForm.phone.focus();
					return;
				}
				if(document.studentForm.password.value==""){
					alert("Please insert password.");
					document.studentForm.password.focus();
					return;
				}
				if(document.studentForm.passwordCheck.value==""){
					alert("Please insert password check.");
					document.studentForm.passwordCheck.focus();
					return;
				}
				if(document.studentForm.password.value != document.studentForm.passwordCheck.value){
					alert("Passwords do not match.");
					document.studentForm.password.value = "";
					document.studentForm.passwordCheck.value = "";
					return;
				}
				var target = document.getElementById("level");

				
				if(parseInt(target.options[target.selectedIndex].value) >= parseInt(document.adminForm.Level.value)){
					alert("You do not have permission. Please contact your administrator.");
					document.studentForm.level.focus();
					return;
				}
				
				document.studentForm.menu.value="insert";
				document.studentForm.level.value = target.options[target.selectedIndex].value;
				document.studentForm.submit();
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
