<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.jingshuai.bean.NewsBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link type="text/css" rel="stylesheet"
	href="http://mat1.gtimg.com/www/css/article/global_v1.0.4.css" />

<title>Insert title here</title>
<style>
body {
	background: #f7f7f7;
	line-height: 24px;
	color: #393939;
	font-weight: blod
}

.all {
	width: 800px;
	margin: 0 auto;
	padding-bottom: 100px
}

.menu {
	color: #dbeefd;
	float: left;
}

.menu a {
	color: #dbeefd;
	margin: 0 3px;
}

.first {
	height: 35px;
	background: #0080FF
}

.second {
	width: 1000px;
	margin: 0 auto;
}

.nav-Article-QQ {
	outline: none;
}

#moreNav {
	position: relative;
}

#moreNav .moreLink:hover {
	background: none;
}

.moreNav1 {
	display: block;
	padding-right: 10px;
	background: url( http://mat1.gtimg.com/news/dc/images/icon_down.gif)
		no-repeat right center;
}

.moreNav2 {
	display: block;
	padding-right: 10px;
	position: relative;
	background: url( http://mat1.gtimg.com/news/dc/images/icon_up.gif)
		no-repeat right center;
}

.navmenu {
	display: none;
	position: absolute;
	top: 35px;
	background: #379BE9;
	text-align: left;
	width: 74px;
}

.navmenu a:hover {
	background: #1669AB;
}

.nav-Article-QQ {
	z-index: 21;
}

.nav-color {
	color: #FFCC00;
}

.nav-Article-QQ ul .nav-color a, .nav-Article-QQ ul .nav-color a:visited,
	.nav-Article-QQ ul .nav-color a:link, .nav-Article-QQ ul .nav-color a:hover
	{
	color: #FFCC00;
}

.nav-Article-QQ ul li a {
	padding: 5px 7px;
}

.nav-Article-QQ ul li.navKuaibaoStyle a {
	color: #fcff00;
}

@charset "utf-8";

.mask {
	margin: 0;
	padding: 0;
	border: none;
	width: 100%;
	height: 100%;
	background: #333;
	opacity: 0.6;
	filter: alpha(opacity = 60);
	z-index: 9999;
	position: fixed;
	top: 0;
	left: 0;
	display: none;
}

#LoginBox {
	position: absolute;
	left: 460px;
	top: 150px;
	background: white;
	width: 426px;
	height: 282px;
	border: 3px solid #444;
	
	z-index: 10000;
	display: none;
}

.row1 {
	background: #f7f7f7;
	padding: 0px 20px;
	line-height: 50px;
	height: 50px;
	font-weight: bold;
	color: #666;
	font-size: 20px;
}

.row {
	height: 77px;
	line-height: 77px;
	padding: 0px 30px;
	font-family: 华文楷体;
	font-size: x-large;
}

.close_btn {
	font-family: arial;
	font-size: 30px;
	font-weight: 700;
	color: #999;
	text-decoration: none;
	float: right;
	padding-right: 4px;
}

.inputBox {
	border: 1px solid #c3c3c3;
	padding: 1px 3px 6px 3px;
	border-radius: 5px;
	margin-left: 5px;
}

#txtName {
	height: 27px;
	width: 230px;
	border: none;
}

#txtPwd {
	height: 27px;
	width: 230px;
	border: none;
}

.row a{
	color: White;
	background: #4490f7;
	text-decoration: none;
	padding: 10px 50px;
	margin-left:20px;
	margin-top: 40px;
	border-radius: 5px;
	opacity: 0.8;
	filter: alpha(opacity = 80);
}
.dialg{
	color: White;
	background: #4490f7;
	text-decoration: none;
	padding: 10px 50px;
	margin-left:20px;
	
	border-radius: 5px;
	opacity: 0.8;
	filter: alpha(opacity = 80);
}
#username{
color: #6633ff;
font-family: 微软雅黑;
margin:10px;
margin-left:20px;
visibility:hidden;

}

</style>

<script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/ajax.js"></script>
<script type="text/javascript">
var confrimlogin="0";//当0时，没有登录；

	function mOver(obj) {
		obj.style.background = "#000093"

	}

	function mOut(obj) {
		obj.style.background = "#4a4aff"
	}
	function myFunction(x) {

	}
	var ajax = createXMLHttp();  
	  var method = "post";  
   var url = "./ConditionLoginServlet"; 
   ajax.open(method,url,true);  
   ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");  
   var content = "";  
   ajax.send(content); 
 	  ajax.onreadystatechange = function(){  
           //判断响应状态和响应码  
               if(ajax.readyState==4){  
                   if(ajax.status){  
                 	  var text = ajax.responseText; 
                 	  if(text=="0"){
                 		 confrimlogin="0";
                 	  }else{                 		 
                 		 confrimlogin=text;
                 		document.getElementById("inputusername").innerHTML=text;
               			var div3=document.getElementById("username");  
               			div3.style.visibility='visible';
               			 
               			document.getElementById("topusername").innerHTML=text;
               			confrimlogin=text;
                 	  }
                 	}  
                 
               } 
	
 	  };
	
	function myFunction2()
	{
		var username=$('#txtName').val();
		var password=$('#txtPwd').val();
			
		 var ajax = createXMLHttp();  
		 var method = "post";  
	     var url = "./WebLoginConfirm"; 
	     ajax.open(method,url,true);  
	     ajax.setRequestHeader("content-type","application/x-www-form-urlencoded"); 
	     var content = "username="+ username+"&password="+password;  
	     ajax.send(content);  
	  
	   	  ajax.onreadystatechange = function(){  
	             //判断响应状态和响应码  
	                 if(ajax.readyState==4){  
	                     if(ajax.status){  
	                   	  var text = ajax.responseText; 
	                   	  if(text==""||text==null){
	                   		
	                   	  }else{
	                   		  
	                   		  if(text=="true"){
	                   			document.getElementById("inputusername").innerHTML=username;
	                   			var div3=document.getElementById("username");  
	                   			div3.style.visibility='visible';
	                   			 
	                   			document.getElementById("topusername").innerHTML=username;
	                   			confrimlogin=username;
	                   			$("#LoginBox").fadeOut("fast");
	                			$("#mask").css({
	                				display : 'none'
	                			});
	                   		  }
	                   	  }
	                   	
	                        
	                     }  
	                   
	                 } 
		
	   	  };
	}
	function center(obj) {
		var screenWidth = $(window).width(), screenHeight = $(window)
				.height(); //当前浏览器窗口的 宽高 
		var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度 
		var objTop = (screenHeight - obj.height()) / 2 + scrolltop;
		obj.css({
			top : objTop + 'px'
		});
	}
	
	$(function($) {
		   
		//弹出登录
		
		$(".commentimage").on('click', function() {
			
			if(confrimlogin=="0"){
				center($('#LoginBox'));
				$(".all").append("<div id='mask'></div>");
				$("#mask").addClass("mask").fadeIn("slow");
				$("#LoginBox").fadeIn("slow");
			}else{
				var comment=$('.ee').val();
			
				var newsid;
				newsid=document.getElementById("hiddenid").innerHTML;
				
				 var ajax = createXMLHttp();  
				  var method = "post";  
			     var url = "./AddCommentServlet"; 
			     ajax.open(method,url,true);  
			     ajax.setRequestHeader("content-type","application/x-www-form-urlencoded"); 
			     var content = "username="+ confrimlogin+"&newid="+newsid+"&comment="+comment;  
			     ajax.send(content);  
			  
			   	  ajax.onreadystatechange = function(){  
			             //判断响应状态和响应码  
			                 if(ajax.readyState==4){  
			                     if(ajax.status){  
			                   	  var text = ajax.responseText;
			                   	  if(text=="true"){
			                   		  var dd="";
			                   		document.getElementById("mytext").innerText="";
			                   		
			                   		  alert("评论成功");
			                   		
			                   	  }
			                   	}  
			                   
			                 } 
				
			   	  };
			}
			

		});
		//
		//按钮的透明度
		$(".row a").hover(function() {
			$(this).stop().animate({
				opacity : '1'
			}, 600);
		}, function() {
			$(this).stop().animate({
				opacity : '0.8'
			}, 600);
		});
		//文本框不允许为空---按钮触发
		$("#loginbtn").on('click', function() {
			var txtName = $("#txtName").val();
			var txtPwd = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$(".warning").css({
						display : 'block'
					});
				} else {
					$("#warn").css({
						display : 'block'
					});
					$("#warn2").css({
						display : 'none'
					});
				}
			} else {
				if (txtPwd == "" || txtPwd == undefined || txtPwd == null) {
					$("#warn").css({
						display : 'none'
					});
					$(".warn2").css({
						display : 'block'
					});
				} else {
					$(".warning").css({
						display : 'none'
					});
					
					
					
					
					
				}
			}
		});
		//文本框不允许为空---单个文本触发
		$("#txtName").on('blur', function() {
			var txtName = $("#txtName").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn").css({
					display : 'block'
				});
				
			} else {
				$("#warn").css({
					display : 'none'
				});
			}
		});
		$("#txtName").on('focus', function() {
			$("#warn").css({
				display : 'none'
			});
		});
		//
		$("#txtPwd").on('blur', function() {
			var txtName = $("#txtPwd").val();
			if (txtName == "" || txtName == undefined || txtName == null) {
				$("#warn2").css({
					display : 'block'
				});
			} else {
				$("#warn2").css({
					display : 'none'
				});
			}
		});
		$("#txtPwd").on('focus', function() {
			$("#warn2").css({
				display : 'none'
			});
		});
		//关闭
		$(".close_btn").hover(function() {
			$(this).css({
				color : 'black'
			})
		}, function() {
			$(this).css({
				color : '#999'
			})
		}).on('click', function()

		{
			$("#LoginBox").fadeOut("fast");
			$("#mask").css({
				display : 'none'
			});
		});
	});
</script>
</head>
<body>

	<div class="first">
		<div class="second">
			<div class="nav-Article-QQ clearfix" accesskey="2" title=""
				tabindex="-1">
				<ul class="clearfix" bosszone="mainNav">
					<li><a href="http://www.qq.com" target="_blank" title="腾讯网首页"
						accesskey="1">首页</a></li>
					<li><a href="http://news.qq.com" target="_blank">新闻</a></li>
					<li><a href="http://sports.qq.com" target="_blank">体育</a></li>
					<li><a href="http://ent.qq.com" target="_blank">娱乐</a></li>
					<li><a href="http://v.qq.com" target="_blank">视频</a></li>
					<li><a href="http://finance.qq.com" target="_blank">财经</a></li>
					<li><a href="http://stock.qq.com/" target="_blank">证券</a></li>
					<li><a href="http://auto.qq.com" target="_blank">汽车</a></li>
					<li><a href="http://house.qq.com" target="_blank">房产</a></li>
					<li><a href="http://tech.qq.com" target="_blank">科技</a></li>
					<li><a href="http://digi.qq.com" target="_blank">数码</a></li>
					<li><a href="http://games.qq.com" target="_blank">游戏</a></li>
					<li><a href="http://edu.qq.com" target="_blank">教育</a></li>
					<li><a href="http://fashion.qq.com/" target="_blank">时尚</a></li>
					<li><a href="http://cul.qq.com" target="_blank">文化</a></li>
					<li bosszone="kuaibao" class="navKuaibaoStyle"><a
						href="http://kb.qq.com/" target="_blank">快报</a></li>
					<li bosszone="more" id="moreNav"><a class="moreLink"><span
							class="moreNav1" id="moreNav1">更多</span></a>
						<div class="navmenu" id="navmenu">
							<a href="http://comic.qq.com/" target="_blank">动漫</a> <a
								href="http://book.qq.com/" target="_blank">读书</a> <a
								href="http://kid.qq.com/" target="_blank">儿童</a> <a
								href="http://astro.lady.qq.com/" target="_blank">星座</a> <a
								href="http://class.qq.com/" target="_blank">精品课</a> <a
								href="http://www.qq.com/map/" target="_blank">全部频道</a>
						</div> <!-- /navmenu --></li>


				</ul>
			</div>
			<div style="float: right; padding-top: 4px" class="login">
				<a id="topusername" class="commentimage" style="font-size: 14px; color: #fff" href="#">登录</a>
			</div>
		</div>
	</div>


	<div class="all">
<div>
		<div>
			<img src="./image/log.jpg"
				style="height: 50px; width: 110px; margin-bottom: 10px"></img>
		</div>
		<%
			NewsBean newsBean = (NewsBean) request.getAttribute("newsBean");
			if (newsBean != null) {
		%><div
			style="background-color: #FFFFFF; border-top: 2px solid #dbeefd; border-bottom: 2px solid #dbeefd; border-left: 2px solid #dbeefd; border-right: 2px solid #dbeefd; padding-bottom: 40px">
			<div class=tilte
				style="font-size: 30px; text-align: center; padding-top: 25px;">
				<%=newsBean.getTitle()%>
			</div>
			<div class=time
				style="font-size: 12px; text-align: center; padding-bottom: 15px; border-bottom: 1px solid #dedede; padding-top: 10px">
					<%
					String tsStr = "";
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

							//方法一   
							tsStr = sdf.format(newsBean.getTime());
				%>
				<%=tsStr%>
			</div>
<div id="hiddenid" style="display:none"><%=newsBean.getId() %></div>
			<div class=content style="padding-left: 30px; padding-right: 30px">
				<%
					if (!newsBean.getPictureaddress().equals("0")) {
				%>
				<div style="text-align: center; padding-top: 50px">
					<img alt="" src=<%=newsBean.getPictureaddress()%>
						style="height: 400px; width: 600px">
				</div>
				<%
					}
				%>

				<%
					if (!newsBean.getVideoaddress().equals("0")) {
				%>
				<div style="text-align: center; padding-top: 50px;"></div>
				<%
					}
				%>
				<!--  <p style="TEXT-INDENT: 2em">  </p>-->
				<%=newsBean.getContent()%>
			</div>

		</div>
		<%
			}
		%>
		<!--  	<div
			style="height: 206px; border-bottom: 2px solid #7d7dff; border-top: 2px solid #7d7dff; border-left: 2px solid #7d7dff; border-right: 2px solid #7d7dff; margin-top: 20px; margin-bottom: 20px">
			<div style="height:150px;border-bottom:2px solid #dedeff;text-align:center;padding-top:6px" >
			<textarea rows="10" cols="125" style="background-color:#f7f7f7;overflow:auto; background-attachment:   fixed;   background-repeat:   no-repeat;   border-style:   solid; 
        " ></textarea></div>
			
		</div>-->
		</div>
		<div style="margin-top: 50px;" >

			<div>
				<font style="font-size: 25px; font-family: 微软雅黑;">网友评论</font> <font
					style="font-size: 15px; color: #46a3ff">文明上网理性发言，请遵守新闻评论服务协议</font>
				<font style="font-size: 15px; color: #46a3ff; float: right">条评论</font>
				
				<a href="./OneArtComments?news_id=<%=newsBean.getId()%>"
					style="font-size: 15px; float: right; margin-right: 40px; color: ff2d2d; font-family: 微软雅黑"  >他人评论</a>
			</div>

			<textarea id= "mytext" class="ee"  
				style="font-family: 微软雅黑; font-size: 20px; height: 110px; width: 780px; background-color: #f7f7f7; border: solid 1px #7d7dff; outline: none; margin-top: 10px; padding-top: 10px; padding-left: 10px; padding-right: 10px;"></textarea>
		</div>
		<div
			style="height: 48px; width: 800px; border-bottom: 1px solid #7d7dff; border-left: 1px solid #7d7dff; border-right: 1px solid #7d7dff;">
			<div style="height: 48px; width: 650px; float: left;font-size:20px;" id="username">
			用户名：<a id="inputusername"></a></div>
			<div style="text-align: center; height: 48px; padding-top: 8px"
				class="dd">
				<ul>
				
					<li><input onmouseover="mOver(this)" onmouseout="mOut(this)"
						type="submit" class="commentimage" value="发表评论"
						
						style="border: 0px; background: #4a4aff; color: #FFFFFF; height: 32px; width: 90px; font-size: 15px; border-radius: 5px;" />
					</li>
				</ul>
			</div>
		</div>
	</div>




	<div id="LoginBox">
		<div class="row1">
			账号登录<a href="javascript:void(0)" title="关闭窗口" class="close_btn"
				id="closeBtn">×</a>
		</div>
		<div class="row">
			用户名:<span class="inputBox"> <input type="text" id="txtName"
				placeholder="账号/邮箱" style="outline: none;font-size:15px" />
			</span>
		</div>
		<div class="row">
			密&nbsp;&nbsp;码:<span class="inputBox"> <input type="text"
				id="txtPwd" placeholder="密码" style="outline: none;font-size:15px" />
			</span>
		</div>
		<div class="row">
			<button id="loginbtn" class="dialg" onclick="myFunction2()">登录</button>
			<button  class="dialg" id="register">注册</button>
		</div>
	</div>

	<script type="text/javascript">
		
	</script>

</body>
</html>