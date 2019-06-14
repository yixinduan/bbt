<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp" %>
<!DOCTYPE HTML>
<html style="height:97%">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<title>数据库性能实时监控</title>

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

<script src="${basePath }/view/bus/dbmonitor/js/DbRealTime.js?R=ba2"></script><!-- <%=Math.random() %> -->
<link type="text/css" href="${basePath }/view/common/form/css/add.css?R=4" rel="stylesheet" media="screen" />

<script type="text/javascript">
	var basePath = "${basePath }";
	var itemStrMap = {};
	<c:forEach items="${itemMap }" var="item">
		itemStrMap["${item.value }"] = "${item.key }";
	</c:forEach>
	
	function returnList() {
		if ( nonRunSign ) {
			history.go(-1);
		} else {
			alertMsg_tips("正在监控！请结束监控再返回！");
		}
	}
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
	    <a href="javascript: returnList();">数据库性能监控</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="javascript: void(0);">实时监控</a>
	</div>
	
   	<div align="center" class="kuang" style="height:95%">	
   	
   		<div id="searchDiv"  class="search" style="width: 96.5%; height: 50px;">
			<label>数据库</label>
				<select id="selServerId" style=" float: left;height:25px;">
					<option value="">--请选择--</option>
					<c:forEach items="${databaseList }" var="database">
						<option value="${database.id }">${database.onlinediskfile.server_name }</option>
					</c:forEach>
				</select>
			
			<label>监控间隔时间</label>
				<span style="float: left;line-height:25px;vertical-align: middle;margin-top: 0px;">
					<input type="radio" name="radInterval" class="radInterval" value="2"> 2秒 &nbsp;&nbsp;
					<input type="radio" name="radInterval" class="radInterval" value="5"> 5秒  &nbsp;&nbsp;
					<input checked="checked" type="radio" name="radInterval" class="radInterval" value="10"> 10秒
				</span>
			
			<div class="subBar" style="margin-right: 15px;" align="right">
				<button id="btnStart" onclick="start();" class="btnNew btn-size-1 btn-blue">启动监控</button>
				<button id="btnStop"  onclick="stop()" style="display: none;" class="btnNew btn-size-1 btn-blue">结束监控</button>
			</div>
	
			<div style="margin-top:5px;">
				<label>监控项目</label>&nbsp;&nbsp;
				<c:forEach items="${itemMap }" var="item">
					<label style="margin-left: 15px;"> <input type="checkbox" name="chkMonitorItem" class="chkMonitorItem" value="${item.value }"> ${item.key } </label>
				</c:forEach>
			</div>
			
   		</div>

		<div>
			<c:forEach items="${itemMap }" var="item">
				<div id="divItem_${item.value }" style="display: none;">
					<!-- <label>${item.key }</label> -->
					<div id="container_${item.value }" style="height: 400px; width: 100%; margin: 0 auto;margin-top: 20px"></div>
					
				</div>
			</c:forEach>
		</div>
    </div>
	</div>
</body>
</html>