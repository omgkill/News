
<%@page import="com.jingshuai.bean.NewsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./admin/css/mine.css" type="text/css" rel="stylesheet">
<title>用户信息修改页面</title>
<script charset="utf-8" src="./kindeditor/kindeditor.js"></script>

<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="news_content"]', {

		});
		prettyPrint();
	});
</script>
</head>
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
<body>
	<%
		NewsBean newsBean = (NewsBean) session
				.getAttribute("newsBean");
		if (newsBean != null) {
	%>


	<div style="font-size: 13px; margin: 10px 5px">
		<form action="./UpdateNewsServlet" method="post">
			<table border="1" width="100%" class="table_a">
				<tr>
					<td>新闻编号：</td>
					<td><%=newsBean.getId()%>
					<input type="hidden" name="news_id"
					value="<%=newsBean.getId()%>" />
					</td>
				</tr>
				<tr>
					<td>新闻标题</td>
					<td><input type="text" name="news_title"
					value="<%=newsBean.getTitle()%>" />
					</td>
				</tr>
				<tr>
					<td>新闻种类</td>
					<td><input type="text" name="news_categoryid"
					value="<%=newsBean.getCategoryid()%>" />
					</td>
				</tr>
				<tr>
					<td>新闻关键字</td>
					<td><input type="text" name="news_keywords"
					value="<%=newsBean.getKeywords() %>" />
					</td>
				</tr>
				<tr>
					<td>新闻作者</td>
					<td><input type="text" name="news_authorname"
					value="<%=newsBean.getAuthorname()%>" />
					</td>
				</tr>
				<tr>
					<td>图片地址</td>
					<td><input type="text" name="news_pictureaddress"
					value="<%=newsBean.getPictureaddress()%>" />
					</td>
				</tr>
				<tr>
					<td>视频地址</td>
					<td><input type="text" name="news_videoaddress"
					value="<%=newsBean.getVideoaddress()%>" />
					更换  删除
					</td>
				</tr>
				<tr>
					<td>新闻内容</td>
					<td><textarea name="news_content"
							style="width: 700px; height: 300px;" 
					><%=newsBean.getContent()%></textarea>
					</td>
				</tr>
				 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="修改">
                    </td>
                </tr>  
				 </table>
		</form>
		<%
			} else {
				request.setAttribute("message", "无位置信息");
				request.getRequestDispatcher("./NewsListServlet").forward(
						request, response);
			}
		%>
		<a href="./NewsListServlet">返回</a>
</body>
</html>