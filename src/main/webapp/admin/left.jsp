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
<base href="<%=basePath%>" />
<meta http-equiv=content-type content="text/html; charset=utf-8" />
<link href="./admin/css/admin.css" type="text/css" rel="stylesheet" />
<script language=javascript>
	function expand(el) {
		childobj = document.getElementById("child" + el);

		if (childobj.style.display == 'none') {
			childobj.style.display = 'block';
		} else {
			childobj.style.display = 'none';
		}
		return;
	}
</script>
</head>
<body>
	<table height="100%" cellspacing=0 cellpadding=0 width=170
		background=./admin/img/menu_bg.jpg border=0>
		<tr>
			<td valign=top align="center">

				<table cellspacing=0 cellpadding=0 width="100%" border=0>

					<tr>
						<td height=10></td>
					</tr>
				</table>
				<table cellspacing=0 cellpadding=0 width=150 border=0>
					<tr height=22>
						<td style="padding-left: 30px" background=./admin/img/menu_bt.jpg><a
							class=menuparent onclick=expand(1) href="javascript:void(0);">图片位置管理</a></td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table>

				<table id=child1 style="display: none" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="./admin/img/menu_icon.gif" width=9></td>
						<td><a class=menuchild
							href="./admin/location/location_add.jsp" target=right>添加位置信息</a></td>
					</tr>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="./admin/img/menu_icon.gif" width=9></td>
						<td><a class=menuchild href="./FetchLocationServlet"
							target=right>位置信息列表</a></td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
				</table>

				<table cellspacing=0 cellpadding=0 width=150 border=0>
					<tr>
						<td>
							<table cellspacing=0 cellpadding=0 width="100%" border=0>
								<tr>
									<td height=10></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr height=22>

						<td style="padding-left: 30px" background=./admin/img/menu_bt.jpg>

							<a class=menuparent onclick=expand(78) href="javascript:void(0);">商品信息管理</a>
						</td>
					</tr>
					<tr height=4>
						<td></td>
					</tr>
				</table>
				<table id=child78 style="display: none" cellspacing=0 cellpadding=0
					width=150 border=0>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="./admin/img/menu_icon.gif" width=9></td>
						<td><a class=menuchild href="./admin/product/product_add.jsp"
							target=right>添加商品信息</a></td>
					</tr>
					<tr height=20>
						<td align="center" width=30><img height=9
							src="./admin/img/menu_icon.gif" width=9></td>
						<td><a class=menuchild href="./ProductListServlet"
							target=right>商品信息列表</a></td>
					</tr>
					<tr height=4>
						<td colspan=2></td>
					</tr>
				</table>
				<!-- 视频新闻管理 -->
				<table height="100%" cellspacing=0 cellpadding=0 width=170
					background=./admin/img/menu_bg.jpg border=0>
					<tr>
						<td valign=top align="center">
							<table cellspacing=0 cellpadding=0 width="100%" border=0>
								<tr>
									<td height=10></td>
								</tr>
							</table>
							<table cellspacing=0 cellpadding=0 width=150 border=0>
								<tr height=22>
									<td style="padding-left: 30px"
										background=./admin/img/menu_bt.jpg><a class=menuparent
										onclick=expand(100) href="javascript:void(0);">视频新闻管理</a></td>
								</tr>
								<tr height=4>
									<td></td>
								</tr>
							</table>

							<table id=child100 style="display: none" cellspacing=0
								cellpadding=0 width=150 border=0>
								<tr height=20>
									<td align="center" width=30><img height=9
										src="./admin/img/menu_icon.gif" width=9></td>
									<td><a class=menuchild
										href="./admin/videonews/videonews_add.jsp" target=right>添加视频新闻</a></td>
								</tr>
								<tr height=20>
									<td align="center" width=30><img height=9
										src="./admin/img/menu_icon.gif" width=9></td>
									<td><a class=menuchild href="./videonewsListServlet"
										target=right>视频新闻列表</a></td>
								</tr>
								<tr height=4>
									<td colspan=2></td>
								</tr>
							</table>
						</td>
					</tr>
				</table> <!-- 新闻管理88 -->
				<table height="100%" cellspacing=0 cellpadding=0 width=170
					background=./admin/img/menu_bg.jpg border=0>
					<tr>
						<td valign=top align="center">
							<table cellspacing=0 cellpadding=0 width="100%" border=0>
								<tr>
									<td height=10></td>
								</tr>
							</table>
							<table cellspacing=0 cellpadding=0 width=150 border=0>

								<tr height=22>
									<td style="padding-left: 30px"
										background=./admin/img/menu_bt.jpg><a class=menuparent
										onclick=expand(88) href="javascript:void(0);">新闻管理</a></td>
								</tr>
								<tr height=4>
									<td></td>
								</tr>
							</table>
							<table id=child88 style="display: none" cellspacing=0
								cellpadding=0 width=150 border=0>
								<tr height=20>
									<td align="center" width=30><img height=9
										src="./admin/img/menu_icon.gif" width=9></td>
									<td><a class=menuchild href="./admin/news/news_add.jsp"
										target=right>添加新闻</a></td>
								</tr>
								<tr height=20>
									<td align="center" width=30><img height=9
										src="./admin/img/menu_icon.gif" width=9></td>
									<td><a class=menuchild href="./admin/news/news_list.jsp"
										target=right>新闻列表</a></td>
								</tr>
								<tr height=4>
									<td colspan=2></td>
								</tr>
							</table>
						</td>
					</tr>
				</table> <!-- 系统管理  2 -->
				<table height="100%" cellspacing=0 cellpadding=0 width=170
					background=./admin/img/menu_bg.jpg border=0>
					<tr>
						<td valign=top align="center">
							<table cellspacing=0 cellpadding=0 width="100%" border=0>

								<tr>
									<td height=10></td>
								</tr>
							</table>
							<table cellspacing=0 cellpadding=0 width=150 border=0>

								<tr height=22>
									<td style="padding-left: 30px"
										background=./admin/img/menu_bt.jpg><a class=menuparent
										onclick=expand(2) href="javascript:void(0);">系统管理</a></td>
								</tr>
								<tr height=4>
									<td></td>
								</tr>
							</table>
							<table id=child2 style="display: none" cellspacing=0
								cellpadding=0 width=150 border=0>
								<tr height=20>
									<td align="center" width=30><img height=9
										src="./admin/img/menu_icon.gif" width=9></td>
									<td><a class=menuchild href="modifyPassword.html"
										target=right>修改密码</a></td>
								</tr>
								<tr height=4>
									<td colspan=2></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>