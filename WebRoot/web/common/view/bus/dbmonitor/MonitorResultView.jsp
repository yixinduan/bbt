<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp" %>
<!DOCTYPE HTML>
<html style="height:100%">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<title>数据库性能实时监控视图详情</title>

<%-- 基本js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp" %>

<%-- 表格分页css, js --%>
<%@ include file="/view/common/jsp/base_table_pagination.jsp" %>

<!-- 弹出框 js css -->
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<script type="text/javascript" src="${basePath }/view/common/js/idGroup.js"></script>

<!-- 日历控件 -->
<script type="text/javascript" src="${basePath }/view/common/plugin/laydate/laydate.js"></script>

<!-- HighCharts js -->	
<script src="${basePath }/view/common/Highcharts-4.1.7/highcharts.src.js"></script>
<script src="${basePath }/view/common/Highcharts-4.1.7/exporting.src.js"></script>

<script src="${basePath }/view/bus/dbmonitor/js/MonitorResult.js?R=0a33"></script><!-- <%=Math.random() %> -->
<link type="text/css" href="${basePath }/view/common/form/css/add.css?R=4" rel="stylesheet" media="screen" />

<script type="text/javascript">
	var basePath = "${basePath }";
	var itemStrMap = {};
	<c:forEach items="${itemMap }" var="item">
		itemStrMap["${item.value }"] = "${item.key }";
	</c:forEach>
	
	var dataMap = {};
	for ( var i = 1; i <= 6; i++ ) {
		dataMap["arr" + i] = [];
		dataMap["xArr" + i] = [];
	}
	<c:forEach items="${maxMap }" var="item">
		dataMap["${item.key }"] = "${item.value }";
	</c:forEach>
	
	
	$(function(){

		var map = {};
		showHide(false);
		
		<c:forEach items="${resultList }" var="item">
			dataMap["arr${item.itemId }"].push( parseInt("${item.value }") );
			dataMap["xArr${item.itemId }"].push( '<fmt:formatDate value="${item.logTime }" pattern="HH:mm:ss" />' );
			map["${item.itemId }"] = parseInt("${item.value }");
		</c:forEach>
		
		for (var id in map) {
			showChart(id);
		}
		
		$("select, input").attr("disabled", "disabled");
		
	});
</script>

<style type="text/css">
.input_out {
    height: 25px;
    }
input[type="radio"], input[type="checkbox"] {
    margin: -2px 0px 0px 0px;
    width: 14px;
    height: 14px;
    vertical-align: middle;
    }
</style>

</head>


<body class="gundongtiao" style="height:100%">

	<div class="route_bg">
	    <a href="#">监控中心</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="javascript: history.go(-1);">数据库性能监控</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="javascript: void(0);">监控结果</a>
	</div>
   	<div align="center" class="kuang" style="height:95%">
   	
   		<div id="searchDiv"  class="search" style="width: 96.5%; height: 50px;">
   			<div style="width:100%;float: left;">
				<label>数据库${task.serverId }</label>
					<select id="selServerId" style=" float: left;height:25px;">
						<option value="">--请选择--</option>
						<c:forEach items="${databaseList }" var="database">
							<option value="${database.id }" <c:if test="${task.serverId eq database.id }"> selected </c:if> >${database.onlinediskfile.server_name }</option>
						</c:forEach>
					</select>
				
				<label>监控间隔时间</label>
					<span style="float: left;line-height:25px;vertical-align: middle;margin-top: 0px;">
						 <input type="radio" name="radInterval" class="radInterval" value="2" <c:if test="${task.interval eq 2 }"> checked </c:if> > 2秒 &nbsp;&nbsp;
						 <input type="radio" name="radInterval" class="radInterval" value="5" <c:if test="${task.interval eq 5 }"> checked </c:if> > 5秒  &nbsp;&nbsp;
						 <input type="radio" name="radInterval" class="radInterval" value="10" <c:if test="${task.interval eq 10 }"> checked </c:if> > 10秒
				    </span>
	     	</div>
			<div style="margin-top:10px;float:left;">
				<label class="laber_from" style="margin-left: 10px;line-height: 20px;">监控项目</label>
				<c:forEach items="${itemMap }" var="item">&nbsp;&nbsp;
					<input type="checkbox" name="chkMonitorItem" class="chkMonitorItem" value="${item.value }"
						<c:if test="${fn:indexOf(task.items, item.value) > -1 }"> checked </c:if> > ${item.key } &nbsp;
				</c:forEach>
			</div>
   		</div>

		<div >
			<c:forEach items="${itemMap }" var="item">
				<div id="divItem_${item.value }" style="display: none;">
					<!-- <label>${item.key }</label> -->
					<div id="container_${item.value }" style="height: 400px; width: 100%; margin: 0 auto;"></div>
				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>