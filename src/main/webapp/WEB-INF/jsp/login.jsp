<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>用户登录</title>
<style>
.error {
	color: red;
	text-align: left;
	height: 20px;
}

body {
	background-color: #336699;
}

#container {
	width: 490px;
	height: 304px;
	margin-top: 200px;
	margin-left: 600px;
	background-color: #3366CC;
	border-style: double;
	border-color: #FFFFFF;
	border-radius: 15px;
}

.table {
	width: 490px;
	height: 304px;
	padding: 10px 40px;
	background-color: #003366;
	font-family: "Microsoft Yahei";
	font-size: 100%;
	font-weight: bold;
	color: #FFFFFF;
	border-radius: 15px;
}

input {
	width: 100%;
	padding: 12px 20px;
	box-sizing: border-box;
}

.checkbox_left {
	padding: 0px;
	width: 20px;
}
</style>
</head>
<body>
	<div id="container">
		<form action="" method="post">
			<table class="table">
				<tr>
					<td></td>
					<td><div class="error">${error}</div></td>
				</tr>
				<tr>
					<td>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
					<td><input type="text" name="username" value="<shiro:principal/>" autofocus="autofocus" placeholder="请输入用户名"></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
					<td><input type="password" name="password" placeholder="请输入密码"></td>
				</tr>

				<tr>
					<td>记&nbsp;&nbsp;住&nbsp;&nbsp;我：</td>
					<td>
						<div class="checkbox_left">
							<input type="checkbox" name="rememberMe" value="true">
						</div>
					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="登录"></td>
				</tr>
			</table>
		</form>

	</div>
</body>
</html>