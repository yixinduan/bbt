<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp" %>
<!DOCTYPE HTML>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<title>Base Data</title>

<!-- 基本js -->
<%@ include file="/view/common/jsp/base_js_css.jsp" %>

<!-- 表格分页css, js -->
<%@ include file="/view/common/jsp/base_table_pagination.jsp" %>

<!-- 弹出框 js css -->
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<!-- 表格 js -->
<script type="text/javascript" src="${basePath }/view/common/js/idGroup.js"></script>
<link type="text/css" href="${basePath }/view/common/css/animate.css" rel="stylesheet">
<link type="text/css" href="${basePath }/view/common/simple_search/ml-navigation-bar.css?R=2" rel="stylesheet"/>

</head>


<body class="gundongtiao">
	<div class="route_bg">
	    <a href="#">系统管理</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="#" onclick="location.reload();">基本数据测试</a>
	</div>
   	<div align="center" class="kuang">
		
		<!-- 分页用的标签 -->
		<%@ include file="/view/common/pagination/page_tag.jsp" %>
		
	</div>
	
</body>
</html>