<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ page import="java.util.ArrayList, Proj.boardItem, Proj.problemItem" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat, java.text.ParseException" %>
<%@ page import="Proj.StudentEntity" %>
<jsp:useBean id="boarddb" class="Proj.boardlistDB"></jsp:useBean>
<jsp:useBean id="submitProc" class="Proj.SubmitProcess" scope="page"/>
<jsp:useBean id="studdb" class="Proj.StudentDBCP" scope="page"/>
<jsp:useBean id="logindb" class="Proj.loginProcessBean" scope="page"/>
<%
	ArrayList<boardItem> blin = boarddb.getNewslist();
	ArrayList<problemItem> blic = null;
	ArrayList<String> ClassList = (ArrayList<String>) request.getSession().getAttribute("className");
	ArrayList<String> ClassCode = (ArrayList<String>) request.getSession().getAttribute("classCode");
	
	String LoginID = (String) request.getSession().getAttribute("loginID");
	String priv = (String) request.getSession().getAttribute("priv");
	String sNum = (String) request.getSession().getAttribute("snum");
	String solved[] = submitProc.getSolved(sNum).split(" ");
	String ID = null;
	String title = null;
	String content = null;
	String timeStamp = null;
	String time = null;
	String date = null;
	String isSolved = null;
	String staColor = null;
	float tmp = 0;

	

	String period = null;
	SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Date result = null;
	boolean isClickable = true;
	
	

%>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">



<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/psn_component.css">
	<link rel="stylesheet" type="text/css" href="css/tml_component.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/chart.css">



<style type="text/css">

<meta charset="UTF-8">
		<title>CMS</title>
		<script>
		fucntion notice()
{<form class="w3-container" action="Notice.jsp">
}
			function fnMove(seq){
				var offset = $("#div" + seq).offset();
				$('html, body').animate({scrollTop : offset.top}, 400);
			}
			window.onscroll = function() {scrollFunction()};

			function scrollFunction() {
				if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
					document.getElementById("top_button").style.display = "block";
				} else {
					document.getElementById("top_button").style.display = "none";
				}
			}

			function topFunction() {
				document.body.scrollTop = 0;
				$('html, body').animate({scrollTop : 0}, 300);
			}
		</script>
		<style>						
			#top_button {
			  display: none;
			  position: fixed;
			  bottom: 20px;
			  right: 30px;
			  z-index: 99;
			  font-size: 18px;
			  border: none;
			  outline: none;
			  background-color: red;
			  color: white;
			  cursor: pointer;
			  padding: 15px;
			  border-radius: 4px;
			
			
			
			
			
			
			
			
			
			}










			#top_button:hover {
			  background-color: #555;
			}
			table.table2{
				border-collapse: collapse;
				margin : auto;
				text-align: left;
			}
			table.table2 th {
				padding: 10px;
				color: #F1652A;
				border-bottom: 5px solid #F1652A;
				text-align: center;
			}
			table.table2 td {
				color: white;
				padding: 10px;
				border-bottom: 1px solid #ddd;
			}
			table.table1 {
				border-collapse: collapse;
				text-align: left;
				line-height: 1.5;
				border-top: 1px solid #ccc;
				border-left: 5px solid #F1652A;
				margin : auto;

			}
			table.table1 th {
				text-align: left;
				width: 147px;
				padding: 10px;
				font-weight: bold;
				vertical-align: top;
				color: #F1652A;
				border-right: 1px solid #ccc;
				border-bottom: 1px solid #ccc;

			}
			table.table1 td {
				width: 465px;
				padding: 10px;
				vertical-align: top;
				border-right: 1px solid #ccc;
				border-bottom: 1px solid #ccc;
			}
			div{
				margin-bottom:5px;
			}
			body{
				text-align:center;
				background-color:black;
				font-family:"Trebuchet MS";
			}
			header{
				padding:10px;
			}
			nav{
				
			}
			li {
				color:white
			}
			nav ul li {
				display:inline;
				margin:0px;
				padding:0px;
			}
			ul li{
				display:inline;
			}
			footer{
				border:1px solid black;
			}
			a{
				font-size:15pt;
				text-decoration:none;
				color:white;
				font-family:"Trebuchet MS";
			}
			.menuLink{
				color:white;
			}
			.topMenuLi:hover .menuLink{
				color:red;
			}
			.button{
				font-size: 20px;
				padding: 15px 32px;
				font-family:Trebuchet MS;
				background-color:#333333;
				color:white;
				border: none;
				display: inline-block;
				font-family:"Trebuchet MS";
				border-radius:10px;
			}
			.button1{
				font-size: 20px;
				padding: 15px 32px;
				font-family:Trebuchet MS;
				background-color:#333333;
				color:white;
				border: none;
				
				font-family:"Trebuchet MS";
				border-radius:10px;
			}
			
			
			
			
			.button:hover {
				background-color:#000000;
				color:red;
			}

			.abox1{		
				
				#wrap background-100% 100%;

				text-align: center;
				
				background-image: url("./back3.jpg");
			}

			.abox2{
				vertical-align: middle;
				text-align: center;
				width: 500px;
				height: 100px;
				background-image: url("./back_contact.jpg");
			}
			#back_image{
				background-position:center center;
				background-repeat:no-repeat
			}
			.textstyle{
				width: 100%;
				padding: 12px 20px;
				margin: 8px 0;
				display: inline-block;
				border: 2px solid #ccc;
				border-radius: 4px;
				box-sizing: border-box;			
			}



.bt-admin {
  display: flex;
  overflow: hidden;

  padding: 12px 12px;

  cursor: pointer;
  user-select: none;
  transition: all 150ms linear;
  text-align: center;
  white-space: nowrap;
  text-decoration: none !important;
  text-transform: none;
  text-transform: capitalize;
  }
 </style>






</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="Homepage1.html">I-POT</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="index.html" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="Homepage1.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Home</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="quiz.jsp">
          <i class="fas fa-fw fa-folder"></i>
          <span>Quiz</span></a>
       
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="listboard.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Notice</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="Myaccount.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Myaccount</span></a>
      </li>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">I-POT</a>
          </li>
          <li class="breadcrumb-item active">Notice</li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Data Table Example</div>
          <div class="card-body">
            <div class="table-responsive">
            
            
            <center>
	<%@ page import="java.util.ArrayList, Proj.BoardEntity, java.text.SimpleDateFormat" %>
	<jsp:useBean id="brddb" class="Proj.BoardDBCP" scope="page" />
	
	<h2>Notice</h2>
	<% 
		//게시 목록을 위한 배열리스트를 자바진즈를 이용하여 확보 
		ArrayList<BoardEntity> list = brddb.getBoardList(); 
	   	int counter = list.size();
	   	int row = 0;
	   	
	   	if (counter > 0) {
	%>
            
            
            
            
            
            
            
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    
                    <tr>
       <th><font color=blue><b>NUMBER</b></font></th>
       <th><font color=blue><b>TITLE</b></font></th>
       <th><font color=blue><b>NAME</b></font></th>
       <th><font color=blue><b>DATE</b></font></th>
       <th><font color=blue><b>CLASS</b></font></th>
    </tr>
	<%
		//게시 등록일을 2010-3-15 10:33:21 형태로 출력하기 위한 클래스 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for( BoardEntity brd : list ) {
			//홀짝으로 다르게 색상 지정
			String color = "papayawhip";
			if ( ++row % 2 == 0 ) color = "white"; 
	%>
    <tr bgcolor=<%=color %> 
		onmouseover="this.style.backgroundColor='SkyBlue'"
    	onmouseout="this.style.backgroundColor='<%=color %>'">
		<!-- 수정과 삭제를 위한 링크로 id를 전송 -->
       <td align=center><a href="editboard.jsp?id=<%= brd.getId()%>"><%= brd.getId()%></a></td>
       <td align=left><%= brd.getTitle() %></td>
       <td align=center><%= brd.getName() %></td>
		<!-- 게시 작성일을 2010-3-15 10:33:21 형태로 출력 -->
       <td align=center><%= df.format(brd.getRegdate()) %></td>
       <td align=center><%= brd.getEmail() %></td>
    </tr>
	<%
	    }
	%>
	</table>
<% 	}
%>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="index.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
