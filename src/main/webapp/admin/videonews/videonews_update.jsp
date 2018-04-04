<%@page import="com.jingshuai.bean.VideoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>修改视频信息</title>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./admin/css/mine.css" type="text/css" rel="stylesheet">
</head>
<body>
<div class="div_head">
	<span> <span style="float: left">当前位置是：图片位置管理-》修改用户信息</span> <span
		style="float: right; margin-right: 8px; font-weight: bold"> <a
			style="text-decoration: none" href="">【返回】</a>
	</span>
	</span>
</div>
<div>
<span style="color: red" id="message"><%=request.getAttribute("message") != null ? request
					.getAttribute("message") : ""%> </span>
</div>



<%
		VideoBean videoBean = (VideoBean) session
				.getAttribute("videoBean");
		if (videoBean != null) {
			
		
	%>
	<div>
	<form action="./UpdateVideoNewsServlet" method="post">
			<table border="1" width="100%" class="table_a">
				<tr>
					<td>新闻编号：</td>
					<td><%=videoBean.getVoideoid()%>
					<input type="hidden" name="videonews_id"
					value="<%=videoBean.getVoideoid()%>" />
					</td>
				</tr>
				<tr>
					<td>新闻标题</td>
					<td><input type="text" name="videonews_title"
					value="<%=videoBean.getVideotitle()%>" />
					</td>
				</tr>
				
				
				<tr>
					<td>新闻作者</td>
					<td><input type="text" name="videonews_authorname"
					value="<%=videoBean.getVideoauthorname()%>" />
					</td>
				</tr>
				
				<tr>
					<td>视频地址</td>
					<td><input type="text" name="videonews_address"
					value="<%=videoBean.getVideoaddress()%>" />
					
					</td>
				</tr>
				
				
				 </table>
				   <input type="submit" value="修改">
				   <a href="./videonewsListServlet"> 返回</a> 
		</form>
		  
		 
		<%
			} else {
				request.setAttribute("message", "无位置信息");
				request.getRequestDispatcher("./videonewsListServlet").forward(
						request, response);
			}
		%>
		
		</div>
</body>
</html>