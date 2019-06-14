<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<head>
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" type="text/css" href="${basePath}/web/common/bootstrap/css/bootstrap.min.css">
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="${basePath}/web/bf/css/style.css" rel='stylesheet' type='text/css' />
<link href="${basePath}/web/bf/css/style-responsive.css" rel="stylesheet"/>
<!-- font-awesome icons -->
<link rel="stylesheet" href="${basePath}/web/bf/css/font.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/web/common/font-awesome-4.7.0/css/font-awesome.min.css" />
<!-- //font-awesome icons -->
<script src="${basePath}/web/common/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<style>
#YHMerror{
width:100%;}
</style>

<script type="text/javascript">
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
				$.post("checkName_user.action?date"+Math.random(),{'user.name':name},function(data){
					var obj = eval("("+data+")");
					if(obj.flag==false){
						$("input[name='user.name']").next().html("用户不存在");
					}else{
						$("input[name='user.name']").next().html("");
						
						$.post("checkpwd_user.action?date"+Math.random(),{'user.name':name, "user.pwd":pwd, "checkNum": checkNum},function(data){
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
<div class="log-w3">
<div class="w3layouts-main">
	<h2>Sign In Now</h2>
		<form id="login_form" action="${basePath}/login_user.action" method="post">
					<input type="text" class="ggg" name="user.name" placeholder="账号" required="" id="username" onfocus="YHMonfocu()" onblur="YHMonblus()">
			<span id="YHMerror" style="color:red"></span>
						
			<input type="password" class="ggg" name="user.pwd" placeholder="密码" required=""id="password" onfocus="MMonfocu(this)" onblur="MMonblus(this)">
			<span id="MMerror" class="mmerror" style="color:red"></span>
			
				<div class="clearfix" style="color:red"></div>
				<input type="button" value="登录" name="login" onclick="checkpwd();" />
		</form>
		<p>还没有账号吗 ?<a href="${basePath}/web/bf/registration.jsp">注册</a></p>
</div>
</div>
<script src="${basePath}/web/bf/js/bootstrap.js"></script>
<script src="${basePath}/web/bf/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${basePath}/web/bf/js/scripts.js"></script>
<script src="${basePath}/web/bf/js/jquery.slimscroll.js"></script>
<script src="${basePath}/web/bf/js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="${basePath}/web/bf/js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="${basePath}/web/bf/js/jquery.scrollTo.js"></script>
<!-- 表单校验 start -->
	<script>
		// 用户名校验
		function YHMonblus() {
			var username = document.getElementById("username");
			// var reN =/^\d{6,18}$/;
			var re = /^[\u4e00-\u9fa5a-zA-Z0-9]{2,10}$/;
			if (username.value == "") {
				document.getElementById('YHMerror').innerText = "请输入用户名";
			}
			else if (username.value.length < 3 || username.value.length > 18) {
				console.log(username.value);
				document.getElementById('YHMerror').innerText = "格式错误,长度应为3-18个字符";
			}
			else {
				document.getElementById('YHMerror').innerText = "";
			}
		}
		function YHMonfocu() {
			document.getElementById('YHMerror').innerText = "";
		}
		//   密码
		function MMonblus() {
			var password = document.getElementById("password");
			var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
			// var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;
			if (password.value == "") {
				document.getElementById('MMerror').innerText = "请输入密码";
			}
			else if (!re.test(password.value)) {
				console.log(password.value);
				document.getElementById('MMerror').innerText = "格式错误,密码长度至少为6位";
			}
			else if(password.value.length < 6){
				document.getElementById('MMerror').innerText = "格式错误,必须包含英文字母大小写和数字";
			}
			else {
				document.getElementById('MMerror').innerText = "";
			}
		}
		function MMonfocu() {
			$("#MMerror").html();
			//document.getElementById('MMerror').text("");
		}
	</script>

    <!-- 表单校验 end -->
</body>
</html>
