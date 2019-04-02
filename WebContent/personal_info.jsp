<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员的空间信息页-www.5imb.com</title>
<meta name="author" content="system32">
<script src="js/jquery.js" type="text/javascript"></script>
<script src="js/v2js.js" type="text/javascript"></script>
<link href="css/zone.css" rel="stylesheet">
  <base href="${pageContext.request.contextPath }/"/>
</head>
<body>
<div id="main">
  <div class="layout-head w960">
    <div class="head-info">
    	<h1> ${user.username}的空间</h1>
      <div class="head-description">简介..........</div>
     
    </div>
  </div>
  
  <div class="head_nav">
    <div class="nav_bg"></div>
    <div class="w960">
    <ul>  <li><a href="myzone.jsp">主页</a></li>
        <li><a href="postmessage.jsp">发表说说</a></li>
        <li><a href="display.jsp">好友资料展示</a></li>
        <li><a href="personal_info.jsp">个人资料</a></li>
        <li><a href="MessageBoard.jsp">留言板</a></li>
        <li><a href="aboutme.jsp">关于我的留言</a></li>
       	<li><a href="addfriend.jsp">好友</a></li>
      </ul>
    
    </div>
  </div>
  <div class="layout-body">
    <div class="w960  clf">
      <div class="m_left">
        <div class="inner pd1">
          <table>
          	<tr>
          		<th>关注</th>
          		<th>粉丝</th>
          		<th>分享</th>
          	</tr>
          	<tr>
          		<th>1</th>
          		<th>178</th>
          		<th>20</th>
          	</tr>
          </table>
        </div>
        <div class="inner mt12 p0">
          <div class="hd">
            <h3>个人信息</h3>
          </div>
          <div class="bd">
            <ul class="detail-list">
              <li><i class="i-nc"></i>昵称：<span>${user.username}</span></li>
              <li><i class="i-dj"></i>地址：<span>${user.address}</span></li>
              <li><i class="i-ip"></i>邮箱：<span>${user.email}</span></li>
               <li class="born"><a href="personal_info.jsp">查看详细资料</a></li>
            </ul>
          </div>
        </div>
        <div class="inner mt12 p0">
          <div class="hd">
            <h3>最近访客</h3>
          </div>
          <div class="bd">
            <ul class="avatar-list clf">
              
            </ul>
          </div>
        </div>
      </div>
      <div class="m_main">
        <div class="inner">
          <div class="hd">
            <h3>基本资料</h3>
            
          </div>
          
          <div class="infos"> 
          	<form method="post" action="update">
          		<table>
          			<input type="text"  hidden name="userid" value=${user.userid}>
          			<tr>
          				<th>昵称:&nbsp;&nbsp;&nbsp;<input type="text" name="username" placeholder=${user.username}><br/> </th>
          			</tr>
          			<tr>
          				<th>邮箱：<input type="text" name="email"  placeholder=${user.email}></th>
          			</tr>
          			<tr>
          				<th>地址：<input type="text" name="address" placeholder=${user.address}/></th>
          			</tr>
          			<tr>
          				<th><input type="submit" value="修改"/></th>
          				<th>${update}</th>
          			</tr>
          		</table>
          	</form>
          </div>
        </div>
        <div class="inner">
          <div class="hd">
             <h3>文件上传</h3>
			  </div>
				<form action="fileUpload" method="post" enctype="multipart/form-data" onsubmit="return check()">
				上传人：<input id="name" type="text" name="name" /><br/>
				请选择文件：<input id="file" type="file" name="uploadfile" multiple="multiple"><br/>
				<input type="submit" class="button" value="上传"/>
				</form>
          </div>
        
        </div>
      </div>
    </div>
   
  </div>
</div>
<div>
	
</div>
<a style="opacity: 0;" id="topcontrol" href="javascript:;" title="返回顶部"></a>
</body>
</html>
