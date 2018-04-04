<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD//XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>" />
<title>添加商品</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link href="./admin/css/mine.css" type="text/css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>

<script charset="utf-8" src="../../kindeditor/kindeditor.js"></script>

<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content1"]', {

		});
		prettyPrint();
	});
</script>

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
		
	</div>
	
	<div style="font-size: 13px; margin: 10px 5px">
		<form action="./news/addNews" method="post"
			enctype="multipart/form-data">
			<table border="1" width="100%" class="table_a">
				<tr>
					<td>新闻分类</td>
					<td>
				
							<input type="text" name="categoryid" />
							
						</td>
				</tr>
				
				<tr>
					<td>新闻标题</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr>
					<td>新闻作者</td>
					<td><input type="text" name="authorname" /></td>
				</tr>
				<tr>
					<td>新闻关键字</td>
					<td><input type="text" name="keywords" /><font
						style="color:red">多个关键字请用逗号隔开</font></td>

				</tr>
				<tr>
					<td>新闻图片</td>
					<td>
						<!-- <input type="text" name="news_pictureaddress" /> --> <input
						type="file" name="file" />
					</td>
				</tr>
				<!--  
				<tr>
					<td>新闻视频</td>
					<td><input type="file" name="news_videoaddress" /></td>
				</tr>
				-->
				<tr>
					<td>新闻内容</td>
					<td><textarea name="content1"
							style="width: 700px; height: 300px;"></textarea> <!--<textarea id="content_1" rows="20" cols="100%" name="news_content"></textarea>  -->
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="添加"></td>
				</tr>
			</table>
		</form>

	</div>

</body>
</html>