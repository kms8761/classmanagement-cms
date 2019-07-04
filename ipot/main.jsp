<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CODEMETER | MAIN</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/psn_component.css">
	<link rel="stylesheet" type="text/css" href="css/tml_component.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/chart.css">
  
	<script>
	var classList = new Array();
	var solvedRate = new Array();

	</script>
    
    <script src="js/Chart.bundle.js"></script>
	<script src="js/utils.js"></script>
    <script src="js/chart.js"></script>
	<script src="js/modernizr-custom.js"></script>

</head>

<body>
    <!-- navigation -->
	<nav class="pages-nav">
            <div class="pages-nav__item"><a class="link link--page" href="#page-main">Notices &amp; News</a></div>
            <div class="pages-nav__item"><a class="link link--page" href="#page-code">Code board</a></div>
            <div class="pages-nav__item"><a class="link link--page" href="#page-acco">My account</a></div>
            <div class="pages-nav__item pages-nav__item--small"><a class="link link--faded" href="http://right.jbnu.ac.kr:8080/201310902">about</a></div>
            <div class="pages-nav__item pages-nav__item--small"><a class="link link--faded" href="http://jbnu.ac.kr/kor/">jbnu.com</a></div>
            <div class="pages-nav__item pages-nav__item--small"><a class="link link--faded" href="index.html">Logout</a></div>
        </nav>
        <!-- /navigation-->
    
        <!-- pages stack -->
        <div class="pages-stack">
            <!-- page -->
            <div class="page" id="page-main">
                <!-- Blueprint header -->
                <div class="bp-scroller">
                    <header class="bp-header cf">
                        <span class="bp-header__present">Codemeter <span class="bp-tooltip bp-icon bp-icon--about" data-content="CBNU Code class helper for professors and students"></span></span>
                        <h1 class="bp-header__title">Notices &amp; News</h1>
                    </header>
                    <div class="tml_main">
                        <ul class="tml_tmtimeline">                
<% 
							for (int i=0; i<blin.size(); i++) 
							{
								timeStamp = blin.get(i).getTimeStamp();
							
								//Function to get title & content
								title = blin.get(i).getTitle();
								content = blin.get(i).getContent();
								
								date = timeStamp.split(" ")[0];
								time = timeStamp.split(" ")[1];
								time = time.substring(0, 5);
%>
                            <li>
                                <time class="tml_tmtime" datetime="<%= timeStamp %>"><span><%= date %></span> <span><%= time %></span></time>
                                <div class="tml_tmicon tml_tmicon-phone"></div>
                                <div class="tml_tmlabel">
                                    <h2><%= title %></h2>
                                    <p><%= content %></p>
                                </div>
                            </li>
<%
							}
%>
                        </ul>
                    </div>
                </div>
            </div>
            
            <!-- /page -->
            <div class="page" id="page-code">
                <div class="bp-scroller">
                    <header class="bp-header cf">
                        <span class="bp-header__present">Codemeter <span class="bp-tooltip bp-icon bp-icon--about" data-content="CBNU Code class helper for professors and students"></span></span>
                        <h1 class="bp-header__title">Code board</h1>
                    </header>
    
                    <div class="limiter">

					
                        <div class="container-table100">
                            <div class="wrap-table100">
                                <div class="table">
                                    <div class="row header">
                                        <div class="cell">
                                            ID
                                        </div>
                                        <div class="cell">
                                            Title
                                        </div>
                                        <div class="cell">
                                            Finish Time
                                        </div>
                                        <div class="cell">
                                            Status
                                        </div>
                                    </div>                    


									<%if (isClickable){%>
                                    <div class="row" onclick="location='Editor2.jsp?code=<%= ID %>&snum=<%= sNum %>'">
									<%} else {%>
									<div class="row">
									<%}%>
                                        <div class="cell">
                                            <%= ID %>
                                        </div>
                                        <div class="cell">
                                            <%= title %>
                                        </div>
                                        <div class="cell">
                                            <%= timeStamp %>
                                        </div>
                                        <div class="cell" style="color:<%= staColor %>">
                                            <%= isSolved %>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
    
            <div class="page" id="page-acco">
                <div class="bp-main">
                    <div class="bp-scroller">
                        <header class="bp-header cf">
                            <span class="bp-header__present">Codemeter
                                <span class="bp-tooltip bp-icon bp-icon--about" data-content="CBNU Code class helper for professors and students"></span>
                            </span>
                            <h1 class="bp-header__title">My account</h1>
                        </header>
						<%
							StudentEntity ent = studdb.getStudentEntity(sNum);
						%>
                        <form method="POST" action="Problem_List.jsp">
                        	<input type="hidden" name="loginId" value="<%= LoginID %>">
                        	<input type="hidden" name="Level" value="<%= priv %>">
                            <table class="bp-info">
                        
                                <tr>
                                    <td> <label>ID</label> </td>
                                    <td> <label><%= LoginID %></label> </td>
                                </tr>
                                
                                <tr>
                                	<td> <label>StudentID</label> </td>
                                    <td> <label><%= sNum %></label> </td>
                                </tr>
                                
                                <tr>
                                	<td> <label>Privilege</label> </td>
                                    <td> <label><%= priv %></label> </td>
                                </tr>
                                
                                <tr>
                                	<td> <label>Name</label> </td>
                                    <td> <label><%=ent.getName()%></label> </td>
                                </tr>
                                
                                <tr>
                                	<td> <label>E-Mail</label> </td>
                                    <td> <label><%=ent.getEmail()%></label> </td>
                                </tr>
                                
                                <tr>
                                	<td> <label>Phone Number</label> </td>
                                    <td> <label><%=ent.getPhone()%></label> </td>
                                </tr>								 
								<tr class="bp-tbadmin">
<%
								if (!priv.equals("0"))
								{
%>
                                    <td>
                                    	<input class="bt-admin -flower" type="submit" value="ADMIN">
                                    </td>
<%
                                }
%>
                                </tr>
                                
                            </table>
                        </form>
                    </div>

                    <div class="bp-chart">
                        <div id="container">
                            <canvas id="canvas"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /pages-stack -->
        <button class="menu-button"><span>Menu</span></button>
        <script src="js/classie.js"></script>
        <script src="js/main.js"></script>
</body>

</html>