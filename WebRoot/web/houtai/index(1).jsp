<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/struts-tags" prefix="ws" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>棒棒堂后台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="${basePath}/web/common/sea/css/lanren.css" rel="stylesheet" type="text/css"/>
	<link href="${basePath}/web/common/jspanel-4-beta/jspanel.min.css" rel="stylesheet" type="text/css"/>
  </head>
  
  <body>
	<!-- 代码部分begin -->
	<div class="index-con" style="z-index: 0">
	 <ul>
	    <li class="in-kct in-course">
			<a  onclick="user();" title="用户">
				<div class="in-block">
					<i class="bigger"></i>
					<span class="ch show" style="display: block;">用户</span>
					<i class="in-none"></i>
					<span class="in-text" style="display: none;">
						<p><em>用户</em>&nbsp;&nbsp;<em>人员</em> </p>
					</span>
				</div>
			</a>
		</li>
		
	    <li class="in-kct in-quest">
	    	<a onclick="kcgl();" title="课程管理">
				<div class="in-block">
					<i class=""></i>
					<span style="display: inline;">课程管理</span>
					<i class="in-none"></i>
					<span class="in-text" style="display: none; width: 280px; left: 30px">
						<p><em>精确</em>&nbsp;&nbsp;<em>针对</em></p>
					</span>
				</div>
			</a>
		</li>
		
	    <li class="in-jbk in-plan">
			<a onclick="xwdt();" title="新闻动态">
				<div class="in-block">
					<i style="display: block;"></i>
					<span style="display: inline;">新闻动态</span>
					<i class="in-none toLeft1" style="display: none;"></i>
					<span class="in-text" style="display: none;">
						<p>最新</p>
						<p>消息</p>
					</span>
				</div>
			</a>
		</li>
	    <li class="in-jbk in-report">
			<a onclick="kcly();" title="课程留言">
				<div class="in-block">
					<i style="display: block;"></i>
					<span class="ch" style="display: inline;">课程留言</span>
					<i class="in-none toLeft0 toLeft4" style="display: none;"></i>
					<span class="in-text" style="display: none;">
						<p>精确</p>
						<p>针对</p>
					</span>
				</div>
			</a>
		</li>
		
	    <li class="in-zxl in-forma">
			<a onclick="zymd();" title="直营门店">
				<div class="in-block">
					<i style="display: block;"></i>
					<span style="display: inline;">直营门店</span>
					<i class="in-none toLeft0 toLeft4" style="display: none;"></i>
					<span class="in-text" style="display: none;">
						<p>地址</p>
						<p>定位</p>
					</span>
				</div>
			</a>
		</li>
		
	    <li class="in-zxl in-means">
			<a onclick="shopcar();" title="课程报名">
				<div class="in-block"> 
					<i style="display: block;"></i>
					<span style="display: inline;">课程报名</span>
					<i class="in-none toLeft0 toLeft4" style="display: none;"></i>
					<span class="in-text" style="display: none;">
						<p>课程</p>
						<p>报名</p>
					</span>
				</div>
			</a>
		</li>
		
	    <li class="in-jbk in-client">
			<a onclick="alert('有待开发');" target="_blank" title="供应商">
				<div class="in-block">
					<i></i>
					<span>有待开发</span>
					<i class="in-none"></i>
					<span class="in-text">
						<p>开发</p>
						<p>开发</p>
					</span>
				</div>
			</a>
		</li>
		
	  </ul>
	</div>
	<script src="${basePath}/web/common/sea/js/core.js" type="text/javascript"></script>
	<script src="${basePath}/web/common/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
	<script src="${basePath}/web/common/jspanel-4-beta/jspanel.min.js" type="text/javascript"></script>
	<script src="${basePath}/web/common/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js" type="text/javascript"></script>
	<script>
	    seajs.use('jquery',function($) {
	        $(function () {
	             //
	            $(".index-con .in-kct").hover(function() {
	                $(this).find('i:first').addClass('smaller').removeClass('bigger');
	                $(this).find('span:first').fadeOut('');
	                $(this).find('.in-text').show('fast').addClass('show');
	                $(this).find('.ch').removeClass('');
	            }, function() {
	                $(this).find('i:first').removeClass('smaller').addClass('bigger');
	                $(this).find('span:first').fadeIn('');
	                $(this).find('.in-text').hide('').removeClass('fast');
	                $(this).find('.ch').addClass('show');
	            });
	            
	            $(".index-con .in-jbk").hover(function() {
	                $(this).find('i:first').addClass('hide');
	                $(this).find('span:first').hide('');
	                $(this).find('.in-text').show('').addClass('show');
	                var num = $(this).index('.in-jbk') + 1;
	                $(this).find('.in-none').show('').addClass('toLeft' + num).removeClass('toRight' + num);
	                $(this).find('.ch1').removeClass('show');
	            }, function() {
	                $(this).find('i:first').addClass('hide');
	                $(this).find('span:first').fadeIn('');
	                $(this).find('.in-text').hide('').removeClass('show');
	                var num = $(this).index('.in-jbk') + 1;
	                $(this).find('.in-none').show().addClass('toRight' + num).removeClass('toLeft' + num);
	                $(this).find('.ch1').addClass('show');
	            });
	            
	            $(".index-con .in-zxl").hover(function() {
	                $(this).find('i:first').addClass('hide');
	                $(this).find('span:first').hide('');
	                $(this).find('.in-text').show().addClass('show');
	                var nums = $(this).index('.in-zxl') + 1;
	                $(this).find('.in-none').show().addClass('toLeft4').removeClass('toRight4');
	                $(this).find('.ch2').removeClass('show');
	            }, function() {
	                $(this).find('i:first').addClass('hide');
	                $(this).find('span:first').fadeIn('fast');
	                $(this).find('.in-text').hide().removeClass('show');
	                $(this).find('.in-none').show().addClass('toRight4').removeClass('toLeft4');
	                $(this).find('.ch2').addClass('show');
	            });
	        });
	    });
	    
	    //panel关闭状态处理
	    document.addEventListener('jspanelclosed', function (event) {
		    if (event.detail === 'user_panel') {
		       userStatus = false;
		    }else if(event.detail == 'kcly_panel'){
		    	kclyStatus = false;
		    }else if(event.detail == 'xwdt_panel'){
		    	xwdtStatus = false;
		    }else if(event.detail == 'kcgl_panel'){
		    	kcglStatus = false;
		    }else if(event.detail == 'zymd_panel'){
		    	zymdStatus = false;
		    }
		    else if(event.detail == 'shopcar_panel'){
		    	shopcarStatus = false;
		    }
		});
	    
	    //用户
	    var userPanel;
	    var userStatus = false;
	    function user(){
	    	if(userStatus==false){
				userPanel = jsPanel.create({
					id: 'user_panel',
				    theme: 'primary',
				    contentSize: {
				        width: "1080px",
				        height: "470px"
				    },
				    position: {
				        my: 'center',
				        at: 'center'
				    },
				    animateIn: 'jsPanelFadeIn',
				    headerTitle: '用户',
				    content: '<iframe onload="userStatus = true;" src="userList.action" id="userBox" name="userBox" style="overflow:hidden;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>',
					onwindowresize: false
				});
			}else{
				userPanel.normalize();
			}
		}
		
		//课程留言
		var kclyPanel;
	    var kclyStatus = false;
	    function kcly(){
	    	if(kclyStatus==false){
				kclyPanel = jsPanel.create({
					id: 'kcly_panel',
				    theme: 'primary',
				    contentSize: {
				        width: "1000px",
				        height: "470px"
				    },
				    position: {
				        my: 'center',
				        at: 'center'
				    },
				    animateIn: 'jsPanelFadeIn',
				    headerTitle: '课程留言',
				    content: '<iframe onload="kclyStatus = true;" src="kclyList.action" id="kclyBox" name="kclyBox" style="overflow:hidden;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>',
					onwindowresize: false
				});
			}else{
				kclyPanel.normalize();
			}
		}
		
		//课程报名
		var shopcarPanel;
	    var shopcarStatus = false;
	    function shopcar(){
	    	if(shopcarStatus==false){
				shopcarPanel = jsPanel.create({
					id: 'shopcar_panel',
				    theme: 'primary',
				    contentSize: {
				        width: "1000px",
				        height: "470px"
				    },
				    position: {
				        my: 'center',
				        at: 'center'
				    },
				    animateIn: 'jsPanelFadeIn',
				    headerTitle: '课程报名',
				    content: '<iframe onload="shopcarStatus = true;" src="shopcarList.action" id="shopcarBox" name="shopcarBox" style="overflow:hidden;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>',
					onwindowresize: false
				});
			}else{
				shopcarPanel.normalize();
			}
		}
		
		//新闻动态
		var xwdtPanel;
	    var xwdtStatus = false;
	    function xwdt(){
	    	if(xwdtStatus==false){
				xwdtPanel = jsPanel.create({
					id: 'xwdt_panel',
				    theme: 'primary',
				    contentSize: {
				        width: "1000px",
				        height: "470px"
				    },
				    position: {
				        my: 'center',
				        at: 'center'
				    },
				    animateIn: 'jsPanelFadeIn',
				    headerTitle: '新闻动态',
				    content: '<iframe onload="xwdtStatus = true;" src="xwdtList.action" id="xwdtBox" name="xwdtBox" style="overflow:hidden;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>',
					onwindowresize: false
				});
			}else{
				xwdtPanel.normalize();
			}
		}
		
		
		//课程管理
		var kcglPanel;
	    var kcglStatus = false;
	    function kcgl(){
	    	if(kcglStatus==false){
				kcglPanel = jsPanel.create({
					id: 'kcgl_panel',
				    theme: 'primary',
				    contentSize: {
				        width: "1000px",
				        height: "470px"
				    },
				    position: {
				        my: 'center',
				        at: 'center'
				    },
				    animateIn: 'jsPanelFadeIn',
				    headerTitle: '课程管理',
					content: '<iframe onload="kcglStatus = true;" src="kcglList.action" id="kcglBox" name="kcglBox" style="overflow:hidden;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>',
					onwindowresize: false
				});
			}else{
				kcglPanel.normalize();
			}
		}
		
		//直营门店
		var zymdPanel;
	    var zymdStatus = false;
	    function zymd(){
	    	if(zymdStatus==false){
				zymdPanel = jsPanel.create({
					id: 'zymd_panel',
				    theme: 'primary',
				    contentSize: {
				        width: "1000px",
				        height: "470px"
				    },
				    position: {
				        my: 'center',
				        at: 'center'
				    },
				    animateIn: 'jsPanelFadeIn',
				    headerTitle: '直营门店',
					content: '<iframe onload="zymdStatus = true;" src="zymdList.action" id="zymdBox" name="zymdBox" style="overflow:hidden;" scrolling="yes" frameborder="0" width="100%" height="100%"></iframe>',
					onwindowresize: false
				});
			}else{
				zymdPanel.normalize();
			}
		}
	</script>
	<!-- 代码部分end -->
  </body>
</html>
