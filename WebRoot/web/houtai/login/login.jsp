<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="utf-8">
<title>棒棒堂后台登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->

<link rel="stylesheet" href="${basePath}/web/common/login/css/supersized.css">
<link rel="stylesheet" href="${basePath}/web/common/login/css/login.css">
<link href="${basePath}/web/common/login/css/bootstrap.min.css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- 基本 js -->
<script src="${basePath}/web/common/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<style type="text/css">
.info{
	color: red;
}
</style>
<script type="text/javascript">
		//验证码刷新 
		function reloadcode(obj,base){
			var rand=new Date().getTime();
			obj.src=base+"/randomCode.action?abc="+rand;
		}
		
		function checkpwd(){
			var name = $("input[name='user.name']").val();
			
			if(name==""){
				$("input[name='user.name']").next().html("用户为空");
			}
			
			var pwd = $("input[name='user.pwd']").val();
			
			if(pwd==""){
				$("input[name='user.pwd']").next().html("密码为空");
			}
			
			var checkNum = $("input[name='checkNum']").val();
			
			if(checkNum==""){
				$("#captcha_img").next().html("验证码为空");
			}
			
			
			if(name!=""){
				$.post("checkName_root.action?date"+Math.random(),{'user.name':name},function(data){
					var obj = eval("("+data+")");
					if(obj.flag==false){
						$("input[name='user.name']").next().html("用户不存在");
					}else{
						$.post("checkpwd_root.action?date"+Math.random(),{'user.name':name, "user.pwd":pwd, "checkNum": checkNum},function(data){
							var obj = eval("("+data+")");
							if(obj.flag==false){
								if(obj.msg=="密码错误"){
									$("input[name='user.pwd']").next().html(obj.msg);
								}else{
									$("#captcha_img").next().html(obj.msg);
								}
								
								return;
							}else{
								$("#login_form").submit();
							}
						});
					}
				});
			}
		}
</script>
</head>

<body>

<div class="page-container">
	<div class="main_box">
		<div class="login_box">
			<div class="login_logo">
				<h2>棒棒堂后台</h2>
			</div>
			<div class="login_form">
				<form action="${basePath}/login_root.action" id="login_form" method="post">
					<div class="form-group">
						<label for="j_username" class="t">帐　号：</label> 
						<input id="userName" name="user.name" type="text" class="form-control x319 in" autocomplete="off">
						<span class="info"></span>
					</div>
					
					<div class="form-group">
						<label for="j_password" class="t">密　码：</label>
						<input id="password" name="user.pwd" type="password" class="password form-control x319 in">
						<span class="info"></span>
					</div>
					<div class="form-group">
						 <label for="j_captcha" class="t">验证码：</label>
						 <input id="checkNum" name="checkNum" type="text" class="form-control x164 in">
						 <img id="captcha_img" alt="点击更换" title="点击更换" src="${basePath}/randomCode.action" onclick="reloadcode(this,'${basePath}')" class="m">
						 <span class="info"></span>
					</div>
					<div class="form-group space">
						<label class="t"></label>
						<input type="button" id="submit_btn" class="btn btn-primary btn-lg" onclick="checkpwd();" value="登录">
						&nbsp;&nbsp;
						<a href="regRoot.action">注册</a>
					</div>
				</form>
			</div>
		</div>
		<div class="bottom">Copyright &copy; 2019 段易欣</div>
	</div>
</div>
</body>
</html>