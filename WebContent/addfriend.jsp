<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
 <%
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/zone?autoReconnect=true", "root", "1422127065");    //通过url连接数据库

    String sql = "SELECT * FROM user" ;
    PreparedStatement pstmt = connection.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
     <link rel="stylesheet" type="text/css" href="css/all.css"/>
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" >
	function check_name(){
		var  friendname=document.getElementById("friendname").value;
		
		var  userid=$(".userid").val();
		
		if(friendname==""){
			document.getElementById('nametip').innerHTML="请输入昵称";
		}else{
			
			$.ajax({
				type: "post",
                url: "check_friendname",
                datatype:"json",
                data: {friendname: friendname,userid:userid},   
                success: function(data) {
                	console.log(data);
                	if (data== "fail") {
    					$("#nametip").text("√").css("color", "red");
    					f = true;
    					} else {
    					$("#nametip").text("你已经添加了哦").css("color", "red");
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
		
	</script>
    </head>
    <body id="particles-js">
    		<a href="myzone.jsp">主页</a>
    	<table align="center">
		<form action="addfriend" method="post">
				<input type="text" name ="userid" class="userid"  hidden name="userid" value=${user.userid}>
				
			<tr>
				<th>
					<input type="text" name="friendname" id="friendname" class="friendname" onblur="check_name()"> 
						<span id="nametip"></span>
				</th><br/>
					
			</tr>
			<tr>
				<th><input type="submit" value="添加"></th>
			</tr>
			<tr>
				<th>
					${message}
				</th>
			</tr>
		</form>
		
	</table>	
	<table border="1" cellspacing="1"  align="center" >
    <tr>
     	<th>推荐用户</th>
    </tr>
    <% while(rs.next()){ %>
    <tr>
		<td><%=rs.getString("username") %></td>
    </tr>

    <%} %>
	</table>
	<hr />
 	</body>
</html>