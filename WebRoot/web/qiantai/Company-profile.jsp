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
	<title>公司简介</title>
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
										<a href="javascript:;" target="_blank" data-toggle="modal"
											data-target="#RegistrationModal">
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
							<img src="images/logo.png" alt="" class="logo" />
							<img src="images/logo-m.png" alt="" class="logo-m" />
						</a>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right" id="navigation">
							<li class="Lev1">
								<a href="${basePath}/web/qiantai//index.jsp" class='zymd1 active' style="color:#282828!important">网站首页 </a>
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
										<a href="Art-Center.html" class="zymd2">艺术中心
											<i class="fa fa-caret-right" aria-hidden="true"></i>
										</a>
										<ul class="drop-down sub-zymd3">
											<li class="Lev2">
												<a href="${basePath}/web/qiantai//course-details.jsp" class="zymd2">儿童口才课程</a>
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
									<button type="submit" class="search-btn">
										<i class="fa fa-search"></i>
									</button>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
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
							<a href="Art-Center.html" class="m-zymd2">艺术中心</a>
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

    <!-- 页面主要部分 start -->

    <!-- 页面定位 start -->
    <div class="bread-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 intro">公司简介</div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i>&nbsp;
                    <span>当前位置：
                        <a href="${basePath}/web/qiantai//index.jsp">主页</a>
                        >
                        <a href="#">关于我们</a>
                        >
                        <a href="${basePath}/web/qiantai//Company-profile.jsp">公司简介</a>                       
                    </span>
                </div>
            </div>
        </div>
    </div>
    <!-- 页面定位 end -->

    <!-- 主要部分 start -->
    <div class="page-container clearfix" id="innerpage-wrap">
        <div class="container">
            <div class="row">
                <div class="main col-md-9 inner-left">
                    <div class="about-page-wrap">
                        <div>北京百思腾教育咨询有限责任公司成立于2009年，旗下品牌百思腾棒棒堂成长乐园，是一家集儿童产业投资、商业乐园运营、游乐设备生产、乐园项目筹建、文化娱乐体育、素质教育培训为一体的专业机构。已持续10年为200万忠实消费者带来高好评服务。
                        棒棒堂成长乐园自创办以来，历经行业兴起到品牌竞争的风雨洗礼，总结出符合市场规律的品牌经营模式，并为后续发展空间梳理出一条切实可行的坚实道路。如今的棒棒堂以品牌为基础、以全新的运营服务为核心竞争力、以权威级的教育培训为有力增长点、以多种合作模式为发展空间，正胸有成竹迎接全新的未来。
                        </div>
                        <div>&nbsp;</div>
                        <div>棒棒堂是一家集儿童产业投资、商业乐园运营、游乐设备生产、乐园项目筹建、文化娱乐、素质教育培训为一体的专业机构。
                        </div>
                        <div>&nbsp;</div>
                        <div>成长乐园：棒棒堂儿童成长乐园通过引入国际先进的游乐新概念，将玩具乐园、科普实践、职业体验、艺术早教、卡通动漫、家庭亲子等内容科学融合，在满足孩子的玩乐需求的同时，着手于启蒙探索、艺术启智、运动能力、社交能力等方面的培养，让孩子快乐玩耍，开心学习。</div>
                        <div>&nbsp;</div>
                        <div>项目承建：棒棒堂拥有优秀的设计研发团队，成功设计承建了北京古北水镇、南昌香格里拉酒店、承德山顶美术馆、辽宁东森幼儿园、太原童话幼儿园等室内外儿童游乐项目。设计以国际化视角，有机融入亲子、快乐、运动、健康等流行元素，将安全性、便利性、趣味性和观赏性完美呈现于每件作品。</div>
                        <div>&nbsp;</div>
                        <div>亲子教育：棒棒堂成长乐园中，互动亲子课程面向广大会员家庭开放，课程由专业教师团队带领，亲子之间进行默契的家庭游戏、轻松快乐的立体绘本课、温馨恬静的亲子共读。在棒棒堂，见证孩子每一步的成长，共同铭刻关于家的记忆，陪伴他们度过最美好的童年。</div>
                        <div>&nbsp;</div>
                        <div>课程培训：棒棒堂艺术中心拥有儿童口才、曲艺艺术、戏剧表演等系列课程，专注于培养儿童的语言表达能力。儿童体育课程，包括少儿足球、篮球等儿童等项目，以游戏娱乐的形式培养对体育运动兴趣，强身健体的同时，挖掘儿童运动天赋，推荐进入职业青训体系，成为明日之星。</div>
                    </div>
                </div>
                <aside class="sidebar col-md-3 inner-right">
                    <section class="widget side-search">
                        <h3 class="title">站内搜索</h3>
                        <form action="" class="searchform" id="searchform" name="formsearch">
                            <input type="hidden">
                            <div class="form-div">
                                <input type="text" placeholder="输入关键字" id="s">
                                <input type="submit" id="searchsubmit" value="">
                            </div>
                        </form>
                    </section>
                    <section class="widget side-contact">
                        <h3 class="title">联系信息</h3>
                        <div class="s-contact">
                            地址：北京市大兴区绿地兴贸中心2号楼2单元1616 <br>
                            电话：010-80253506<br>
                            邮箱：service@bbt-kids.com<br>
                            微信公众号：best-bangbangtop<br>
                            网址：http://www.bbt-kids.com/
                        </div>
                    </section>
                    <section class="widget side-news">
                        <h3 class="title">活动回顾</h3>
                        <div class="news">
                            <div class="news-main">
                                <ul class="widget-list">
                                    <li>
                                        <figure>
                                             <a href="#">
                                                <img src="images/comments-1.png" alt="">
                                            </a>
                                        </figure>
                                         <div class="sn-wrapper">
                                            <p class="s-desc">
                                                <a href="#">棒棒堂《传递爱心，牵手未来》公益活动</a>
                                            </p>
                                            <span class="comments">
                                                <i class="fa fa-calendar"></i>
                                                &nbsp;2018-10-11
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <figure>
                                            <a href="#">
                                                <img src="images/comments-2.png" alt="">
                                            </a>
                                        </figure>
                                        <div class="sn-wrapper">
                                            <p class="s-desc">
                                                <a href="#">棒棒堂亲子课,快乐似春天的花骨朵儿</a>
                                            </p>
                                            <span class="comments">
                                                <i class="fa fa-calendar"></i>
                                                &nbsp;2018-10-11
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <figure>
                                            <a href="#">
                                                <img src="images/comments-3.png" alt="">
                                            </a>
                                        </figure>
                                        <div class="sn-wrapper">
                                            <p class="s-desc">
                                                <a href="#">棒棒堂里，让快乐的记忆珍藏！</a>
                                            </p>
                                            <span class="comments">
                                                <i class="fa fa-calendar"></i>
                                                 &nbsp;2018-10-11
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </section>
                </aside>
            </div>
        </div>
    </div>
    <!-- 主要部分end -->

    <!-- 页面主要部分 end -->

    <!-- 页面底部 start -->
	<footer>
		<div class="container">
			<div class="footer-widgets">
				<div class="row">
					<div class="col-md-3 col-sm-12 foot-about footer-top">
						<div class="widgets">
							<h2>
								<a href="#">关于我们</a>
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
								<img src="images/erweima.png" alt="" width="210" height="210">
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
	<script type="text/javascript" src="js/jquery.min.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.mmenu.all.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script src="js/swiper.min.js"></script>
	<script src="js/form.js"></script>
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

</body>
</html>