<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>登录</title>
  <!--<base href="${pageContext.request.contextPath }/"/> -->
  <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
  <meta name="author" content="Vincent Garreau" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" media="screen" href="css/style.css">
  <link rel="stylesheet" type="text/css" href="css/reset.css"/>
</head>
<body>

<div id="particles-js">
		<div class="login">
			<div class="login-top">
				用户登录
			</div>
				<form action="login" method="post">
						
						<div class="login-center clearfix">
						<div class="login-center-img"><img src="img/name.png"/></div>
						<div class="login-center-input">
							<input type="text" name="username"  placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
							<div class="login-center-input-text">用户名</div>
						</div>
					</div>
					
					<div class="login-center clearfix">
						<div class="login-center-img"><img src="img/password.png"/></div>
						<div class="login-center-input">
							<input type="password" name="password" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
							<div class="login-center-input-text">密码</div>
						</div>
					</div>
					
					<div >
							<input type="submit"value="登录" name="Submit" class="login-button"/>
					</div>
				<div>
					<a href>
				</div>
				<div class="regist">
					<span>没有账号？</span>
						<a href="regist.jsp" >去注册</a>
				</div>
				
				<div class="sk-rotating-plane"></div>
				${message}
				<div class="reset">
				    <span>  </span>
					<a href="resetpwd.jsp">忘记密码？</a>
				</div>
			</form>
		</div>	
</div>




</body>
</html>

</body>
</html>