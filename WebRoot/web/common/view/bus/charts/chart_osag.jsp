<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp" %>

<!doctype html>
<html>

<head>

<meta charset="utf-8">

<title>chart osag</title>

<%-- 基本js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp" %>


<!-- 弹出框 js css -->
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<!-- 时间控件 -->
<script type="text/javascript" src="${basePath }/view/common/plugin/laydate/laydate.js"></script>
	
<!-- HighCharts js -->	
<script src="${basePath }/view/common/Highcharts-4.1.7/highcharts.src.js"></script>
<script src="${basePath }/view/common/Highcharts-4.1.7/exporting.src.js"></script>

<script type="text/javascript" src="chart_osag.js?r=1dd3"></script>


<style type="text/css">
a {
	text-decoration: none;
}
 div#wrap {
  display:table;
/*border:1px solid #FF0099;
  background-color:#FFCCFF;*/
  _position:relative;
  overflow:hidden;
 }
 div#subwrap {
  vertical-align:middle;
  display:table-cell;
  _position:absolute;
  _top:50%;
 }
 div#content { 
  _position:relative;
  _top:-50%;
 }
 
</style>

</head>


<body>
	<div class="route_bg">
	    <a href="#" onclick="location.reload()" style="text-decoration:none;">首页</a>
	</div>
	
	<div class="kuang" style="width:100%;">
		
		<div class="search" style="height: 45px; margin: 10px 10px 0px 10px; padding: 10px 10px 0px 10px; border: 1px solid #e7eaec;">
			<label style="margin-left: 30px; margin-right: 30px;">月份</label>
				<input type="text" id="timeValue" name="timeValue" 
					class="inline laydate-icon" style="width:70px; height: 28px; float: none;"  
					onClick="laydate( { format: 'YYYY-MM', max: laydate.now() } );" 
					value="${timeValue }"  /> 
		      
			<button type="button" onclick="queryAudit()" class="btnNew btn-size-1 btn-blue" style=" line-height: 30px;margin-top: -1px;margin-left:5px;">
				<i class="search-icon icon-search"></i>查询
			</button>
		</div>
	
		<div style="width: 100%; height: 300px; margin-top: 10px;">
			<!-- 设备审计比例 -->
			<div id="deviceRatio" style="width: 25%; height: 300px; float: left;"></div>
			
			<!-- 账号审计比例 -->
			<div id="accountRatio" style="width: 25%; height: 300px; float: left;"></div>
			
			<!-- 相关审计比例描述 -->
			<div id="wrap" style="width: 49%; height: 300px; float: left;">
            <div id="subwrap">
            <div id="content">
              <pre>
				<p>系统管理&nbsp;<span id="spanDeviceTotal">XX</span>&nbsp;台设备，其中&nbsp;<span id="spanDeviceAuditNum">XX</span>&nbsp;台设备安全审计中</p>
				<p>系统管理&nbsp;<span id="spanAccountTotal">XX</span>&nbsp;个账号，其中&nbsp;<span id="spanAccountAuditNum">XX</span>&nbsp;个账号安全审计中</p>
			  </pre>
            </div>
            </div>
            </div>
			</div>
		</div>
	
		<div style="width: 100%; height: 300px; margin-top: 10px;">
			<!-- 高中低告警统计 -->
			<div id="alarmStats" style="width: 50%; height: 300px; float: left;"></div>
			
			<!-- 各类事件告警统计 -->
			<div id="eventStats" style="width: 50%; height: 300px; float: right;"></div>
		</div>
		
		<!-- 当月每天会话访问时长 -->
		<div id="sessionTimes" style="width: 100%; height: 300px; margin-top: 10px; float: none;"></div>
		
		<!-- 当月每天高中低告警数量 -->
		<div id="dayAlarmNum" style="width: 100%; height: 300px; margin-top: 10px; "></div>

	</div>
</body>
</html>
