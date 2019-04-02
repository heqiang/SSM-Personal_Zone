<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<title>${user.username}的空间</title>
    	<link rel="icon" sizes="any" mask href="http://qzonestyle.gtimg.cn/qzone/v8/img/Qzone.svg">
    	<link rel="stylesheet" type="text/css" href="css/qqZone.css">
</head>
<body>
		<form name="myform">
			<input type="text" name="username" hidden name="username" value=${user.username}>
			<input type="text" name ="userid"  hidden name="userid" value=${user.userid}>
		</form>
    <div class="header">
        
    </div>
    <div class="topInfo">
        
    	<div class="zoneName">
    		<h2>${user.username}的空间</h2>
    		<p>知我者，谓我心忧。不知我者，谓我何求。</p>
    	</div>
    	<div class="support">
    		<img src="image/support_1.png" alt="赞">
    		<span class="num">7</span>
    	</div>
    	<div class="tips">7人赞过</div>
    	<!-- bottom nav -->
    	<div class="top_bottom">
    	   <div class="photo">
    	   	  <img src="http://qlogo3.store.qq.com/qzone/1262283870/1262283870/100?1481718124">   
    	   </div>
    	      <div class="uploadphoto">
    	     		<img width="16px" height="16px"
							align="absmiddle" src="images/bg.jpg" /> <a
							title="查看或修改头像" target="_top" href="mess.html">修改头像</a>
					</div>
    	   <div class="container">
    	   	  <ul class="section">
		    	<li><a href="myzone.jsp">主页</a></li>
		        <li><a href="postmessage.jsp">发表说说</a></li>
		        <li><a href="display.jsp">好友资料展示</a></li>
		        <li><a href="personal_info.jsp">个人资料</a></li>
		        <li><a href="MessageBoard.jsp">留言板</a></li>
		        <li><a href="aboutme.jsp">关于我的留言</a></li>
		       	<li><a href="addfriend.jsp">好友</a></li>
    		</ul>
    	   </div>
    	</div>
    </div>
    <!-- 下面实现留言板功能 -->
    <div class="mainframe">
    	<div class="title">留言板</div>
    	<div class="message">主人寄语</div>
    	<div class="info">
    		这是主人留下的寄语~
    	</div>
    	<div class="content" contenteditable="true"></div>
    	<input type="button" name="submit" value="发表" class="subbtn">
    	<div class="numofmessage">留言(0)</div>
    	<!-- 下面是留言区 -->
    	<div class="msgFrame">
 			</div>
         </div>
    </div>
</body>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
   $(".zoneName").hover(function(){
   	   $(".edit").show();
   },function(){
   	   $(".edit").delay(500).hide(0);//延时执行
   })
   //鼠标响应事件
   $(".support").mouseover(function(e){
   	   var left=e.pageX;
   	   var top=e.pageY;
   	   top=top-41;//这里是因为这个元素的父元素使用了margin-top属性，使得top值偏移了41像素。
   	   top=top+25;//加上鼠标自己的高度
   	   console.log(left+"px"+"   top:"+top)
   	   $(".tips").css({"left":left+"px","top":top+"px"});
   	   // $(".tips").delay(800).show(0);加了延时执行后会使得鼠标响应事件不灵敏
   	   // $(".tips").show("slow");
   	   $(".tips").fadeIn();
   })
   /*
    *鼠标离开事件，其中leave是指离开当前元素，而out包括其子元素
   */
   // $(".support").mouseout(function(){
   // 	   $(".tips").hide();
   // })
   $(".support").mouseleave(function(){
   	   console.log("leave");
   	   // $(".tips").css("display","none");
   	   // $(".tips").hide("slow");
   	    $(".tips").fadeOut();
   })
   //修改头像
   $(".photo").hover(function(){
   	   $(".uploadphoto").delay(800).show(0);
   },function(){
   	   $(".uploadphoto").hide();
   }) 
   $(".uploadphoto").hover(function(){
   	   if ($(this).is(":visible")) {
          console.log("visible")
   	   }
   	   else
   	   $(".uploadphoto").show();
   })
   //创建一个div
    function creatDiv(className,closeName,left,top){
          var div =$('<div style="left:' + left + 'px; top:' + top + 'px;"></div>');     
          div.addClass(className);
          $('body').append(div);
          left+=360;
          var close=$('<div style="left:' + left + 'px; top:' + top + 'px;"></div>'); 
          close.addClass(closeName);
          $('body').append(close);
      }     
   $(".uploadphoto").click(function(){
   	   var className='dialog';
   	   var closeName="close";
   	   console.log("点击上传");
   	   creatDiv(className,closeName,500,200);   
   	   $(".close").bind("click",function(){
   	   	      	  $(".dialog").remove();
   	              $(".close").remove();
   	              console.log("关闭成功");
   	              $(".uploadphoto").hide();
   	   });
   })
   
   var count=0;
   $(".subbtn").click(function(){
   	var  username=myform.username.value;
   	var  userid=myform.userid.value;
	var  leavemessagepersonid=myform.userid.value;
   	 var text= $(".content").text();
   	 var time=getCurrentTime();
 	var  userid=myform.userid.value;
   	 if(text==""){
   	 	alert("您还没有输入任何内容！");
   	 }
   	 else{
   	 	loadmessage(text,username,time);
   	 	count++;
   	 	console.log('success!');
   	 	$(".content").text("");
   		//内容传递到后台
   	 	$.ajax({
				type:"post",
				url:"leavemessage",
				async:true,
				datetype:"json",
				data:{"leavemessagecontent":text,"userid":userid,"leavemessagepersonid":leavemessagepersonid},
				
				
			});
   	 	$(".numofmessage").text("留言("+count+")");
   	 }
   })
   function loadmessage(message,id,time){
      	//创建content_index
      	//包含img.name + mainInfo
      	//.userId .conInfo .time
      	var contentDiv='<div class="content_1">';
      	   contentDiv+='<img class="name" src="http://qlogo3.store.qq.com/qzone/1262283870/1262283870/100?1481718124" alt="photo">';
      	   contentDiv+='<div class="mainInfo">'
      	   contentDiv+=' <div class="userId"><a href="#">';
      	   contentDiv+=id;
      	   contentDiv+='</a></div> <div class="conInfo">';
      	   contentDiv+=message;
      	   contentDiv+='</div> <div class="time">';
      	   contentDiv+=time;
      	   contentDiv+='</div> </div> </div>'
           $(".msgFrame").prepend(contentDiv);
   }
   function getCurrentTime(){
   	   var today=new Date();
   	   var y=today.getFullYear();
   	   var mh=today.getMonth();
   	   mh++;
   	   var d=today.getDate();
   	   var h=today.getHours();
   	   var m=today.getMinutes();
   	   var s=today.getSeconds();
   	   m=checkTime(m)
       s=checkTime(s)
       var time=y+"-"+mh+"-"+d+"  "+h+":"+m+":"+s;
       return time;
   }
   function checkTime(i){
       if(i<10)
         i="0"+i
       return i
    }
 
</script>
</html>
