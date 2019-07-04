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
		<%@ page import="java.util.ArrayList, Proj.AssignmentEntity" %>
		<%@ page import="java.util.List"%>
		<%@ page import="java.util.Arrays"%>
		<%@ page import="Proj.ClassEntity" %>	
		<%@ page import="Proj.StudentEntity" %>	
		<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

		<jsp:useBean id="clasdb" class="Proj.ClassDBCP" scope="page"/>
		<jsp:useBean id="assigndb" class="Proj.AssignmentDBCP" scope="page"/>
		<jsp:useBean id="submitProc" class="Proj.SubmitProcess" scope="page"/>
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
			<li><a href="#" onclick="adminCheck('Notice.jsp'); return false;">Notice</a></li>
		</ul>

		<div style="margin-left:15%; padding:1px 16px;height:1000px;">
				<br>
				<%
					String classId = request.getParameter("classId");
					ClassEntity clas = clasdb.getEntityByClassId(classId);
				%>
				<b><a style="font-size:25px"><%=clas.getName()%> #<%=clas.getNumber()%></a></b>
				<button onclick="adminCheck('Add_Assignment.jsp?classId=<%=request.getParameter("classId")%>');" class="addBtn">Add Assignment</button>
				<hr>

			<form name="assignmentForm" method="post" action="assignmentProcess.jsp?classId=<%=request.getParameter("classId")%>">
				<input type="hidden" name="loginId" value="<%=LOGINID%>"/>
				<input type="hidden" name="Level" value="<%=LEVEL%>"/>
				<input type="hidden" name="menu" value="delete"/>
				<input type="hidden" name="id" value=""/>
				<table id="MainTable">
					<tr class="header">
						<th style="width:10%;">Problem Code</th>
						<th style="width:25%;">Problem Name</th>
						<th style="width:15%;">Create Time</th>
						<th style="width:15%;">Period</th>
						<th style="width:15%;">Submission Rate</th>
						<th style="width:10%;">State</th>
						<th style="width:5%;"></th>
						<th style="width:5%;"></th>
					</tr>

					<%
					
						String[] MemberList = clasdb.getMembers(classId).split(" ");
						int memCount = MemberList.length;
						ArrayList<AssignmentEntity> list = assigndb.getAssignmentList("Class_"+classId);

						for(AssignmentEntity assign : list) {
							double solvedCount = 0.0;
							for(int i=0; i<memCount; i++){							
								String[] splitList = submitProc.getSolved(MemberList[i]).split(" ");
								List<String> solveList = Arrays.asList(splitList);

								if(solveList.contains(assign.getCode())) solvedCount += 1.0;
							}
					
							// submitrate = solvedCount/memCount
					%>
					<tr>
						<td><%=assign.getCode()%></td>
						<td><%=assign.getName()%></td>
						<td><%=assign.getCreate()%></td>
						<td><%=assign.getPeriod()%></td>
						<td><%=solvedCount/memCount * 100%>%</td>
						<td>						
							<%
								String period = assign.getPeriod();
								SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
								Date result = formater.parse(period);
								if(result.after(new Date())){
							%>
								Proceeding
							<%
								}else {	
							%>
								Over
							<%
								}
							%>

						</td>
						<td>
							<!-- <input class="mainBtn" type="button" value="Edit"/> -->
						</td>
						<td><input onClick="deleteCheck('<%=assign.getId()%>')" class="mainBtn" type="button" value="Delete"/></td>				
					</tr>
					<%
						}
					%>
				</table>
				<br>
			</form>
			
			<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
			<script type="text/javascript">
			function getRandomColor() {
			  var letters = '0123456789ABCDEF';
			  var color = '#';
			  for (var i = 0; i < 6; i++) {
				color += letters[Math.floor(Math.random() * 16)];
			  }
			  return color;
			}
			function getDataFromTable(){
				var table = document.getElementById('MainTable');
				var result = [
					["Element", "Submission Rate", { role: "style" } ],
				];
				for(var r=1, n = table.rows.length; r < n; r++){
					var ProbName = table.rows[r].cells[1].innerHTML;
					var SubmitRate = table.rows[r].cells[4].innerHTML;
					var row = [];
					row.push(ProbName);
					row.push(parseInt(SubmitRate));
					row.push(getRandomColor());				
					result.push(row);
				}
				return result;
			}
			
			function drawChart() {
				var data = google.visualization.arrayToDataTable(getDataFromTable());

				var view = new google.visualization.DataView(data);
				view.setColumns([0, 1,
					{
						calc: "stringify",
						sourceColumn: 1,
						type: "string",
						role: "annotation"
					},
					2]);

				var options = {
					vAxis: { 'gridlines': { 'count': 11 }, 'viewWindow': {'max' : 100}},
					title: "Submission Rate",
					width: 1200,
					height: 600,
					bar: {groupWidth: "20%"},
					legend: { position: "none" },
				};
				var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
				chart.draw(view, options);
			}
			
			google.charts.load("current", {packages:['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			</script>
			<div id="columnchart_values" style="width: 900px; height: 300px;"></div>

		</div>
		<script>
			function adminCheck(address){
				document.adminForm.loginId.value = "<%=LOGINID%>";
				document.adminForm.Level.value = "<%=LEVEL%>";
				document.adminForm.action=address;
				document.adminForm.submit();
			}
		</script>
		<script>
			function deleteCheck(id){
				ok = confirm('Are you sure you want to delete?');
				if(ok){
					document.assignmentForm.menu.value = 'delete';
					document.assignmentForm.id.value = id;
					document.assignmentForm.submit();
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
