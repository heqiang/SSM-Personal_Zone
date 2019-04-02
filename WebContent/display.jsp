<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/all.css"/>
<title>好友资料</title>
</head>
<body id="tupian">
	<a  href="myzone.jsp">主页</a>
								<hr/>
	<div align="center"><h1>${friendinfo.username}个人信息列表</h1></div>
    	<table align="center" border="1">
    		<tr>
    			<th>姓名	</th>
    			<th>邮箱</th>
    			<th>住址</th>
    		</tr>
    		<tr>
    			<td>${friendinfo.username}</td>
    			<td>${friendinfo.email}</td>
    			<td>${friendinfo.address}</td>	
    		</tr>
		</table>
	<hr/>
</body>
</html>