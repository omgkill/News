
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
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

<title>视频新闻列表</title>
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
	<%
		List<VideoBean> videoBeansList = (List<VideoBean>) request.getAttribute("videolist");

		if (videoBeansList != null && !videoBeansList.isEmpty()) {
	%>
	
	
	<div style="font-size: 13px; margin: 10px 5px;">
		<table class="table_a" border="1" width="100%">
			<tr style="font-weight: bold;">
				<td>视频新闻编号</td>				
				<td>视频新闻标题</td>
				<td>视频新闻作者</td>
				<td>视频新闻日期</td>
				<td>操作</td>
			</tr>
			<%
				for (VideoBean videoBean : videoBeansList) {
			%>
			<tr id="product1">
				<td><%=videoBean.getVoideoid()%></td>
				<td><%=videoBean.getVideotitle()%></td>

				<td><%=videoBean.getVideoauthorname()%></td>
				
				<%
					String tsStr = "";
							DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

							tsStr = sdf.format(videoBean.getVideotimestamp());
				%>

				<td><%=tsStr%></td>

				<td>
<a href="file://C:/Web_News/WebContent/upload/uploadvideo/0dd6cb89-0191-43bb-a971-8ec3bf5214ef_01_尚学堂马士兵_Struts2_Struts2简介及学习方法简介.avi"  target="_blank">打开</a>
				<a
					href="./FetchVideoServlet?id=<%=videoBean.getVoideoid()%>">修改</a>
					<a href="./DeleteVideoNewsServlet?id=<%=videoBean.getVoideoid()%>">删除</a>

				</td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
				request.setAttribute("message", "无位置信息，请注册");
				request.getRequestDispatcher("/admin/videonews/videonews_add.jsp").forward(request, response);
				
			}
		%>
		</div>
<div
		style="margin-bottom: 100px; width: 80%; margin-top: 40px; text-align: center">

		<%
			int num = (int) request.getAttribute("number"); //视频新闻总数
			int number = (int) request.getAttribute("num");//页数

			int num2 = num / 30;
			if (num % 30 > 0) {
				num2 = num2 + 1;
			}
		%>
		<span style="font-size: 20px;"> <%
 	if (number == 0) {

 	} else {
 %> <a href="./videonewsListServlet?num=<%=number - 1%>"
			style="text-decoration: none;">上一页</a> <%
 	}
 	for (int i = 0; i < num2; i++) {
 		if (i == number) {
 %> <a href="./videonewsListServlet?num=<%=i%>"
			style="text-decoration: none; color: #0000ff; font-family: 微软雅黑">[<%=i%>]
		</a> <%
 	} else {
 %> <a href="./videonewsListServlet?num=<%=i%>"
			style="text-decoration: none;">[<%=i%>]
		</a> <%
 	}

 	}
 	if (number == (num2- 1)||num2==1) {

 	} else {
 %> <a href="./videonewsListServlet?num=<%=number + 1%>"
			style="text-decoration: none;">下一页</a> <%
 	}
 %>
		</span>
	</div>

		
		
	
</body>
</html>