<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD//XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!-- 引入bootstrap样式 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入bootstrap-table样式 -->
<link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">

<!-- jquery -->
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- bootstrap-table.min.js -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

<!-- 引入中文语言包 -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>

<title>位置信息列表</title>

<style type="text/css">
.tr_color {
	background-color: #9F88FF
}
</style>

	


<link href="./admin/css/mine.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
	/**
	
	var param = {};
	param.id=5;
	$.ajax({
	    url:'./news/queryNewsByCondition.do',
	 //   type:'POST', //GET
	    async:true,    //或false,是否异步
	    data:param,
	    timeout:5000,    //超时时间
	    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
	    success:function(data,textStatus,jqXHR){
	    	alert("fanhui");
	    	console.log(data);
			
	        console.log(data);
	        console.log(textStatus);
	        console.log(jqXHR);
	    },
	    error:function(xhr,textStatus){
	        console.log('错误');
	        console.log(xhr);
	        console.log(textStatus);
	    }
	})*/
	
	
	$("#table").bootstrapTable({ // 对应table标签的id
	      url: "./news/queryNewsByCondition", // 获取表格数据的url
	      cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
	      striped: true,  //表格显示条纹，默认为false
	      pagination: true, // 在表格底部显示分页组件，默认false
	      pageList: [10, 20], // 设置页面可以显示的数据条数
	      pageSize: 10, // 页面数据条数
	      pageNumber: 1, // 首页页码
	      sidePagination: 'server', // 设置为服务器端分页
	      dataType:"json",
	      queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求

	          return {
	              pageSize: params.limit, // 每页要显示的数据条数
	              offset: params.offset, // 每页显示数据的开始行号
	              sort: params.sort, // 要排序的字段
	              sortOrder: params.order, // 排序规则
	              dataId: $("#dataId").val() // 额外添加的参数
	          }
	      },
	      
	      sortName: 'id', // 要排序的字段
	      sortOrder: 'desc', // 排序规则
	      columns: [
	           {
	              field: 'id', // 返回json数据中的name
	              title: '序号', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'title', // 返回json数据中的name
	              title: '编号', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'time', // 返回json数据中的name
	              title: '时间', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle' // 上下居中
	          }, {
	              field: 'categoryid', // 返回json数据中的name
	              title: '分类', // 表格表头显示文字
	              align: 'center', // 左右居中
	              valign: 'middle', // 上下居中
	              formatter: function (value, row, index){ // 单元格格式化函数
	                  var text = '-';
	                  if (value == 1) {
	                      text = "科技";
	                  } else if (value == 2) {
	                      text = "娱乐";
	                  } else if (value == 3) {
	                      text = "财经";
	                  } else if (value == 4) {
	                      text = "文化";
	                  } else if (value == 5) {
	                      text = "汽车";
	                  } else if (value == 6) {
	                      text = "体育";
	                  } else if (value == 7) {
	                      text = "国际";
	                  } else if (value == 8) {
	                      text = "要闻";
	                  } else if (value == 9) {
	                      text = "汽车";
	                  } else if (value == 10) {
	                      text = "社会";
	                  }
	                  return text;
	              }
	          
	          }, {
	              title: "操作",
	              align: 'center',
	              valign: 'middle',
	              width: 160, // 定义列的宽度，单位为像素px
	              formatter: function (value, row, index) {
	                  return '<button class="btn btn-primary btn-sm" onclick="del(\'' + row.id + '\')">删除</button>';
	              }
	          }
	        
	      ],
	      onLoadSuccess: function(){  //加载成功时执行
	            console.info("加载成功");
	      },
	      onLoadError: function(){  //加载失败时执行
	            console.info("加载数据失败");
	      }

	})

})

function del(id){



	
	var param = {};
	param.id = id;
	$.ajax({
	    url:'./news/new.do',
	    type:'DELETE', //GET
	    async:true,    //或false,是否异步
	    data:param,
	    timeout:5000,    //超时时间
	    success:function(data,textStatus,jqXHR){
	    	alert("删除成功");
	    	console.log(data);
			
	        console.log(data);
	        console.log(textStatus);
	        console.log(jqXHR);
	    },
	    error:function(xhr,textStatus){
	        console.log('错误');
	        console.log(xhr);
	        console.log(textStatus);
	    }
	})
}


</script>
</head>
<body>
	
<table id="table">

</table>


</body>
</html>