<%@page import="com.jingshuai.bean.NewsBean"%>
<%@page import="java.util.List"%>
<%@page import="java.io.*" %>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="http://mat1.gtimg.com/www/base/base.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.Xslider.js"></script>
<script>


</script>
<style type="text/css">
body {
	font:12px "宋体","Arial Narrow",HELVETICA;
	background:#fff;
	-webkit-text-size-adjust:100%;
	
}
#navigation:focus {

	outline: none
}

#channel_nav_title {
	display: none
}

#channel_nav_title {
	display: none
}

.channelNav {
	width: 1000px;
	height: 37px;
	margin: 0 auto;
	border-top: 3px solid #cb0d0d;
	font: 14px/36px "simsun";
	position: relative;
	background: #fff
}

#channelNavPart {
	float: left;
	margin: 0;
	padding: 0;
	box-shadow: 0 0 1px #ccc;
}

.channelNavPart li {
	float: left;
	width: 63px;
	text-align: center;
	margin: 0 0 0 -1px;
	padding: 0;
	list-style: none
}

.channelNavPart a {
	color: #252525;
	display: block;
	text-decoration: none;
	border-left: 1px solid #dedede;
	border-right: 1px solid #dedede;
	border-bottom: 1px solid #dedede;
	width: 61px
}

.channelNavPart a.current, .channelNavPart a.current:hover,
	.channelNavPart a:hover {
	background: #dc0000;
	border: 1px solid #dc0000;
	border-width: 0 1px 1px;
	color: #fff
}

.channelNavPart li#navlinkXwg {
	width: 70px;
}

.channelNavPart li#navlinkXwg a {
	width: 68px;
}
.all{width:1000px;
margin: 0 auto;}
.topBar li {
	float: left
}

}
.topBar li {
	list-style: none;
}

.topBar {
	width: 1000px;
	margin: 0 auto;
	height: 35px;
	font: 12px/35px "simsun";
	position: relative;
	z-index: 10;
	*zoom: 1
}


.banner {
	border-bottom: 1px solid #e9e9e9;
	background: url(http://mat1.gtimg.com/news/news2013/login/topBar.jpg)
		repeat-x;
	padding-top: 2px;
	color: #5c5c5c;
	height: 36px
}
 .Q-tpList{border-bottom:1px solid #f0f0f0;}

.discuzBtn:hover{background:url(http://mat1.gtimg.com/news/news2013/img/icons.png) no-repeat 0 -399px;display:block}
.discuzBtn{margin-left:12px;padding:0 5px 0 16px;font:12px/14px "Tahoma";background:url(http://mat1.gtimg.com/news/news2013/img/icons.png) no-repeat 0 -79px}
.discuzBtn{float:right;display:inline;cursor:pointer;}

 
</style>
<div class="banner" id="topNav" style="position: relative; z-index: 10;">
	<div class="topBar" bosszone="topBar">

		<ul>
			<li><h2 id="site_nav_title">新闻网</h2></li>
			<li><h6>2016-3-27</h6>
			<li class="login" style="float:right"><h3>登陆</h3></li>
		</ul>

	</div>
</div>

</head>
<body>
<div class="all">


	<div class="channelNav">
	
		<div role="navigation" aria-labelledby="channel_nav_title"
			aria-owns="channelNavPart" tabindex="0" id="navigation">
			<ul id="channelNavPart" class="channelNavPart">
				<li id="newsIndexLink"><a href="./ShowTitleServlet?categoryid=1"
					 class="current" bosszone="topnav1">首页</a></li>
				<li><a href="./ShowTitleServlet?categoryid=8" target="_blank"
					class="linkRoll" bosszone="topnav2">要闻</a></li>
				<li><a href="./ShowTitleServlet?categoryid=3"
					 class="navlinkChina" bosszone="topnav3">财经</a></li>
				<li><a href="./ShowTitleServlet?categoryid=6"
					target="_blank" class="navlinkWorld" bosszone="topnav4">体育</a></li>
				<li><a href="./ShowTitleServlet?categoryid=10"
					target="_blank" class="navlinkSociety" bosszone="topnav5">社会</a></li>
				<li><a href="./ShowTitleServlet?categoryid=3"
					class="navlinkPhoto" bosszone="topnav6">娱乐</a></li>
				<li><a href="./ShowTitleServlet?categoryid=4" 
					class="navlinkVideo" bosszone="topnav7">文化</a></li>
				<li><a href="./ShowTitleServlet?categoryid=7" 
					class="navlinkMil" bosszone="topnav8">国际</a></li>
				<li><a href="http://view.news.qq.com/" target="_blank"
					class="navlinkView" bosszone="topnav9">评论</a></li>
				<li><a href="http://history.news.qq.com/" target="_blank"
					class="navlinkHistory" bosszone="topnav10">历史</a></li>
				<li><a href="http://cul.qq.com/" target="_blank"
					class="navlinkWh" bosszone="topnav13">文化</a></li>
				<li><a href="http://news.qq.com/newspedia/all.htm"
					target="_blank" class="navlinkWiki" bosszone="topnav11">百科</a></li>
				<li><a href="http://gongyi.qq.com/" target="_blank"
					class="navlinkGy" bosszone="topnav12">公益</a></li>
				<li><a href="http://city.qq.com/" target="_blank"
					class="navlinkCs" bosszone="topnav13">城市</a></li>
				<li><a href="http://media.news.qq.com/" target="_blank"
					class="navlinkCm" bosszone="topnav14">传媒</a></li>
				<li id="navlinkXwg"><a href="http://xinwenge.qq.com/ "
					target="_blank" class="navlinkXwg" bosszone="topnav15">新闻哥</a></li>
			</ul>
		</div>
	</div>


<!-- 
<div class="test" style="z-index:70;padding-top:10px;padding-bottom:10px" >
<a target="_blank" class="pic" bosszone="news27" href="http://news.qq.com/a/20160326/002753.htm">
<img class="picto" src="http://inews.gtimg.com/newsapp_ls/0/224040321_150120/0" style="height:90px;width:150px"></a>
<em class="f14 l24" bosszone="news27">
<span><a target="_blank" class="linkto" href="./NewsContentServlet" style="font-size:24px">房子压力下的年轻人：夫妻犹豫一晚房价涨10万</a></span></em>
<a class="discuzBtn" title="评论数" target="_blank" bosszone="news6p" href="http://coral.qq.com/1352112310">934</a>
<p class="l22" style="font-size:15px;padding-top:15px">我开始慌了。我在上海七八年了突然给变成没房一族了？！</p></div> -->
<div id="mysummary">
<%List<NewsBean> list=(List<NewsBean>)request.getAttribute("NewsTitlelist"); 

if(list != null && !list.isEmpty()){
	for(NewsBean newsBean:list){	
		

	%>
	<div class="Q-tpList" style="z-index:70;padding-top:20px;padding-bottom:20px" >
<a target="_blank" class="pic" href="./NewsContentServlet?id=<%=newsBean.getId()%>">

<%if(newsBean.getPictureaddress().equals("0")){
	%>
	<img class="picto" src="./image/aa.jpg" style="height:100px;width:150px" ></a>
	<%
	
}else{%>
	<img class="picto" src=<%=newsBean.getPictureaddress() %> style="height:100px;width:150px" /></a>
	<%
}	%>



<em class="f14 l24" >
<span><a target="_blank" class="linkto" href="http:./NewsContentServlet?id=<%=newsBean.getId()%>" style="font-size:24px;color:#000000;"><%=newsBean.getTitle() %></a></span></em>

<a class="discuzBtn" title="评论数" target="_blank" bosszone="news6p" href="http://coral.qq.com/1352112310">934</a>
<% String words="";
if(newsBean.getKeywords()!=null){
	words=newsBean.getKeywords();
	
}	%>

<p class="l22" style="font-size:15px;padding-top:15px"><%=words %></p></div>
	
	<% 
	}
}

%>
</div>





<div style="width:1000px;text-align:center">
<button id="morenews" style="font-size:20px;border-width:0px;width:500px;height:30px;background:#D9D9D9;margin-bottom:100px;margin-top:20px" onclick="myFunction()">加载更多</button>
</div>
<%int categoryid1=0;

String cateString=(String)request.getAttribute("categoryid");
	categoryid1=Integer.parseInt(cateString);

%>
<div id="mycategory" style="display:none"><%=categoryid1 %></div>
<script type="text/javascript" src="./js/ajax.js"></script>
<script type="text/javascript">
var page=1;
var categoryid;

$(function ($) {
	
	categoryid=document.getElementById("mycategory").innerHTML;
});
function myFunction()
{
	


	
	 var ajax = createXMLHttp();  
	  var method = "post";  
     var url = "./MoreNews"; 
     ajax.open(method,url,true);  
     ajax.setRequestHeader("content-type","application/x-www-form-urlencoded"); 
     var content = "page="+ page+"&categoryid="+categoryid;  
     ajax.send(content);  
  
   	  ajax.onreadystatechange = function(){  
             //判断响应状态和响应码  
                 if(ajax.readyState==4){  
                     if(ajax.status){  
                   	  var text = ajax.responseText; 
                   	  if(text==""||text==null){
                   		document.getElementById("morenews").innerHTML="已全部加载完成";
                   	  }else{
                   		  $("#mysummary").append(text);
                       	  ++page;
                   	  }
                   	
                        
                     }  
                   
                 } 
	
   	  };
}
</script>
</div>

</body>
</html>