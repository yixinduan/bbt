<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>${kcgl.name }</title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="order by website" />
	<link rel="stylesheet" type="text/css" href="${basePath}/web/qiantai/css/font-awesome.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="${basePath}/web/qiantai/css/bootstrap.min.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="${basePath}/web/qiantai/css/dh.css" media="screen" />
	<link type="text/css" rel="stylesheet" href="${basePath}/web/qiantai/css/jquery.mmenu.all.css" />
	<link rel="stylesheet" href="${basePath}/web/qiantai/css/main.css">
	<link rel="stylesheet" href="${basePath}/web/qiantai/css/style.css">
	<link rel="stylesheet" href="${basePath}/web/qiantai/css/slick.css">
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
							<img src="${basePath}/web/qiantai/images/logo.png" alt="" class="logo" />
							<img src="${basePath}/web/qiantai/images/logo-m.png" alt="" class="logo-m" />
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
									<input type="search" value="" name="q" class="search-input" placeholder="输入关键字" id="myInput" onkeyup="myFunction()"/>
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
					<a href="javascript:;" target="_blank" data-toggle="modal" data-target="#RegistrationModal" class="shop-num-po">
						<span class="shop-num">0</span>
						<i class="fa fa-cart-plus" aria-hidden="true"></i>
						<em style="margin-left:10px">购物车</em>							
					</a>						
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
							<a href="${basePath}/web/qiantai//Direct-shop.jsp" class="m-zymd2">直营门店</a>
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

	<!-- 页面主要部分 start -->

	<!-- 页面定位 start -->
	<div class="bread-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-4 intro">${kcgl.name }</div>
				<div class="col-md-9 col-sm-8 location">
					<i class="fa fa-map-marker"></i>&nbsp;
					<span>当前位置：
						<a href="${basePath}/web/qiantai//index.jsp">主页</a>
						>
                        <a href="${basePath}/kcglList_qt.action">课程介绍</a>
                        >
                        <a href="#">艺术中心</a>
                        >
						<a href="${basePath}/web/qiantai//course-details.jsp">${kcgl.name }</a>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 页面定位 end -->

	<!-- 主要部分 start -->
    <div class="main-content-wrap section-ptb product-details-page">
            <div class="container">
                <div class="row">
                    <div class="col-xl-6 col-lg-7 col-md-6">
                        <div class="product-details-images">
                            <div class="product_details_container">
                                <!-- product_big_images start -->
                                <div class="product_big_images-right">
                                    <div class="portfolio-full-image tab-content">
                                        <div role="tabpanel" class="tab-pane active product-image-position" id="img-tab-5">
                                            <a href="#" class="img-poppu">
                                                <img src="${kcgl.img }" alt="#">
                                            </a>
                                        </div>
                                        <div role="tabpanel" class="tab-pane product-image-position" id="img-tab-6">
                                            <a href="#" class="img-poppu">
                                                <img src="${kcgl.img }" alt="#">
                                            </a>
                                        </div>
                                        <div role="tabpanel" class="tab-pane product-image-position" id="img-tab-7">
                                            <a href="#" class="img-poppu">
                                               <img src="${kcgl.img }" alt="#">
                                            </a>
                                        </div>
                                        <div role="tabpanel" class="tab-pane product-image-position" id="img-tab-8">
                                            <a href="#" class="img-poppu">
                                                <img src="${kcgl.img }" alt="#">
                                            </a>
                                        </div>
                                        <div role="tabpanel" class="tab-pane product-image-position" id="img-tab-9">
                                            <a href="#" class="img-poppu">
                                                <img src="${kcgl.img }" alt="#">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- 大图 end -->

                                <!--小图 start -->
                                <!-- <ul class="product_small_images-left vartical-product-active nav slick-initialized slick-slider " role="tablist">
									<i class="fa fa-angle-left arrow-prv"></i>
                                    <li role="presentation" class="pot-small-img active">
                                        <a href="#" role="tab" data-toggle="tab">
                                            <img src="images/cou-1.jpg" alt="#">
                                        </a>
                                    </li>
                                    <li role="presentation" class="pot-small-img">
                                        <a href="#" role="tab" data-toggle="tab">
                                            <img src="images/cou-1.jpg" alt="#">
                                        </a>
                                    </li>
                                    <li role="presentation" class="pot-small-img">
                                        <a href="#" role="tab" data-toggle="tab">
                                            <img src="images/cou-1.jpg" alt="#">
                                        </a>
                                    </li>
                                    <li role="presentation" class="pot-small-img">
                                        <a href="#" role="tab" data-toggle="tab">
                                            <img src="images/cou-1.jpg" alt="#">
                                        </a>
                                    </li>
                                    <li role="presentation" class="pot-small-img">
                                        <a href="#" role="tab" data-toggle="tab">
                                            <img src="images/cou-1.jpg" alt="#">
                                        </a>
									</li>
									<i class="fa fa-angle-right arrow-next"></i>
                                </ul> -->
                                <!-- 小图 end -->
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-5 col-md-6">
                        <!-- product_details_info start -->
                        <div class="product_details_info">
                            <h2>${kcgl.name }</h2>
                            <!-- pro_rating start -->
                            <div class="pro_rating d-flex">
                                <ul class="product-rating d-flex">
                                    <li><span class="ion-android-star-outline"></span></li>
                                    <li><span class="ion-android-star-outline"></span></li>
                                    <li><span class="ion-android-star-outline"></span></li>
                                    <li><span class="ion-android-star-outline"></span></li>
                                    <li><span class="ion-android-star-outline"></span></li>
                                </ul>
                            </div>
                            <!-- pro_rating end -->
                            <!-- pro_details start -->
                            <div class="pro_details">
                                <p>${kcgl.descs }</p>
                            </div>
                            <!-- pro_details end -->
                            <!-- pro_dtl_prize start -->
                            <ul class="pro_dtl_prize">
                            	<li class="old_prize">￥${kcgl.price1 }</li>                      
                                <li>￥${kcgl.price }</li>
                            </ul>
                            <!-- pro_dtl_prize end -->
                            <!-- product-quantity-action start -->
                            <div class="product-quantity-action">
                                <div class="prodict-statas"><span>选择数量 :</span></div>
                                <div class="product-quantity">
                                    <form action="#">
                                        <div class="product-quantity">
                                            <div class="cart-plus-minus">
                                                <input value="1" type="number" id="addd" min="1" max="10">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- product-quantity-action end -->
                            <!-- pro_dtl_btn start -->
                            <c:if test="${not empty userName }">
                            <ul class="pro_dtl_btn">
                                <li><a href="#" class="buy_now_btn" id="buy">立即购买</a></li>                         
		                                     <form action="${basePath}/shopcarSave_qt.action" class="comment-form-area">
		                                         <div class="comment-input">
		                                             <div class="row">										
		 												 <input type="hidden" name="shopcar.kcgl.id" value="${kcgl.id }" />
		 												 <input type="hidden" id="activeFlag" name="activeFlag" value="${activeFlag}" />
		                                                 <div class="col-lg-12">
		                                                     <div class="comment-form-submit">
		                                                         <li><a href="#"  class="buy_now_btn" id="add">加入购物车
		                                                         <c:forEach items="${shopcarList }" var="item">
	                                                        <h5><a href="#">${item.user.name }</a></h5>
	                                                         <h5><a href="#">${item.kcgl.name }</a></h5>                                        
                                            </c:forEach>
		                                                         </a></li> 
		                                                     </div>
		                                                 </div>
		                                             </div>
		                                         </div>
		                                     </form>
		                                     
                            </ul>
                            </c:if>
                             <c:if test="${empty userName }">
                             	<ul class="pro_dtl_btn">
                                	<li><a href="#" class="buy_now_btn">立即购买</a></li>
                                	<li><a href="#"  class="buy_now_btn">加入购物车</a></li>
                            	</ul>
	                                 <%--     	<div>
	                                     		<span>
	                                     			登录才可以进行购买哦！
	                                     			<a href="${basePath}/web/bf/login.jsp">
														<i class="fa fa-user" aria-hidden="true"></i>
														<em>登录</em>
													</a>
	                                     		</span>
	                                     	</div> --%>
	                        </c:if>
                            <!-- pro_dtl_btn end -->
                        </div>
                        <!-- product_details_info end -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="product-details-tab mt-60">
                            <ul role="tablist" class="mb-50 nav" id="bottom-tab">
                                <li class="active" role="presentation">
                                    <a id="description_" onclick="$('#activeFlag').val(1)" data-toggle="tab" role="tab" href="#description">商品详情</a>
                                </li>
                                <li role="presentation">
                                    <a id="sheet_" onclick="$('#activeFlag').val(2)" data-toggle="tab" role="tab" href="#sheet">购买记录</a>
                                </li>
                                <li role="presentation">
                                    <a id="reviews_" onclick="$('#activeFlag').val(3)" data-toggle="tab" role="tab" href="#reviews">顾客评论</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="product_details_tab_content tab-content">
                            <!-- Start Single Content -->
                            <div class="product_tab_content tab-pane active" id="description" role="tabpanel">
                                <div class="product_description_wrap">
                                    <div class="product_desc mb--30">
                                        <h2 class="title_3">详细信息</h2>
                                        <p>${kcgl.descs }</p>
                                    </div>
                                    <div class="pro_feature">
                                        <h2 class="title_3">任教老师</h2>
                                        <ul class="feature_list">
                                            <li><a href="#"><i class="fa fa-heart-o"></i>张明敏老师</a></li>
                                            <li><a href="#"><i class="fa fa-heart-o"></i>刘仁老师</a></li>
                                            <li><a href="#"><i class="fa fa-heart-o"></i>小葡萄老师</a></li>
                                            <li><a href="#"><i class="fa fa-heart-o"></i>月亮姐姐</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <div class="product_tab_content tab-pane" id="sheet" role="tabpanel">
                                <div class="pro_feature">
                                    <h2 class="title_3">购买记录</h2>
                                    <ul class="feature_list">
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>138****9901购买儿童口才课程</a></li>
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>135****9981购买儿童口才课程</a></li>
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>131****1234购买儿童口才课程</a></li>
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>138****4567购买儿童口才课程</a></li>
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>138****9901购买儿童口才课程</a></li>
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>138****9901购买儿童口才课程</a></li>
                                        <li><a href="#"><i class="ion-ios-play-outline"></i>138****9901购买儿童口才课程</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <div class="product_tab_content tab-pane" id="reviews" role="tabpanel">
                                <div class="row">
                                    <div class="col-lg-7">
                                        <!-- blog-details-wrapper -->
                                        <div class="col-lg-12 review_address_inner">
                                            <h5>评论</h5>
                                            <c:forEach items="${kclyList }" var="item">
	                                            <!-- Single Review -->
	                                            <div class="pro_review">
	                                                <div class="review_thumb">
	                                                    <img alt="review images" src="${basePath}/web/qiantai/images/tou1.jpeg">
	                                                </div>
	                                                <div class="review_details">
	                                                    <div class="review_info">
	                                                        <h5><a href="#">${item.user.name }</a></h5>
	                                                        <div class="rating_send">
	                                                            <!-- <a href="#">回复</a> -->
	                                                        </div>
	                                                    </div>
	                                                    <div class="review_date">
	                                                        <span>${item.time }</span>
	                                                    </div>
	                                                    <p>${item.content }</p>
	                                                    
	                                                    <div class="review_date">
	                                                        <span>${item.replytime }</span>
	                                                    </div>
	                                                    <p >回复：<span style="color: blue">${item.reply }</span></p>
	                                                </div>
	                                            </div>
	                                            <!--// Single Review -->
                                            </c:forEach>
                                        </div>

                                        <!--// blog-details-wrapper -->
									</div>
									 <div class="col-lg-5">
									 <div class="comments-reply-area">
									 	 <c:if test="${not empty userName }">
		                                     <h5 class="comment-reply-title mb-30">留言版</h5>
		                                     <form action="${basePath}/kclySave_qt.action" class="comment-form-area">
		                                         <div class="comment-input">
		                                             <div class="row">										
		 												 <input type="hidden" name="kcly.kcgl.id" value="${kcgl.id }" />
		 												 <input type="hidden" id="activeFlag" name="activeFlag" value="${activeFlag}" />
		                                                 <div class="col-lg-12">
		                                                     <p class="comment-form-comment">
		                                                         <textarea name="kcly.content" class="comment-notes" required="required" placeholder="留言内容 *"></textarea>
		                                                     </p>
		                                                 </div>
		                                                 <div class="col-lg-12">
		                                                     <div class="comment-form-submit">
		                                                         <button class="comment-submit">提交</button>
		                                                     </div>
		                                                 </div>
		                                             </div>
		                                         </div>
		                                     </form>
	                                     </c:if>
	                                     <c:if test="${empty userName }">
	                                     	<div>
	                                     		<span>
	                                     			登录才可以进行留言评论哦！
	                                     			<a href="${basePath}/web/bf/login.jsp">
														<i class="fa fa-user" aria-hidden="true"></i>
														<em>登录</em>
													</a>
	                                     		</span>
	                                     	</div>
	                                     </c:if>
	                                 </div>
	                                 
	                                 </div>
                                </div>
                            </div>
                            <!-- End Single Content -->
                        </div>
                    </div>
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
	<script src="${basePath}/web/qiantai/js/plugins.js"></script>
	<script src="${basePath}/web/qiantai/js/cookie.js"></script>
	<!-- 购物车加一  start -->
	<script>
		var globalNum = 0;
		window.onload = function() {
			var add = document.getElementById('add');
			var num = 0;
			var res = document.getElementById('num');
			var buy = document.getElementById('buy');
			/* var addd = document.getElementById('addd'); */
			add.onclick = function() {
				num = document.querySelector('#addd').value;
				globalNum = num;
				res.innerHTML = num;
				setGlobalNum();
			}
			buy.onclick = function() {
				var resNum = res.innerHTML;
				cookie.setCookie('num', resNum);

			}
		}
		
		function setGlobalNum (){
			$('#num').text(globalNum);
		}
		
		$('input[type=number]').keypress(function(e) {
　　if (!String.fromCharCode(e.keyCode).match(/[1-9\.]/)) {
　　　　return false;
　　}
});
	</script>
	<!-- 购物车加一  end -->
	<!-- 导航js样式 start		 -->
	<script type="text/javascript">
		(function () {
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
        })();
		(function () {
			var $TabWrap = $('#bottom-tab');
            $TabWrap.on('click','a',function(){
                $TabWrap.find('a').removeClass('active');
                $(this).addClass('active')
			})
        })()




	</script>
	<!-- 导航js样式 end		 -->

	
	<!-- 评论 start -->
	<!-- <script>
	window.onload=function(){
		
		var btnPut=document.getElementById('btn_put');
		var ul=document.getElementById('ul');
		var li=ul.children;
	btnPut.onclick=function(){
		var getContent=document.getElementById('enjoy').value;
		if(getContent){
			var content=document.getElementById('footer');
			content.innerHTML='<p>'+getContent+'</p>'+content.innerHTML;
			document.getElementById('enjoy').value='';
		}else{
			alert('请输入内容');
		}
	};
</script> -->
	<!-- 评论 end -->
	<script type="text/javascript">
        $(function(){
            //页面加载完毕后开始执行的事件
            $(".rating_send").click(function(){
                $(".reply_textarea").remove();
                $(this).parent().append("<div class='reply_textarea'><textarea name='' cols='40' rows='5'></textarea><br/><input type='submit' value='发表' class='comment-submit' /></div>");
            });
        });
    </script>
    <script type="text/javascript">
    	$(function(){
    		var activeFlag = "${activeFlag}";
    		if(activeFlag==2){
    			$("#sheet_").click();
    		}else if(activeFlag==3){
    			$("#reviews_").click();
    		}else{
    			$("#description_").click();
    		}
    	
    	});
    </script>
 
</body>

</html>