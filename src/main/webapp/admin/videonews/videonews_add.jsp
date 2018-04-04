<%@page import="com.jingshuai.bean.VideoBean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>添加视频新闻</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link href="./admin/css/mine.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="div_head">
		<span> <span style="float: left">当前位置是：位置信息管理-》添加位置信息</span> <span
			style="float: right; margin-right: 8px; font-weight: bold"> <a
				style="text-decoration: none" href="javascript:history.go(-1);">【返回】</a>
		</span>
		</span>
	</div>
	<div>
		<span style="color: red" id="message"><%=request.getAttribute("message") != null ? request.getAttribute("message") : ""%>
		</span>
	</div>
	<div style="font-size: 13px; margin: 10px 5px">
		<h2>添加视频新闻</h2>
		<form action="./AddVideoNewsServlet" method="post"
			enctype="multipart/form-data">
			<table border="1" width="100%" class="table_a">
				<tr style="height: 50px">
					<td>视频新闻标题</td>
					<td><input name="videoname" type="text" /></td>
				</tr>

				<tr style="height: 50px">
					<td>视频新闻作者</td>
					<td><input name="videoauthor" type="text" /></td>
				</tr>
				<tr style="height: 50px">
					<td>上传视频</td>
					<td><input type="file" name="news_videoaddress" /></td>
				</tr>
				<tr style="height: 50px">
					<td colspan="2" ><input type="submit" value="添加" ></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>