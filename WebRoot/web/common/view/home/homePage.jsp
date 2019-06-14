<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp" %>

<!doctype html>
<html  style="height:100%;">
<head>

<meta charset="utf-8">
<title>homePAGE</title>

<link rel="stylesheet" type="text/css" href="${basePath }/view/home/index/style.css">
<%-- 基本js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp" %>

<!-- 弹出框 js css -->
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<!-- 时间控件 -->
<script type="text/javascript" src="${basePath }/view/common/plugin/laydate/laydate.js"></script>

<%@ include file="/view/common/jsp/base_table_pagination.jsp" %>
	
<!-- 表格 js -->
<script type="text/javascript" src="${basePath }/view/common/js/idGroup.js"></script>
<link type="text/css" href="${basePath }/view/common/css/animate.css" rel="stylesheet">
<link type="text/css" href="${basePath }/view/common/simple_search/ml-navigation-bar.css?R=2" rel="stylesheet"/>
<link type="text/css" href="${basePath }/view/common/form/css/table.css?R=2" rel="stylesheet"/>
	
<!-- HighCharts js -->	
<script src="${basePath }/view/common/Highcharts-4.1.7/highcharts.src.js"></script>
<script src="${basePath }/view/common/Highcharts-4.1.7/exporting.src.js"></script>

<script type="text/javascript" src="${basePath }/view/home/js/homePage.js?r=1dd3"></script>
<script type="text/javascript" src="${basePath }/view/home/js/homePage2.js?r=1dd3"></script>
<script type="text/javascript" src="${basePath }/WebApp/js/index_date_risk.js?r=1ddd3"></script>

<style type="text/css">
.gundongtiao::-webkit-scrollbar {
 width: 10px;
 height:10px;
}
.gundongtiao::-webkit-scrollbar-track {
 background-color:#F7F3F7;
}
.gundongtiao::-webkit-scrollbar-thumb {
 background-color: #BDBEBD;
}
.t1{
	font-family:"微软雅黑";
	font-size:16px;
	margin-top:20px;
	margin-bottom:10px;
	}
.btn-red-1 {
    color: white;
    background-color: #5bb75b;
    border:none;
}
.buttonNew {
    display: inline-block;
    zoom: 1;
    vertical-align: baseline;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    font-weight: 500;
    padding: 0.55em 2em;
    -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
    box-shadow: 0 1px 2px rgba(0,0,0,.2);
    }
.alarmTimeDivtable th,
.opCountDivtable th {
    font-size: 13px;
    padding-top: 10px;
    text-align: center;
    background: #e8eaeb;
    vertical-align: middle;
    border-right: 1px solid #DEDEDE;
}
a {
 text-decoration: none;
}
td {
    border-top: 1px solid #e0e0e0;
    border-right: 1px solid #e0e0e0;
    /* vertical-align: middle; */
    line-height: 20px;
}
#gt_year,#gt_month,#lt_year,#lt_month{vertical-align: middle;cursor:pointer;height:20px;/*font-size:14px;*/font-weight:bold;color:#223c5f;}
</style>
<script type="text/javascript">
    /** 个人中心 */
    function personalCenter() {
    	art.dialog.open('${basePath }/personalSettingView.action', { title: '个人中心', lock: true, esc: false, dblclick_hide: false, width: 500, height: 500 });
    }
	$(document).ready(function(){
		$.ajax({
   			type: "post",
   			url: "${basePath }/getLockDisplay.action?date="+Math.random(),
   			cache: false,
   			success: function(response){
   				var data = eval("(" + response + ")");
   				if(data.result=="true"){
   					lockScreen();
   				}
   			}
   		});
		
		$("#yyyyMMddDiv").hide();
		$("#opCountDiv").hide();
		$("#alarmTimeDiv").hide();// dd
		$("#protocolChart").hide();
		
		var version = "${authVersionType }";
		if ( "医疗" == version ) {
			$("#yyyyMMddDiv").show();
			$("#opCountDiv").show();
			$("#alarmTimeDiv").show();
			
			deteforrisk("", "", 0);// 初始化年月日面板
			indexGetRisk();// 本月操作次数
			indexGetCountRisk();// 告警时间
			
			$('#gt_year').click(function(){year_add(this);});
			$('#lt_year').click(function(){year_rem(this);});
			$('#gt_month').click(function(){month_add(this);});
			$('#lt_month').click(function(){month_rem(this);});
			$('#gt_year,#lt_year,#gt_month,#lt_month').hover(function(){$(this).css('color','green');},function(){$(this).css('color','#223c5f');});
		} else {
			$("#protocolChart").show();
		}
		
		
	});
</script>
</head>
<body class="gundongtiao">
	<div class="route_bg">
	    <a href="#" onclick="location.reload()" style="text-decoration:none;">首页</a>
	</div>
	
<div class="kuang" style="width:100%;height:1310px;" align="center">
	<input type="hidden" name="version" value="${authVersionType }" >
		
	<!-- 页面头部 -->	
	<div id="0" style="width:90%; height: 50px; margin-top:20px;" align="left">
	   <span style="font-size:15px; line-height:30px;">
	      <!-- 欢迎使用DBAG审计系统 -->
	      ${sessionScope.sysLogo.loginGreeting}	
	   </span>
	</div>

	<div class="shortcut" style="width:90%; height:100px;z-index:2" align="center">
		<c:forEach items="${sessionScope.quickMap }" var="item">
			<c:set value="${fn:split(item.value, '-')}" var="str"/>
			<div style="width:25%; float:left;">
				<a href="${str[0]}" style="cursor:${str[4]}; ${str[4] eq 'default' ? 'background-color: #F2F2F2;' : ''}">
				 	<img class="imgH" src="${basePath }/view/home/index/${str[1]}" alt="" height="82" width="127">
				 	<span style="color: ${str[3]}">${str[2]}</span>
				</a>
			</div>
		</c:forEach>
	</div>

	<!-- 图表显示部分 -->	
	<div id="1" style="width:90%; height:400px; margin-top:20px; margin-bottom:20px;">
	   <div id="facilityChart"  style="min-width: 310px; width:100%; height: 400px; margin: 0 auto;"></div>
	   <div style="height: 50px;"></div>
	   
	   <!-- 医疗版本——年月日 -->
	   <div id="yyyyMMddDiv" style="width:100%; height: 330px;">
	   		<form id="sm" name="sm" method="post" action="?">
				<div style="fposition:relative;width:100%;height:260px;padding-left:2px;margin:0 auto;padding-top:10px;">
				<h2 style="color:#000;font-size:16px;font-weight:bold;">高危事件监控&nbsp;<span style="font-size:14px;color: #A2A2A2;">(标红显示)</span></span></h2>
				<table id="datepro" border="0" cellpadding="0" cellspacing="0"  style="margin:20px auto 0;border-radius:0px;/* border:1px solid #7c8995;*/border-collapse:collapse;width:100%;height:100%;/*background:#c1edf2 url(WebApp/css/images/index_table_bg.png) repeat;*/"> 					
				<thead>
					<tr>
						<th style="height:20px;" id="lt_year">&lt;&lt;</th> <th id="lt_month">&lt;</th> 
						<th colspan="3" align="center" style="text-align:center;">
							<span style="display:inline-block;width:100%;height:20px;fbackground:green;position:relative;overflow:hidden;">
							<span style="position:absolute;fbackground:red;left:30%;top:0;">
							<select name="option_year" id="option_year" onChange="select_c();">
								<option value="2012">2012</option> 
								<option value="2013">2013</option> 
								<option value="2014">2014</option> 
								<option value="2015">2015</option> 
								<option value="2016">2016</option> 
								<option value="2017">2017</option> 
								<option value="2018">2018</option> 
								<option value="2019">2019</option> 
								<option value="2020">2020</option> 
								<option value="2021">2021</option> 
								<option value="2022">2022</option> 
								<option value="2023">2023</option> 
								<option value="2024">2024</option> 					
							</select>
							<input type="text" id="year_ss" style="display: none;" name="year"  value="${year}" onkeydown="enter_d();" onchange="checkyear()" />
							<input type="text" style="width:20px;border:0;color:#000;/*background:#7abcc4;*/" value="年" readonly="readonly" disabled="disabled" />
							<select id="month_ss" class="month_mo" name="month" size="1" onchange="change_ym()" > 
								<option value="0">1</option> 
								<option value="1">2</option> 
								<option value="2">3</option> 
								<option value="3">4</option> 
								<option value="4">5</option> 
								<option value="5">6</option> 
								<option value="6">7</option> 
								<option value="7">8</option> 
								<option value="8">9</option> 
								<option value="9">10</option> 
								<option value="10">11</option> 
								<option value="11">12</option> 
							</select>
							<input type="text" style="width:20px;border:0;color:#000;/*background:#7abcc4;*/" value="月" readonly="readonly" disabled="disabled" />
							</span>
							</span>
						</th>
						<th id="gt_month">&gt;</th> <th id="gt_year">&gt;&gt;</th>
					</tr>
					<tr class="day" style="color:#526585;font-size:18px;font-weight:900;height:20px;"> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;color:#328BD0;">日</th> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;">一</th> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;">二</th> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;">三</th> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;">四</th> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;">五</th> 
						<th width="14.2%" style="font-family: '微软雅黑';border-top: 1px solid #e0e0e0;border-right: 1px solid #e0e0e0;font-size: 12px;color:#328BD0;">六</th> 
					</tr> 
				</thead>
				<tbody id="risk_body"></tbody> 
				</table> 
				</div>
			</form> 
	   </div>
	   <div id="protocolChart" style="width:100%; height: 400px;"></div>
	   <div id="opCountDiv" class="opCountDivtable" style="width:100%; height: 140px;">
	   		<table class="listTest" id="logtable" style="margin:20px auto 0;width: 100%;text-align: center;border-spacing: 0px; border-radius:0px;">
				<thead></thead>
				<tbody></tbody>
			</table> 
	   </div>
	   <div id="alarmTimeDiv" class="alarmTimeDivtable"  style="width:100%; height: 140px;">
	   		<table class="listTest" id="loginlogtable" style="margin:20px auto 0;width: 100%;text-align: center;border-spacing: 0px; border-radius:0px;">
				<thead></thead> 
				<tbody></tbody>
			</table>
	   </div>
	</div>

</div>

</body>
</html>
