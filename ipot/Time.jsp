<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH)+1;
		int date = cal.get(cal.DATE);
		int hour = cal.get(cal.HOUR);
		int minute = cal.get(cal.MINUTE);
	%>
</body>
</html>