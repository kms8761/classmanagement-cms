<!doctype html>
<html lang="ko">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<head>
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

		</style>
	</head>
	<body>
<form class="w3-container" action="grade.jsp">
	<button onclick="topFunction()" id="top_button">Top</button>
		<hr></hr>
		<nav id=mainNav>
			<ul>
				<li class="topMenuLi">
					<a href="#" onclick="fnMove('1')" class="menuLink">
						<form class="w3-container" action="Notice.jsp">
						
						<strong><input onclick="" type="button" value="Home" class=button1>
						</strong>
					</a>
				</li>
				
				<li class="topMenuLi">
					<a href="#" onclick="fnMove('1')" class="menuLink">
						<form class="w3-container" action="Notice.jsp">
						
						<strong><input onclick="" type="button" value="i-pot" class=button1>
						</strong>
					</a>
				</li>
				<li class="topMenuLi">
					<a href="#" onclick="fnMove('2')" class="menuLink">
									<strong><input onclick="" type="button" value="Test" class=button1>
					</a>
				</li>
				<li class="topMenuLi">
					<a href="#" onclick="fnMove('3')" class="menuLink">
									<strong><input onclick="" type="button" value="notice" class=button1>
					</a>
				</li>
				<li class="topMenuLi">
					<a href="Myaccount.jsp" onclick="fnMove('4')" class="menuLink">
					
					
									<strong><input onclick="" type="button" value="myaccount" class=button1>
									<form class="w3-container" action="Notice.jsp">
					</a>
				</li>
			</ul>			
		</nav>
		<hr></hr>
		<div id="wrap", class="abox1" style="width:100%; height:635px; background-size: cover;">
			<a>
				<br><br><br><br><br><br><br>
				<h2><i>Welcome To i-pot</i></h2>
				<h1>NICE TO MEET YOU<h1>
				

				
				
				


</a>
		</div>
		<hr></hr>
		
	
			<a>			
		
</a>
		</div>
		
		
		
			<a>			
				
				<div>
			<span><img src="faceb.jpg" class="foot_img" style="margin-left:10px";></span>
			<span><img src="insta.png" class="foot_img"></span>
			<span><img src="twit.jpg" class="foot_img"></span>
			<span><img src="chonb.jpg" class="foot_img"></span>
			
		</div>	
		<div style="text-align: center; font-family: arial,Sans-serif; margin-top: 15px;">
			<p>
			name : Kim Minseok, <br>
			phone : 010-3194-9871 
			</p>
			<p>
			이용약관 개인정보처리방침<br>
			Copyright ⓒ  i-pot
			</p>
		</div>
				
				
			</a>
		</div>
	</body>
</html>
