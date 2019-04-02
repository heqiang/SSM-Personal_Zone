<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery.js" type="text/javascript"></script>
          <link rel="stylesheet" media="screen" href="css/style.css">
        <script type="text/javascript">
        function check_name(){
			var f=false;
			var  username=$("#username").val();
			if(username==""){
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
	    					$("#usernametip").text("用户名正确").css("color", "red");
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
        
        	  function  check_pwd1(){
				var pwd = document.getElementById("password1").value;
				var pwd1 = document.getElementById("passwordtip1");
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
		function check_pwd2() {
			var pwd = document.getElementById("password1").value;
			var pwd1 = document.getElementById("password2").value;
			var pwd2=document.getElementById("passwordtip2");
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
		
        </script>
    </head>
    <body id="particles-js">
    	<form action="resetpwd" method="post">
    	<div class="resetpwd">
    		<table align="center"  valign="center">
    				<tr>
    					<th>请输入你的用户名：</th>
    					<th><input type="text" name="username" onblur="check_name()">
    						<span id="usernametip"></span>
    					</th>
    					
    				</tr>
    				<tr>
    					<th>请输入你的密码：</th>
    					<th><input type="password" name="password" id="password1" onblur="check_pwd1()">
    					<span id="passwordtip1"></span>
    					</th>
    					
    				</tr>
    				<tr>
    					<th>请再次输入你的密码：</th>
    					<th><input type="password" name="password1"id="password2"onblur="check_pwd2()">
    					<span id="passwordtip2"></span></th>
    					
    				</tr>
    				<tr>
    					<th><input type="submit" value="确认"></th>
    				</tr>
    				${message}
    		</table>
    	</div>
    		
    	</form>
 	</body>
</html>