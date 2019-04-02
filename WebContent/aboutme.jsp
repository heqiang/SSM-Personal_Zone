<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" type="text/css" href="css/all.css"/>
<title>留言查看</title>
</head>
	<body  id="particles-js">
			<div >
			<div  align="center"><h1>留言查看</h1>
			<h2><a  href="aboutme?userid=${user.userid}">关于我的留言</a></h2>
				<span>${message}</span>
			</div>
				
			
		<hr/>
		
		
		<table align="center"  border="1">
			<tr>
				<th>留言者id</th>
				<th>内容</th>
				<th>留言时间</th>
				<th>操作</th>
			</tr>
			
			<tr>
				<th>${messages.leavemessagepersonid}</th>
				<th>${messages.leavemessagecontent}</th>
				<th>${messages.leavemessagetime}</th>
				<th><a href="deleteleave_message?leavemessageid=${messages.leavemessageid}">删除</a><th>
			</tr>
			<tr>
				<th>${mes}</th>
			</tr>
				
		</table>
		</div>
	
	</body>
</html>