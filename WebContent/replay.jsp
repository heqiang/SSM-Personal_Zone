<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>留言板</title>
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/message.css">
	</head>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script>
		var ti;
		$(document).ready(
			function() {
				$("#userinfo").mouseover(function() {
					$("#usernameshow").fadeIn(200);
				});
				$("#usernameshow").mouseover(function() {
					clearTimeout(ti);
					$("#usernameshow").show();
				});
				$("#usernameshow").mouseout(function() {
					$("#usernameshow").hide();
				});
				$("#userinfo").mouseout(function() {
					$("#usernameshow").stop(false, true);
					ti = setTimeout(function() {
						$("#usernameshow").hide();
					}, 100);
				});
				$(".messageuserreply").click(function() {
					var a = this.id;
					$("[id$='div" + a + "']").toggle();
				});
				$(".cancelinput").click(function() {
					$(this).parents(".messageuserreplydiv").hide();
				});
			});
	</script>

	<body>
		<%
	 	String name="NULLUSER";
	 	ResultSet userinfo=null;
		ResultSet messageinfo=null;
		ResultSet userallinfo=null;
		Map map=new HashMap();
		Iterator it=null;
		Set keySet=null;
		int i=1;
	 	if(session.getAttribute("nowuserinfo")!=null){
	 		userinfo=(ResultSet)session.getAttribute("nowuserinfo");
	 		userinfo.beforeFirst();
	 		userinfo.next();
	 		name=userinfo.getString("name"); 		
	 	}
	 	if(session.getAttribute("messageinfo")!=null){
	 		messageinfo=(ResultSet)session.getAttribute("messageinfo");
	 	}
		if(session.getAttribute("userallinfo")!=null){
			userallinfo=(ResultSet)session.getAttribute("userallinfo");
		}
		if(session.getAttribute("replymessage")!=null){
			map=(Map)session.getAttribute("replymessage");
			keySet=map.keySet();
			it=keySet.iterator();
			while(it.hasNext()){
				Object key=it.next();
				Object value=map.get(key);
				System.out.println(key+":"+value);
			}
		}
	  %>
		<div id="bigtop">
			<div id="top">
				<div id="topcontentleft">
					<div class="topbg">
						<a>博客首页</a>
					</div>
				</div>
				<div id="topcontentright">
					<div id="userlogininfo">
						<span class="welcomeuser">欢迎你，</span>
						<span id="userinfo"><%=name %></span>
						<div class="showdivuserinfo">
							<ul id="usernameshow" style="display:none">
								<li>个人中心</li>
								<li>这是测试</li>
								<li style="border:0px">注销登录</li>
							</ul>
						</div>
					</div>
					<div>
						<ul class="topul">
							<li>
								<div class="nrmessage">消息中心<span class="badge">3</span></div>
							</li>
							<li style="border-right: none">
								<a href="#">退出登陆</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div>
				<!-- 留言展示内容 -->
				<div class="MessagecontentBigBox">
					<!-- 内容外层div -->
					<div class="MessagecontentBigBox-top">
						<font>留言板</font>
					</div>
					<script type="text/javascript">
						function checkdata() {
							var a = document.getElementById("messagecontent").value;
							if(a == null || a == "") {
								alert("输入不能为空！发布失败。");
								return false;
							}
						}
					</script>
					<div class="messageinfodiv">
						<div class="publishmessage">
							<form action="AddMessageBy" method="post" onsubmit="return checkdata()">
								<div class="publishmessagein"><textarea maxlength="60" rows="" cols="" id="messagecontent" name="messagecontent"></textarea></div>
								<div class="publishmessagebutton"><input type="submit" value="发送">&nbsp;&nbsp;
									<input type="reset" value="取消"> </div>
							</form>
						</div>
						<ul>
							<% 
		int idi=1;
		 while(messageinfo.next()){
			String thisuserid=null;
			String thisusername=null;
			String thislogurl=null;
			String thismessagecontent=null;
			String thismessagereply=null;
			String thismessageid=null;
			if(messageinfo.getString("wuid")!=null||messageinfo.getString("wuid")!=""){
				thisuserid=messageinfo.getString("wuid"); 
				while(userallinfo.next()){
					if(userallinfo.getString("uid").equals(messageinfo.getString("wuid"))){
						thisusername=userallinfo.getString("name");
						thislogurl=userallinfo.getString("userimg");
						thismessagecontent=messageinfo.getString("MessageText");
						thismessagereply=messageinfo.getString("ReplyMessage");
						thismessageid=messageinfo.getString("MessageId");
						break;
				}
			}
			userallinfo.beforeFirst();
		}
		%>
							<li class="thismessageinfodiv">
								<img src="<%=thislogurl %>" class="messageuserimg" />
								<font class="messageusername">
									<%=thisusername %>
								</font>
								<br/>
								<p class="messageusercontent">
									<c:out value="<%=thismessagecontent %>" escapeXml="true" default="加载失败，请重试!"></c:out>
								</p>
								<p class="messageusertime">
									<%=messageinfo.getString("writetime") %>
								</p>
								<font class="messageuserreply" id="<%=idi %>">回复</font>
								<%
		if(thismessagereply!=null){
		i=1;
		keySet=map.keySet();//获取键的集合
		it=keySet.iterator();//迭代键的集合
		//System.out.print(it.hasNext());
		%>
								<div class="messagereplydiv">
									<%
		while(it.hasNext()){
			Object key=it.next();
			Object value=map.get(key);//获取每个键所对应的值
			Object srcurl=map.get(thismessageid+":"+i+".5");
			Object thisname=map.get(thismessageid+":"+i+".4");
			Object thisreplycontent=map.get(thismessageid+":"+i+".2");
			Object thisreplytime=map.get(thismessageid+":"+i+".3");
			System.out.print(thisname);
			if(srcurl==null)break;
		%>
									<img class="messagereplyimg" src="<%=srcurl %>">
									<font class="messagereplyname">
										<%=thisname %>
									</font>
									<font class="messagereplycontent">
										<%=thisreplycontent %>
									</font>
									<p class="messagereplytime">
										<%=thisreplytime %>
									</p>
									<% i++;	} %>
								</div>
								<% } %>
								<div class="messageuserreplydiv" id="replybigdiv<%=idi %>" style="display: none">
									<form action="MessageUserReply" method="post" id="replymessageform">
										<!-- <form action="" method="post" id="replymessageform<%=thismessageid %>"> -->
										<input type="hidden" name="thismessageid" value="<%=thismessageid %>" />
										<textarea rows="" cols="" id="replycontent" name="replycontent"></textarea><br/>
										<input type="submit" value="确定">&nbsp;&nbsp;
										<input type="reset" value="取消" class="cancelinput">
									</form>
									<script>
										$(document).ready(function() {
											$('#replymessageform<%=thismessageid %>').submit(function() {
												$msid = $("#replymessageform<%=thismessageid %> input[name='thismessageid']").val();
												if($msid != <%=thismessageid %>) {
													return false;
												}
											});
										});
									</script>
								</div>
							</li>
							<% idi++; } %>
						</ul>

					</div>
				</div>
			</div>
		</div>
	</body>

</html>