<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String Content = null;
	String Name = null;
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

<nav class="pages-nav">
            <div class="pages-nav__item"><a class="link link--page" href="#page-main">Notices &amp; News</a></div>
            <div class="pages-nav__item"><a class="link link--page" href="#page-code">Code board</a></div>
            <div class="pages-nav__item"><a class="link link--page" href="#page-acco">My account</a></div>
            <div class="pages-nav__item pages-nav__item--small"><a class="link link--faded" href="http://right.jbnu.ac.kr:8080/201310902">about</a></div>
            <div class="pages-nav__item pages-nav__item--small"><a class="link link--faded" href="http://jbnu.ac.kr/kor/">jbnu.com</a></div>
            <div class="pages-nav__item pages-nav__item--small"><a class="link link--faded" href="index.html">Logout</a></div>
        </nav>


                  <li>
                               <span><%= date %></span> <span></span></time>
                                <div class="tml_tmicon tml_tmicon-phone"></div>
                                <div class="tml_tmlabel">
                                    <h2><%= Name %></h2>
                                    <p><%= Content %></p>
                                </div>
                            </li>


</body>
</html>