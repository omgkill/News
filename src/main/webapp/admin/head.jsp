<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD//XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="./css/admin.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<table cellspacing="0" cellpadding="0" width="100%"
		style="background:url(./img/header_bg.jpg)" border="0">
		<tr style="height:56">
			<td style="width:260"><img style="height:56;width:260"  src="./img/header_left.jpg"
				/></td>
			<td style="font-weight: bold; color: #fff; padding-top: 20px"
				align="center">当前用户：admin &nbsp;&nbsp; <a style="color: #fff"
				href="modifyPassword.html" target=right>修改口令</a> &nbsp;&nbsp; <a
				style="color: #fff"
				onclick="if (confirm('确定要退出吗？')) return true; else return false;"
				href="" target=_top>退出系统</a>
			</td>
			<td align="right" style="width:268"><img height="56"
				src="./img/header_right.jpg" width="268" /></td>
		</tr>
	</table>
	<table cellspacing="0" cellpadding="0" width="100%" border="0">
		<tr style="background: #1c5db6;height:4 ">
			<td></td>
		</tr>
	</table>
</body>
</html>