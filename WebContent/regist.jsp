<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		 <base href="${pageContext.request.contextPath }/"/>
		<link rel="stylesheet" type="text/css" href="css/login.css" />
		<title>Regist</title>
		 <script type="text/javascript" src="js/jquery.min.js"></script>
		<script  type="text/javascript" src="js/jquery-1.8.2.js"></script>
		<script type="text/javascript">

		
			var xmlHttp;
			//获取XMLHttpRequest对象
				function createXMLHttpRequest() {
					try {
						return new XMLHttpRequest();
					} catch (e) {
						try {
							return new ActiveXObject("Msxml2.XMLHTTP");
						} catch (e) {
							try {
								return new ActiveXObject("Microsoft.XMLHTTP");
							} catch (e) {
								alert("您用浏览器，就别用ajax了 吧");
								throw e;
							}
						}
					}
			
				}
			function check_name(){
				var f=false;
				var  username=$("#username").val();
				if(username.length<2||username>6){
					$("#usernametip").text("用户名2-6位").css("color","red");
					f=false;
				}else{
					$("#usernametip").text("");
					$.ajax({
						type: "post",
		                url: "check",
		                datatype:"json",
		                data: {"username": username},   
		                success: function(data) {
		                	console.log(data);
		                	if (data== "success") {
		    					$("#usernametip").text("√").css("color", "red");
		    					f = true;
		    				} else {
		    					$("#usernametip").text("用户名已存在").css("color", "red");
		    					f = false;
		    				}
						},
						
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							alert("ajax请求请求错误");
							alert(XMLHttpRequest.status);
	                        alert(XMLHttpRequest.readyState);
	                        alert(textStatus);
	                       
							f = false;
		    			} 
					});
		           f = false;
		       }
		       return f;
					
					
			}			
			function  check_password(){
				var pwd = document.getElementById("password").value;
				var pwd1 = document.getElementById("passwordtip");
				if(pwd.length<6||pwd.length>14){
					pwd1.innerHTML="密码长度输入有误";
					pwd1.setAttribute("class","input_error");
					return false;
				}else{
					pwd1.innerHTML="√";
					pwd1.setAttribute("class","input_ok");
					return true;
				}
			}
			function check_password2() {
				var pwd = document.getElementById("password").value;
				var pwd1 = document.getElementById("again_password").value;
				var pwd2=document.getElementById("again_passwordtip");
				if(pwd == pwd1) {
					pwd2.innerHTML = "√";
					pwd2.setAttribute("class", "input_ok");
					return true;
				} else {
					pwd2.innerHTML = "两次密码输入不一致";
					pwd2.setAttribute("class", "input_error");
					return false;
				}
		
			}
			
			function check_email() {
				var email = document.getElementById("email").value;
				var reg = new RegExp("\^[A-Za-z0-9]+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}");
				var emailtip = document.getElementById("emailtip")
				if(reg.test(email)) {
					emailtip.innerHTML = "√";
					emailtip.setAttribute("class", "input_ok");
					return true;
				} else {
					emailtip.innerHTML = "邮箱格式不对";
					emailtip.setAttribute("class", "input_error");
					return false;
				}
				
			}
			function  check_address(){
		    	var  adr=document.getElementById("address").value;
		    	var  adr1=document.getElementById("addresstip");
		    	if(adr.length<3||adr.length>20){
		    		adr1.innerHTML="×";
		    		emailtip.setAttribute("class", "input_error");
					return false;
		    		
		    	}else{
		    		adr1.innerHTML="√";
		    		emailtip.setAttribute("class", "input_ok");
					return true;
		    	}
		    }
			
			
		function doSubmit(){
			var form1 = document.getElementById("form");
			if(check_name()&&check_password()&&check_password2()&&check_email()){
				form1.submit();
			}
		}

				
			
		</script>
	</head>

	<body>

		<form action="regist" method="post"  id="form">
			<table align="center">
				<tr>
					<th>
						<h2 align="center">用户注册</h2>
					</th>
				</tr>
				
				<tr>
					<th>
						用户名： &nbsp; &nbsp;<input type="text"name="username" id="username"class="text_field" onblur="check_name()" placeholder="不超过14个字节(数字，字母，下划线)" />
							<span id="usernametip" ></span>
					</th>
				</tr>
				
				<tr>
					<th>
					密 &nbsp;  &nbsp;码：&nbsp;&nbsp;&nbsp;<input type="password" name="password"id="password" class="text_field" placeholder="长度6-14位，字母区分大小写" onblur="check_password()"/>
					<span id="passwordtip"></span>
					</th>
				</tr>
				<tr>
					<th>
						确认密码：<input type="password" id="again_password" class="text_field" placeholder="请再次输入你的密码"onblur="check_password2()"/>
						<span id="again_passwordtip"></span>
					</th>
				</tr>
				
				<tr>
					<th>
					邮 &nbsp; &nbsp; &nbsp; &nbsp;箱：<input type="text" id="email"name="email" class="text_field" placeholder="请输入正确的电子邮箱地址"onblur="check_email()"/>
					<span id="emailtip"></span>
					</th>
				</tr>
				<tr>
					<th>
						地&nbsp; &nbsp; &nbsp; &nbsp;址：<input type="text" id="address"name="address" class="text_field" placeholder="省+市"onblur="check_address()"/>
					<span id="addresstip"></span>
					</th>
				<tr>
				
				<tr>
					<th colspan="2">
						<input type="submit"value="注册" name="Submit"class="regist_button" id="submit"onclick="doSubmit()"/>
					</th>
				</tr>
				<tr>
					<th class="login_href">
						<span>已有账号？</span>
						<a href="login.jsp"><span class="login_href2">去登录</span></a>
					</th>
				</tr>
				<tr>
					<th>
						${message}
					</th>
				</tr>
			</table>
		</form>

	</body>

</html>