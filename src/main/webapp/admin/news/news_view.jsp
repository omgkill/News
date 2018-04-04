
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
<title>用户信息页面</title>
</head>
<body>
<%
NewsBean newsBean = (NewsBean)request.getAttribute("newsBean");
//若存在该用户实例
if(newsBean != null){
%>
<div style="font-size: 13px; margin: 10px 5px">
<table border="1" width="100%" class="table_a">
<tr >
<th colspan="2"><h3>新闻信息</h3></th></tr>
<tr><td width="20%">新闻编号：</td>   <td><%=newsBean.getId() %></td></tr>
<tr><td>新闻种类：</td>   <td><%=newsBean.getCategoryid() %></td></tr>
<tr><td>新闻标题：</td>   <td><%=newsBean.getTitle() %></td></tr>
<tr><td>新闻时间：</td>   <td><%=newsBean.getTime() %></td></tr>
<tr><td>新闻作者:</td>    <td><%=newsBean.getAuthorname() %></td></tr>
<tr><td>新闻关键字：</td>  <td><%=newsBean.getKeywords() %></td></tr>
<tr><td>新闻图片地址：</td> <td><%=newsBean.getPictureaddress() %></td></tr>
<tr><td>新闻视频地址：</td> <td><%=newsBean.getVideoaddress() %></td></tr>
<tr><td height="80%">新闻内容：</td><td><textarea rows="20" cols="100%" name="news_content"><%=newsBean.getContent() %></textarea></td></tr>
</table>
<%
//不存在该用户实例
}else{
	request.setAttribute("message","该新闻信息不存在");
	request.getRequestDispatcher("./NewsListServlet").forward(request, response);
}
%>
</div>
<a href="./NewsListServlet">返回</a>

</body>
</html>