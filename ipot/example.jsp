<!doctype html>
<html lang="ko">

<html lang="en" class="no-js">

<!-- Needs to be implemented -->
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
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
  <title>I-POT</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/psn_component.css">
	<link rel="stylesheet" type="text/css" href="css/tml_component.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/chart.css">

  
  <!-- Custom styles for this template -->
  <link href="css/agency.min.css" rel="stylesheet">
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


 table {
    border: 0px 
    border-collapse: collapse;
  }
  th, td {
    border: 0px
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

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top">I-POT</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="#"></a>
          </li>
          <li class="nav-item">
            <a  class="nav-link js-scroll-trigger" href="Myaccount.jsp">Myaccount</a>
          </li>
          <li class="nav-item">
            <a  class="nav-link js-scroll-trigger" href="test.jsp">Quiz</a>
          </li>
          <li class="nav-item">
            <a   class="nav-link js-scroll-trigger" href="listboard.jsp">Notice</a>
          </li>
          <li class="nav-item">
            <a o class="nav-link js-scroll-trigger" href="Homepage.html">Logout</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->

  <header class="masthead">
    <div class="container">
      <div class="intro-text">
      	<div id="wrap", class="abox1" style="width:100%; height:635px; background-size: cover;">
			<a>
			
				<table align="center" width ="700" height="300">
  


  <form method="POST" action="Problem_List.jsp">
     
                        	<input type="hidden" name="loginId" value="<%= LoginID %>">
                        	<input type="hidden" name="Level" value="<%= priv %>">
                       
                        
                         
                         
                           <h1 class="bp-header__title">My account</h1>
                                          						<%
							StudentEntity ent = studdb.getStudentEntity(sNum);
						%>
                               <h2 class="bp-info">
                                    <td width="50"> ID:                </td>
                                    <td> <label><%= LoginID %></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<h2><td width="50"> <label>StudentID:           </label> </td>
                                    <td> <label><%= sNum %></label> </td></h2>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"> <label>LEVEL:             </label> </td>
                                    <td> <label><%= priv %></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"> <label>Name:</label> </td>
                                    <td> <label><%=ent.getName()%></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"><label>E-Mail:</label> </td>
                                    <td> <label><%=ent.getEmail()%></label> </td>
                                </tr>
                                <br>
                                <tr>
                                	<td width="50"><label>Phone Number:</label> </td>
                                    <td> <label><%=ent.getPhone()%></label> </td>
                                </tr>	
                                <br>	
                                
                                </h1>						 
								<tr class="bp-tbadmin">
								<br>
								</tr>
								</h2>
								</table>
<%
								if (priv.equals("2"))
								{
%>
                                    <td>
                                    <center>
                                    	<input  class="bt-admin -flower" type="submit" value="ADMIN">
                                    </center>
                                    </td>
<%
                                }
%>

		
			
		</div>

        
    
    </div>
  </header>

  <!-- Services -->
  <section class="page-section" id="services">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">Services</h2>
          <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
        </div>
      </div>
      <div class="row text-center">
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">E-Commerce</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">Responsive Design</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
        <div class="col-md-4">
          <span class="fa-stack fa-4x">
            <i class="fas fa-circle fa-stack-2x text-primary"></i>
            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
          </span>
          <h4 class="service-heading">Web Security</h4>
          <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
        </div>
      </div>
    </div>
  </section>


</body>

</html>
