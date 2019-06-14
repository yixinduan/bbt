<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="renderer" content="webkit" />
	<meta name="robots" content="index, follow" />
	<title>棒棒堂首页</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="order by website" />
	<link rel="stylesheet" type="text/css" href="${basePath}/web/qiantai/css/font-awesome.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="${basePath}/web/qiantai/css/bootstrap.min.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="${basePath}/web/qiantai/css/dh.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="${basePath}/web/qiantai/css/jquery.mmenu.all.css" />
	<link rel="stylesheet" href="${basePath}/web/qiantai/css/main.css">
	<link rel="stylesheet" href="${basePath}/web/qiantai/css/swiper.min.css">
	<link rel="stylesheet" href="${basePath}/web/qiantai/css/style.css">
</head>

<body>
	<div id="container">
		<!-- 导航样式 start -->
		<header class="clearfix" id="header-sec">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="top-line">
					<div class="container">
						<div class="row">
							<div class="col-md-8 col-sm-9 topbar-left">
								<ul class="info-list">
									<li class="tb-phone">
										<i class="fa fa-phone"></i>
										服务热线: <span>010-80253506</span>
									</li>
									<li class="tb-email">
										<i class="fa fa-envelope-o"></i>
										电子邮箱: <span>service@bbt-kids.com</span>
									</li>
								</ul>
							</div>
							<div class="col-md-4 col-sm-3 topbar-right">
								<ul class="social-icons">
									<c:if test="${empty userName}">
					            		<li>
											<a href="${basePath}/web/bf/login.jsp">
												<i class="fa fa-user" aria-hidden="true"></i>
												<em>登录</em>
											</a>
										</li>
					            	</c:if>					            	
					            	<c:if test="${not empty userName}">
					            		<li>
											<a>
												<i class="fa fa-user" aria-hidden="true"></i>
												<em>${userName}</em>
											</a>
										</li>
					            		<li>
											<a href="${basePath}/logout_user.action">
												<i class="fa fa-user" aria-hidden="true"></i>
												<em>退出</em>
											</a>
										</li>
					            	</c:if>
									<li>
										<a href="javascript:;" target="_blank" data-toggle="modal" data-target="#RegistrationModal">
											<span id="num">0</span>
											<i class="fa fa-cart-plus" aria-hidden="true"></i>									
											<em style="margin-left:10px">购物车</em>							
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-toggle collapsed mmenu-btn" href="#mmenu">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
						<a class="navbar-brand" href="javascript:;">
							<img src="${basePath}/web/qiantai/images/logo.png" alt="" class="logo" />
							<img src="${basePath}/web/qiantai/images/logo-m.png" alt="" class="logo-m" />
						</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right" id="navigation">
							<li class="Lev1">
								<a href="${basePath}/web/qiantai//index.jsp" class='zymd1 active'>网站首页 </a>
							</li>
							<li class="Lev1">
								<a href="#" class="zymd1 ">关于我们
									<i class="fa fa-caret-down"></i>
								</a>
								<ul class="drop-down sub-zymd2">
									<li class="Lev2">
										<a href="${basePath}/web/qiantai//Company-profile.jsp" class="zymd2">公司简介</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">发展历程</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">企业文化</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">员工风采</a>
									</li>
								</ul>
							</li>
							<li class="Lev1">
								<a href="#" class="zymd1 ">新闻动态
									<i class="fa fa-caret-down"></i>
								</a>
								<ul class="drop-down sub-zymd2">
									<li class="Lev2">
										<a href="${basePath}/xwdtList_qt.action" class="zymd2">公司动态</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">活动回顾</a>
									</li>
								</ul>
							</li>
							<li class="Lev1">
								<a href="#" class="zymd1 ">门店展示
									<i class="fa fa-caret-down"></i>
								</a>
								<ul class="drop-down sub-zymd2">
									<li class="Lev2">
										<a href="${basePath}/zymdList_qt.action" class="zymd2">直营门店</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">加盟门店
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</a>
										<ul class="drop-down sub-zymd3">
											<li class="Lev2">
												<a href="#" class="zymd2">加盟信息</a>
											</li>
										</ul>
									</li>
								</ul>
							</li>
							<li class="Lev1">
								<a href="${basePath}/kcglList_qt.action" class="zymd1 ">课程介绍
									 <i class="fa fa-caret-down"></i> 
								</a>
							
								<ul class="drop-down sub-zymd2">
									<li class="Lev2">
										<a href="#" class="zymd2">艺术中心
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</a>
										<ul class="drop-down sub-zymd3">
											<li class="Lev2">
												<a href="course-details.html" class="zymd2">儿童口才课程</a>
											</li>
											<li class="Lev2">
												<a href="#" class="zymd2">儿童戏剧课程</a>
											</li>
										</ul>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">启智课堂
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</a>
										<ul class="drop-down sub-zymd3">
											<li class="Lev2">
												<a href="#" class="zymd2">儿童启智课程</a>
											</li>
										</ul>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">体育运动
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</a>
										<ul class="drop-down sub-zymd3">
											<li class="Lev2">
												<a href="#" class="zymd2">儿童足球课程</a>
											</li>
										</ul>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">亲子课程
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</a>
										<ul class="drop-down sub-zymd3">
											<li class="Lev2">
												<a href="#" class="zymd2">立体绘本课</a>
											</li>
											<li class="Lev2">
												<a href="#" class="zymd2">奥尔夫音乐课</a>
											</li>
										</ul>
									</li>
								</ul>
								
							</li>
							<li class="Lev1">
								<a href="#" class="zymd1 ">名师大咖</a>
							</li>
							<li class="Lev1">
								<a href="#" class="zymd1 ">联系我们
									<i class="fa fa-caret-down"></i>
								</a>
								<ul class="drop-down sub-zymd2">
									<li class="Lev2">
										<a href="#" class="zymd2">招商加盟</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">发展合作</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">岗位招聘</a>
									</li>
									<li class="Lev2">
										<a href="#" class="zymd2">联系方式</a>
									</li>
								</ul>
							</li>
							<li class="search nav-search">
								<a href="javascript:;" class="open-search">
									<i class="fa fa-search"></i>
								</a>
								<form class="form-search" id="searchform" name="formsearch" action="javascript:;">
									<input type="hidden" name="kwtype" value="0" />
									<input type="search" value="" name="q" class="search-input" placeholder="输入关键字" />
									<button type="submit" class="search-btn" onkeyup="myFunction()">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>

		<!-- 轮播图 start-->
		<div class="swiper-container" id="swiper-container2">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="${basePath}/web/qiantai/images/1.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img src="${basePath}/web/qiantai/images/2.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img src="${basePath}/web/qiantai/images/3.jpg" alt="">
				</div>
				<div class="swiper-slide">
					<img src="${basePath}/web/qiantai/images/4.jpg" alt="">
				</div>
			</div>
			<!-- 如果需要分页器 -->
			<div class="swiper-pagination" id="swiper-pagination2"></div>
			<!-- 如果需要导航按钮 -->
			<div class="swiper-button-prev" id="swiper-button-prev2"></div>
			<div class="swiper-button-next" id="swiper-button-next2"></div>
		</div>
		<!-- 轮播图 end -->
	</div>
	<!-- 导航样式 end -->

	<!-- 响应式导航 start -->
	<nav id="mmenu" class="noDis">
		<div class="mmDiv">
			<div class="MMhead">
				<a href="javascript:" class="closezymd noblock">X</a>
				<c:if test="${empty userName}">
					<a href="${basePath}/web/bf/login.jsp">
						<i class="fa fa-user" aria-hidden="true"></i>
						<em>登录</em>
					</a>
				</c:if>
				<c:if test="${not empty userName}">
					<a>
						<i class="fa fa-user" aria-hidden="true"></i>
						<em>${userName}</em>
					</a>
					<a href="${basePath}/logout_user.action">
						<i class="fa fa-user" aria-hidden="true"></i>
						<em>退出</em>
					</a>
				</c:if>
			</div>
			<div class="mm-search">
				<form class="mm-search-form" name="formsearch" action="javascript:;">
					<input type="hidden" name="kwtype" value="0" />
					<input type="text" autocomplete="off" value="" name="q" class="side-mm-keyword"
						placeholder="输入关键字..." />
					<button type="submit" class="search-btn">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<ul>
				<li class="m-Lev1 m-nav_0">
					<a href="${basePath}/web/qiantai//index.jsp">网站首页</a>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="javascript:;" class="m-zymd1">关于我们</a>
					<ul class="m-subzymd">
						<li class="Lev2">
							<a href="${basePath}/web/qiantai//Company-profile.jsp" class="m-zymd2">公司简介</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">发展历程</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">企业文化</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">员工风采</a>
						</li>
					</ul>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="javascript:;" class="m-zymd1">新闻动态</a>
					<ul class="m-subzymd">
						<li class="Lev2">
							<a href="${basePath}/xwdtList_qt.action" class="m-zymd2">公司动态</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">活动回顾</a>
						</li>
					</ul>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="javascript:;" class="m-zymd1">门店展示</a>
					<ul class="m-subzymd">
						<li class="Lev2">
							<a href="${basePath}/zymdList_qt.action" class="m-zymd2">直营门店</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">加盟门店</a>
							<ul class="m-subzymd">
								<li class="Lev3">
									<a href="#" class="m-zymd3">加盟门店</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="${basePath}/kcglList_qt.action" class="m-zymd1">课程介绍</a>
					<ul class="m-subzymd">
						<li class="Lev2">
							<a href="#" class="m-zymd2">艺术中心</a>
							<ul class="m-subzymd">
								<li class="Lev3">
									<a href="${basePath}/web/qiantai//course-details.jsp" class="m-zymd3">儿童口才课程</a>
								</li>
								<li class="Lev3">
									<a href="#" class="m-zymd3">儿童戏剧课程</a>
								</li>
							</ul>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">启智课堂</a>
							<ul class="m-subzymd">
								<li class="Lev3">
									<a href="#" class="m-zymd3">儿童启智课程</a>
								</li>
							</ul>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">体育运动</a>
							<ul class="m-subzymd">
								<li class="Lev3">
									<a href="#" class="m-zymd3">儿童足球课程</a>
								</li>
							</ul>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">亲子课程</a>
							<ul class="m-subzymd">
								<li class="Lev3">
									<a href="#" class="m-zymd3">立体绘本课</a>
								</li>
								<li class="Lev3">
									<a href="#" class="m-zymd3">奥尔夫音乐课</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="#" class="m-zymd1">名师大咖</a>
				</li>
				<li class="m-Lev1 m-nav_4">
					<a href="javascript:;" class="m-zymd1">联系我们</a>
					<ul class="m-subzymd">
						<li class="Lev2">
							<a href="#" class="m-zymd2">招商加盟</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">发展合作</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">岗位招聘</a>
						</li>
						<li class="Lev2">
							<a href="#" class="m-zymd2">联系方式</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- 响应式导航 end -->

	
	<!-- 主要内容 start -->

	<!-- 课程介绍  start -->
	<section class="Course index-news">
		<div class="container">
			<h3 class="cou-intr">
				<a href="${basePath}/kcglList_qt.action">课程介绍</a>
			</h3>
			<div class="cou-main cou-flex">
				<div class="cou-flex-item">
					<div class="cou-post">
						<a href="${basePath}/web/qiantai//course-details.jsp">
							<img src="${basePath}/web/qiantai/images/cou-1.jpg" alt="">
						</a>
						<div class="cou-content">
							<h2>
								<a href="${basePath}/web/qiantai//course-details.jsp">儿童口才课程</a>
							</h2>
							<p>艺口童声口才曲艺大课堂，面向4-16岁少年儿童，携手北京曲艺家协会，从基础口才和舞台表现，到主持、相声、评书、快板等专业门类，分阶授课，小班制精细化教学，明星讲师带队参与专业舞台演出。优秀学员更可拜入名家门下，深造锤炼，踏上星途！
							</p>
							<a href="course-details.html">
								查看更多
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="cou-flex-item">
					<div class="cou-post">
						<a href="#">
							<img src="${basePath}/web/qiantai/images/cou-2.jpg" alt="">
						</a>
						<div class="cou-content">
							<h2>
								<a href="#">儿童戏剧课程</a>
							</h2>
							<p>课程主要针对4-7岁学龄前儿童，以“戏剧”为教育载体，在传统表演基础上融入贾克·乐寇戏剧表演教学方法。通过“戏剧”手段，营造一个开放、愉快、互动性强的学习环境，让孩子的轻松趣味的课程中，锻炼表达、社交、协助和逻辑思维能力，提高孩子的综合素质。
							</p>
							<a href="#">
								查看更多
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="cou-flex-item">
					<div class="cou-post">
						<a href="#">
							<img src="${basePath}/web/qiantai/images/bg.jpg" alt="">
						</a>
						<div class="cou-content">
							<h2>
								<a href="#">儿童启智课程</a>
							</h2>
							<p>棒棒堂·启智课堂是针对孩子上课注意力不集中、学习效果不好、学习自信心不足等问题开设的专项训练课程。历经多年研发、实践，独创“三段式训练法”，通过开启孩子的天然感知，增强专注力，深度开发孩子的记忆呈像能力，解决中国孩子的记忆难题。
							</p>
							<a href="#">
								查看更多
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="cou-flex-item">
					<div class="cou-post">
						<a href="#">
							<img src="${basePath}/web/qiantai/images/cou-4.jpg" alt="">
						</a>
						<div class="cou-content">
							<h2>
								<a href="#">儿童足球课程</a>
							</h2>
							<p>棒棒堂立体绘本亲子课程由专业教师团队带领，通过家人之间默契的家庭游戏、温馨恬静的亲子共读。共同见证孩子每一步的成长，铭刻关于家的记忆，陪伴他们度过最美好的童年。</p>
							<a href="#">
								查看更多
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="cou-flex-item">
					<div class="cou-post">
						<a href="#">
							<img src="${basePath}/web/qiantai/images/cou-5.jpg" alt="">
						</a>
						<div class="cou-content">
							<h2>
								<a href="#">立体绘本课</a>
							</h2>
							<p>棒棒堂立体绘本亲子课程由专业教师团队带领，通过家人之间默契的家庭游戏、温馨恬静的亲子共读。共同见证孩子每一步的成长，铭刻关于家的记忆，陪伴他们度过最美好的童年。</p>
							<a href="#">
								查看更多
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="cou-flex-item">
					<div class="cou-post">
						<a href="#">
							<img src="${basePath}/web/qiantai/images/cou-3.jpg" alt="">
						</a>
						<div class="cou-content">
							<h2>
								<a href="#">奥尔夫音乐课</a>
							</h2>
							<p>奥尔夫教学法是一种先进而独特的音乐教学法，由德国作曲家卡尔·奥尔夫创建。用儿童喜闻乐见的儿歌、拍手、游戏、故事、唱歌等形式，通过对音乐内容和活动主题相结合的学习体验和感受，欣赏音乐的多元化整合，培养儿童对音乐的兴趣，从而去热爱和理解音乐。
							</p>
							<a href="#">
								查看更多
								<i class="fa fa-angle-double-right" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 课程介绍 end -->

	<!-- 名师大咖 start -->
	<section class="Famous-teacher index-news">
			<div class="container">
				<h3 class="techer-intr">
					<a href="#">名师大咖</a>
				</h3>
				<div class="cou-main clearfix">
					<div class="swiper-container" id="swiper-container1">
						<div class="swiper-wrapper">
							<div class="swiper-slide" id="swiper-slide1">
								<div class="ft-main-img">
									<a href="#">
										<img src="${basePath}/web/qiantai/images/ft-1.jpg" alt="">
									</a>
								</div>
							</div>
							<div class="swiper-slide" id="swiper-slide1">
								<a href="">
									<img src="${basePath}/web/qiantai/images/ft-2.jpeg" alt="">
								</a>
							</div>
							<div class="swiper-slide" id="swiper-slide1">
								<a href="#">
									<img src="${basePath}/web/qiantai/images/ft-3.jpg" alt="">
								</a>
							</div>
							<div class="swiper-slide" id="swiper-slide1">
								<a href="">
									<img src="${basePath}/web/qiantai/images/ft-4.jpeg" alt="">
								</a>
							</div>
							<div class="swiper-slide" id="swiper-slide1">
								<a href="">
									<img src="${basePath}/web/qiantai/images/ft-5.jpg" alt="">
								</a>
							</div>
							<div class="swiper-slide" id="swiper-slide1">
								<a href="">
									<img src="${basePath}/web/qiantai/images/ft-6.jpg" alt="">
								</a>
							</div>
							<div class="swiper-slide" id="swiper-slide1">
								<a href="">
									<img src="${basePath}/web/qiantai/images/ft-7.jpg" alt="">
								</a>
							</div>
						</div>
						<!-- 如果需要分页器 -->
						<div class="swiper-pagination" id="swiper-pagination1"></div>
						<!-- 如果需要导航按钮 -->
						<div class="swiper-button-prev" id="swiper-button-prev1"></div>
						<div class="swiper-button-next" id="swiper-button-next1"></div>
					</div>
				</div>
			</div>
	</section>
	<!-- 名师大咖 end -->

	<!-- 投资前景 start -->
	<section class="Investment">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="inves-inter">
						<h1>儿童产业投资前景</h1>
						<p>棒棒堂既是儿童娱乐教育服务的实体运营商，也是大型儿童娱乐教育项目的设计输出方，提供一站式儿童项目筹建运营、管理输出等服务，凭借多年儿童项目运营管理经验，从专业角度合理构建安全成熟的儿童服务项目。
						</p>
						<div class="row">
							<div class="col-md-6">
								<div class="about-inves">
									<a href="#">
										<i class="fa fa-star"></i>
									</a>
									<h2>0-12岁儿童是儿童市场的主要消费群体，随着二胎政策的放开，这一人口基数还在逐年增加。</h2>
								</div>
								<div class="about-inves">
									<a href="#">
										<i class="fa fa-calendar"></i>
									</a>
									<h2>2018年中国儿童市场规模超过1.2万亿元，在未来3-5年中，仍然会以每年接近10%的增速持续快速增长。</h2>
								</div>
							</div>
							<div class="col-md-6">
								<div class="about-inves">
									<a href="#">
										<i class="fa fa-empire"></i>
									</a>
									<h2>平均每个孩子月消费额的30%用于娱乐消费。80、90后家长普遍接受过良好教育，使得这一费用的比重上升。</h2>
								</div>
								<div class="about-inves">
									<a href="#">
										<i class="fa fa-globe"></i>
									</a>
									<h2>数据显示，儿童消费已成为城市家庭首要之支出，达到家庭总支出的50%以上。</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 投资前景 end -->



	<!-- 直营门店 start -->
	<section class="Direct-shop">
		<div class="container">
			<h3 class="shop-intr">
				<a href="${basePath}/zymdList_qt.action">
					直营门店
				</a>
			</h3>
			<div class="shop-main">
				<div class="shop-list clearfix">
					<div class="shop-list-item col-md-4 col-md-12 clearfix">
						<div class="shop-img">
							<a href="#">
								<img src="${basePath}/web/qiantai/images/shop-img-1.png" alt="">
								<span></span>
								<i></i>
							</a>
						</div>
						<div class="shop-text-box">
							<div class="shop-text">
								<h2>
									<a href="#">大兴绿地缤纷城</a>
								</h2>
								<div class="shop-text-intro">
									<div class="shop-content">
										<p>装修风格为清新的绿色森林风格，让孩子仿佛置身于大自然之中游玩，店铺中设有大型海洋球池，互动投影滑梯，淘气堡，水蹦床，拼插积木，旋转木马，氛围轻松愉快，并设有家长休息区，在孩子游玩的同时，家长可以选择进入场地陪同或在一旁稍事休息，大兴绿地店每周举办亲子活动。</p>
										<ul>
											<li>
												<p class="shop-content-left">
													<i class="fa fa-map-marker" aria-hidden="true"></i>
													详细地址：
												</p>
												<p>大兴绿地缤纷城店位于大兴绿地缤纷城三层内</p>
												</li>
											<li><i class="fa fa-phone" aria-hidden="true"></i>联系电话：010-80253506</li>
										</ul>
									</div>
								</div>
							</div>
							<em class="shop-arrow"></em>
						</div>
					</div>
					<div class="shop-list-item col-md-4 col-md-12 shop-list-item-two clearfix">
						<div class="shop-text-box">
							<div class="shop-text">
								<h2>
									<a href="#">海淀 甘家口大厦店</a>
								</h2>
								<div class="shop-text-intro">
									<div class="shop-content">
										<p>甘家口大厦店开设于2014年，是甘家口大厦唯一一家儿童游乐场所，甘家口大厦以蓝天白云的风格为主，设有海洋球池，儿童沙池，淘气堡，滑梯，旋转木马等无动力游乐设备，并设有丰富的儿童电动游乐设备。甘家口店每周举办亲子活动和儿童舞台表演以及亲子活动，并开设有绘本课，奥尔夫音乐课，启智课堂，曲艺大课堂，少儿口才课，并有明星大咖亲自到店授课。</p>
										<ul>
											<li>
												<p class="shop-content-left">
													<i class="fa fa-map-marker" aria-hidden="true"></i>
													详细地址：
												</p>
												<p>甘家口大厦店位于海淀区甘家口大厦三层</p>						
											</li>
											<li><i class="fa fa-phone" aria-hidden="true"></i>联系电话：010-80253506</li>
										</ul>
									</div>
								</div>
							</div>
							<em class="shop-arrow"></em>
						</div>
						<div class="shop-img">
							<a href="#">
								<img src="${basePath}/web/qiantai/images/shop-img-2.png" alt="">
								<span></span>
								<i></i>
							</a>
						</div>
					</div>
					<div class="shop-list-item col-md-4 col-md-12 clearfix">
						<div class="shop-img">
							<a href="#">
								<img src="${basePath}/web/qiantai/images/shop-img-3.png" alt="">
								<span></span>
								<i></i>
							</a>
						</div>
						<div class="shop-text-box">
							<div class="shop-text">
								<h2>
									<a href="#">房山绿地缤纷城</a>
								</h2>
								<div class="shop-text-intro">
									<div class="shop-content">
										<p>房山绿地店由两个场地组成，两个场地紧紧相连并间隔一条通道相隔，大场地设有海洋球池，淘气堡，投影砸屏，蜂巢迷宫，蹦床，海绵池，攀爬区，滑梯，儿童迷宫，绘本馆，曲艺教室，启智教室以及小汽车，小场地设有香蕉滑梯，大型积木，棒棒星秀场，小型拼插积木区，儿童沙池，房山绿地店整体装修风格以棒棒象的黄色为主。</p>
										<ul>
											<li>
												<p class="shop-content-left">
													<i class="fa fa-map-marker" aria-hidden="true"></i>
													详细地址：
												</p>
												<p>房山绿地缤纷城店位于房山绿地缤纷城二层</p>
												</li>
											<li><i class="fa fa-phone" aria-hidden="true"></i>联系电话：010-80253506</li>
										</ul>
									</div>
								</div>
							</div>
							<em class="shop-arrow"></em>
						</div>
					</div>
				</div>
			</div>
			<div class="shop-full-more">
				<a href="${basePath}/zymdList_qt.action">更多门店</a>
			</div>
		</div>
	</section>
	<!-- 直营门店 end -->



	<!-- 主要内容 start -->

	<!-- 页面底部 start -->
	<footer>
		<div class="container">
			<div class="footer-widgets">
				<div class="row">
					<div class="col-md-3 col-sm-12 foot-about footer-top">
						<div class="widgets">
							<h2>
								<a href="">关于我们</a>
							</h2>
							<div class="footer-about">
								北京百思腾教育咨询有限责任公司成立于2009年，旗下品牌百思腾棒棒堂成长乐园，是一家集儿童产业投资、商业乐园运营、游乐设备生产、乐园项目筹建、文化娱乐体育、素质教育培训为一体的专业机构。已持续10年为200多万会员家庭提供丰富多彩的文化娱乐服务，服务覆盖16岁以下全年龄段青少年儿童，集乐园经营、项目承建、娱乐体育、教育培训为一体，形成棒棒堂独有的青少年儿童成长服务体系。
							</div>
						</div>
					</div>
					<div class="col-md-2 col-sm-12 foot-about footer-top">
						<div class="widgets">
							<h2>
								<a href="">联系我们</a>
							</h2>
							<ul class="tag-list">
								<li>
									<a href="#">招商加盟</a>
								</li>
								<li>
									<a href="#">发展合作</a>
								</li>
								<li>
									<a href="#">岗位招聘</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 col-sm-12 foot-about footer-top">
						<div class="widgets">
							<h2>
								<a href="">联系方式</a>
							</h2>
							<div class="footer-content">
								<p>
									<i class="fa fa-map-marker"></i>
									地址：北京市大兴区绿地兴贸中心2号楼2单元1616
								</p>
								<p>
									<i class="fa fa-phone"></i>
									电话：010-80253506
								</p>
								<p>
									<i class="fa fa-envelope-o"></i>
									邮箱：service@bbt-kids.com
								</p>
								<p>
									<i class="fa fa-weixin"></i>
									微信公众号：best-bangbangtop
								</p>
								<p>
									<i class="fa fa-home"></i>
									网址：http://www.bbt-kids.com/
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 foot-about footer-top">
						<div class="widgets">
							<h2>
								<a href="">扫描二维码</a>
							</h2>
							<div class="footer-erweima">
								<img src="${basePath}/web/qiantai/images/erweima.png" alt="" width="210" height="210">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="last-line">
			<div class="container">
				<p class="copyright">
					Copyright &copy; 2019-2019 北京百思腾教育咨询有限责任公司 版权所有
				</p>
			</div>
		</div>
	</footer>
	<!-- 页面底部 end -->
	<script type="text/javascript" src="${basePath}/web/qiantai/js/jquery.min.1.js"></script>
	<script type="text/javascript" src="${basePath}/web/qiantai/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath}/web/qiantai/js/jquery.mmenu.all.min.js"></script>
	<script type="text/javascript" src="${basePath}/web/qiantai/js/script.js"></script>
	<script src="${basePath}/web/qiantai/js/swiper.min.js"></script>
	<script src="${basePath}/web/qiantai/js/form.js"></script>
	
	<!-- 导航js样式 start		 -->
	<script type="text/javascript">
		jQuery(document).ready(function ($) {
			var mmenu = $('nav#mmenu').mmenu({
				slidingSubzymds: true,
				classes: 'mm-white', //mm-fullscreen mm-light
				extensions: ["theme-white"],
				offCanvas: {
					position: "right", //left, top, right, bottom
					zposition: "front" //back, front,next
					//modal		: true
				},
				searchfield: false,
				counters: false,
				//navbars		: {
				//content : [ "prev", "title", "next" ]
				//},
				navbar: {
					title: "网站导航"
				},
				header: {
					add: true,
					update: true,
					title: "网站导航"
				}
			});
			$(".closezymd").click(function () {
				var mmenuAPI = $("#mmenu").data("mmenu");
				mmenuAPI.close();
			});
		});
	</script>
	<!-- 导航js样式 end		 -->
	<!-- 轮播图 start -->
	<script>
		var mySwiper = new Swiper('#swiper-container2', {
			direction: 'horizontal', // 水平切换选项
			loop: true, // 循环模式选项
			autoplay: true,//自动轮播
			grabCursor: true, //手抓形状
			effect: 'cube', //   可设置为"fade"（淡入）"cube"（方块）"coverflow（3d流）"flip"（3d翻转）
			cube: {                     // 这个是方块效果  
				slideShadows: true,
				shadow: true,
				shadowOffset: 150,
				shadowScale: 0.8
			},
			// 如果需要分页器
			pagination: {
				el: '#swiper-pagination2',
			},
			// 如果需要前进后退按钮
			navigation: {
				nextEl: '#swiper-button-next2',
				prevEl: '#swiper-button-prev2',
			},
		})
		//鼠标覆盖停止自动切换与隐藏前进后退按钮
		mySwiper.el.onmouseover = function () {
			mySwiper.navigation.$nextEl.removeClass('hide');
			mySwiper.navigation.$prevEl.removeClass('hide');
			mySwiper.autoplay.stop();
		}
		//鼠标覆盖停止自动切换与隐藏前进后退按钮
		mySwiper.el.onmouseout = function () {
			mySwiper.navigation.$nextEl.addClass('hide');
			mySwiper.navigation.$prevEl.addClass('hide');
			mySwiper.autoplay.start();
		}        
	</script>
	<!-- 轮播图 end -->
	
	<!-- 名师大咖 轮播 start -->
	<script>
		var swiper1 = new Swiper('#swiper-container1', {
			slidesPerView: 3,
			spaceBetween: 30,
			centeredSlides: true,
			autoplay: false,
			grabCursor: false, //手抓形状
			loop: true,
			breakpoints: {
				1024: {
					slidesPerView: 4,
					spaceBetween: 40,
				},
				768: {
					slidesPerView: 3,
					spaceBetween: 30,
				},
				640: {
					slidesPerView: 2,
					spaceBetween: 20,
				},
				320: {
					slidesPerView: 1,
					spaceBetween: 10,
				}
			},
			// 如果需要分页器
			pagination: {
				el: '#swiper-pagination1',
			},
			// 如果需要前进后退按钮
			navigation: {
				nextEl: '#swiper-button-next1',
				prevEl: '#swiper-button-prev1',
			},
		});
		//鼠标覆盖停止自动切换与隐藏前进后退按钮
		swiper1.el.onmouseover = function () {
			swiper1.navigation.$nextEl.removeClass('hide');
			swiper1.navigation.$prevEl.removeClass('hide');
			swiper1.autoplay.stop();
		}
		//鼠标覆盖停止自动切换与隐藏前进后退按钮
		swiper1.el.onmouseout = function () {
			swiper1.navigation.$nextEl.addClass('hide');
			swiper1.navigation.$prevEl.addClass('hide');
			swiper1.autoplay.start();
		} 
	</script>
	<!-- 名师大咖 轮播 end -->
	
	<!-- 搜索 start -->
	<script type="text/javascript">
  		function myFunction() { 
    	// 声明变量 
    	var input, filter, ul, li, a, i; 
    input = document.getElementById('myInput'); 
    filter = input.value.toUpperCase(); 
    ul = document.getElementById("myUL"); 
    li = ul.getElementsByTagName('li'); 
  
    // 循环所有列表，查找匹配项 
    for (i = 0; i < li.length; i++) { 
      a = li[i].getElementsByTagName("a")[0]; 
      if (a.innerHTML.toUpperCase().indexOf(filter) > -1) { 
        li[i].style.display = ""; 
      } else { 
        li[i].style.display = "none"; 
      } 
    } 
  } 
	</script>

<!-- 搜索 end -->
</body>

</html>