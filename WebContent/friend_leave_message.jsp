<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>留言</title>
	<script src="js/jquery.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/allS.css">
</head>
<body id="particles-js">
	<a href="myzone.jsp">主页</a>
		<div align="center">简易留言板</div>
	<div align="center">
			<form action="personalleavemessage" method="post" > S
				<input type="hidden" class="userid" hidden name="userid" value="${user.userid}"/>
				<input type="hidden" class="leavemessagepersonid" hidden name="leavemessagepersonid" value="<%=request.getParameter("userid") %>"/>
				<input  type="text" class="leavemessagecontent" name="leavemessagecontent" size="1500" style="width:100px;height:100px;"/><br/>
				
			<input type="submit" value="留言">
					
			</form>
			${message}
	</div>
</body>
</html>