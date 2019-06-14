<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp"%>

<!DOCTYPE HTML>
<html>
<head>
<title>dddpage</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<%-- 基础js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp"%>

<%-- 弹出框 js css --%>
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<%-- 编辑器 js --%>
<%@ include file="/view/common/jsp/xh_editor.jsp"%>

<%--时间日历控件引用--%>
<script type="text/javascript" src="${basePath }/view/common/plugin/laydate/laydate.js"></script>

<script type="text/javascript" src="${basePath }/view/common/js/idGroup.js"></script>
<link type="text/css" href="${basePath }/view/common/form/css/add.css?R=4" rel="stylesheet" media="screen" />
<link type="text/css" href="${basePath }/view/common/js/form_check.js" rel="stylesheet" media="screen" />
<link type="text/css" href="${basePath }/view/common/bootstrap/bootstrap.css?R=5" rel="stylesheet" media="screen" />
<script type="text/javascript" src="${basePath }/view/common/bootstrap/bootstrap.js"></script>

<style type="text/css">
	input[type='radio'] {
		margin-top: 0px;
		height: 13px;
		margin-right: 5px;
	}
</style>

</head>


<body class="gundongtiao">

	<div class="route_bg">
	    <a href="#">运维宝典</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="javascript:history.go(-1);">任务安排</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="#">添加任务</a>
	</div>

	<div class="kuang" style="padding-top: 10px;">
	<div class="div_from_aoto" style="width: 90%;">
	<form id="editPersonalTask" action="savePersonalTask.action" method="post" >
	<fieldset>
	
		<input type="hidden" name="personalTask.id" value="${personalTask.id }">
		<input id="endId" type="hidden" name="personalTask.endId" >
		<input id="endUser" type="hidden" name="personalTask.endUser">
		
		<div class="control-group"> 
			<label class="laber_from">aaaaa</label>&nbsp;
			bbbbbbb
		</div>
        
		<div class="control-group">
			<label class="laber_from">&nbsp;</label>
			<div class="controls">
				<button style="margin-left: 7px;" type="button" class="btnNew btn-size-1 btn-blue" onclick="ckecks()">
					<i class="search-icon icon-save"></i>提交
				</button>
			</div>
		</div>
		
	</fieldset>
	</form>
	</div>
	</div>

</body>
</html>
