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
</style>
<script src="https://cdn.ckeditor.com/4.9.2/standard/ckeditor.js"></script>
<title>Admin Page</title>
</head>
	<body>
		<%String LOGINID = request.getParameter("loginId");%>
		<%String LEVEL = request.getParameter("Level");%>
		<%--
		if(LOGINID == null || LEVEL== null){
			response.sendRedirect("adminError.jsp");
		}
		--%>
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

			<li><a href="#" onclick="adminCheck('Problem_List.jsp'); return false;" class="active" >Problem</a></li>
			<li><a href="#" onclick="adminCheck('Student_Management.jsp'); return false;">Student Management</a></li>
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
			<b><a style="font-size:25px">Add Problem</a></b>
			<hr>
		<div class="formDiv">
			<form name="problemForm" method="post" action="problemProcess.jsp">
				<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
				<input type="hidden" name="Level" value="<%=LEVEL%>"/>
				<input type="hidden" name="menu" value="insert">
				<input type="hidden" name="author" id="author" value="<%=LOGINID%>">
				<label for="code">Problem Code</label>
				<input type="text" id="code" name="code"></input>
				<label for="name">Problem Name</label>
				<input type="text" id="name" name="name"></input>
				<label for="descrip">Problem description</label>
				<textarea name="descrip" id="descrip">	

					<h1><b>Problem Description</b></h1>
					Write a description of the problem here.
					<br><br>
					
					<br><br>
					
					
					</tbody>
					</table>
				</textarea>
				<script>
				CKEDITOR.config.height = '400px';
				CKEDITOR.replace( 'descrip' );
				</script>
				<input type="button" onClick="insertCheck()" value="Save" class="button">
			</form>	
		</div>
		<script>
			<jsp:useBean id="submitProc" class="Proj.SubmitProcess" scope="page"/>
			function insertCheck(){
				if(document.problemForm.code.value==""){
					alert("Please insert problem code.");
					document.problemForm.code.focus();
					return;
				}
				if(document.problemForm.name.value==""){
					alert("Please insert problem name.");
					document.problemForm.name.focus();
					return;
				}
				document.problemForm.menu.value="insert";
				document.problemForm.submit();
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
