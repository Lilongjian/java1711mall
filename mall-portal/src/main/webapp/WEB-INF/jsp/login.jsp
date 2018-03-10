<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
	<title>登录.云购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/css/home.css">
	<style type="text/css">
	.center{
	 margin:-80 -800px;
	}
	</style>
</head>
<body>
           <div class="center">
			<div class="fr pc-login-box">
				<div class="pc-login-title"><h2>用户登录</h2></div>
				<form action="">
					<div class="pc-sign">
						<input type="text" placeholder="用户名/邮箱/手机号">
					</div>
					<div class="pc-sign">
						<input type="password" placeholder="请输入您的密码">
					</div>
					<div class="pc-submit-ss">
						<input type="submit" value="登录" placeholder="">
					</div>
					<div class="pc-item-san clearfix">
						<a href="#"><img src="${ctx}/static/front/img/icon/weixin.png" alt="">微信登录</a>
						<a href="#"><img src="${ctx}/static/front/img/icon/weibo.png" alt="">微博登录</a>
						<a href="#" style="margin-right:0"><img src="${ctx}/static/front/img/icon/tengxun.png" alt="">QQ登录</a>
					</div>
					<div class="pc-reg">
						<a href="#">忘记密码</a>
						<a href="register.html" class="red">免费注册</a>
					</div>
				</form>
			
			</div>
			</div>
</body>
</html>