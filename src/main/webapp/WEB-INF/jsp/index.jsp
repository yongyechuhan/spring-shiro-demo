<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<title>后台管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layout-default-latest.css">
<style>
.header {
	font-size: 25px;
	width: 100%;
	float: left;
}

.left {
	width: 1280px;
	margin-left: 5px;
}

.right {
	width: 50px;
	margin-right: 0px;
	text-align: right;
	padding: 0px;
}

.menu {
	margin-left: 50px;
	width: 80px;
	text-decoration: none;
}
.footer{
    text-align: center;
}
</style>
</head>
<body>

	<iframe name="content" class="ui-layout-center" src="${pageContext.request.contextPath}/welcome" frameborder="0" scrolling="auto"></iframe>
	<div class="ui-layout-north">
		<div class="header">
			<div class="header left">
				欢迎 [
				<shiro:principal />
				] 登录云金融服务平台
			</div>
			<div class="header right">
				<a href="${pageContext.request.contextPath}/logout">退出</a>
			</div>
		</div>
	</div>
	<div class="ui-layout-south">
		<div class="footer">
		<p> &copy; 2014-2017 中国银联贵州分公司</p>
		</div>
	</div>
	<div class="ui-layout-west">
		<div class="menu">
			功能菜单<br />
			<c:forEach items="${menus}" var="m">
				<a href="http://localhost:8080${m.url}" target="content">${m.name}</a>
				<br />
			</c:forEach>
		</div>
	</div>


	<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/js/jquery.layout-latest.min.js"></script>
	<script>
		$(function() {
			$(document).ready(function() {
				$('body').layout({
					applyDemoStyles : true
				});
			});
		});
	</script>
</body>
</html>