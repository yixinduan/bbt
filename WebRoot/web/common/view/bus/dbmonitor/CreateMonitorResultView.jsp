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

<link type="text/css" href="${basePath }/view/common/form/css/add.css?R=4" rel="stylesheet" media="screen" />
<link type="text/css" href="${basePath }/view/common/bootstrap/bootstrap.css?R=5" rel="stylesheet" media="screen" />
<script type="text/javascript" src="${basePath }/view/common/bootstrap/bootstrap.js"></script>

<!-- HighCharts js -->	
<script src="${basePath }/view/common/Highcharts-4.1.7/highcharts.src.js"></script>
<script src="${basePath }/view/common/Highcharts-4.1.7/exporting.src.js"></script>

<style type="text/css">
.input_out {
    height: 25px;
    }
input[type="radio"] {
    width: 14px;
    height: 14px;
    margin-top: -5.5px;
    }
.col-sm-2 {
    width: 26.66666667%;
    text-align: right;
    line-height: 30px;
    float: left;
    font-size: 13px;
}
.col-sm-10 {
    width: 73.33333333%;
    float: left;
    line-height: 30px;
    }
input[type="radio"], input[type="checkbox"] {
    margin: -2px 0px 0px 0px;
    width: 14px;
    height: 14px;
    vertical-align: middle;
    }
</style>

<script type="text/javascript">
	function save() {
		var serverId = $("#selServerId").val();
		var startDate = $("#txtStartDate").val();
		var endDate = $("#txtEndDate").val();
		var interval = $(".radInterval:checked").val();
		var items = "";
		items = $(".chkMonitorItem:checked").map(function(){
			return $(this).val();
		}).get().join(",");
		if ( serverId == "" ) {
			alertMsg_warn("请选择要监控的数据库！");
			return;
		}
		if ( startDate == "" ) {
			alertMsg_warn("开始时间不能为空！");
			return;
		}
		if ( endDate == "" ) {
			alertMsg_warn("结束时间不能为空！");
			return;
		}
		if ( interval === undefined ) {
			alertMsg_warn("请设置监控间隔！");
			return;
		}
		if ( items == "" ) {
			alertMsg_warn("请选择要监控的项目！");
			return;
		}

		$("#txtItems").val(items);
		
		$("#createTask").submit();
	}
	
	/** 格式化时间 */
	function formatTime(date) {
		var fullInt = function(iV) {
			return iV > 9 ? "" + iV : "0" + iV;
		};
		var format = "yyyy-MM-dd HH:mm:ss";
		var str = format.replace("yyyy", date.getFullYear());
		str = str.replace("MM", fullInt(date.getMonth() + 1));
		str = str.replace("dd", fullInt(date.getDate()));
		str = str.replace("HH", fullInt(date.getHours()));
		str = str.replace("mm", fullInt(date.getMinutes()));
		str = str.replace("ss", fullInt(date.getSeconds()));
		return str;
	}
	/** 转化成时间 */
	function parseTime(str) {
		var _parseInt = function(sV) {
			return parseInt(sV, 10);
		}
		var yyyy = _parseInt( str.substr(0, 4) );
		var MM = _parseInt( str.substr(5, 2) );
		var dd = _parseInt( str.substr(8, 2) );
		var HH = _parseInt( str.substr(11, 2) );
		var mm = _parseInt( str.substr(14, 2) );
		var ss = _parseInt( str.substr(17, 2) );
		var date = new Date();
		date.setFullYear(yyyy);
		date.setMonth(MM - 1);
		date.setDate(dd);
		date.setHours(HH);
		date.setMinutes(mm);
		date.setSeconds(ss);
		return date;
	}
	/** 返回最小时间：(0: 开始时间，1：结束时间) */
	function getTimeMin(sign) {
		if ( sign == 0 ) {
			if ( $("#txtEndDate").val() == "" ) {
				return formatTime( new Date() );
			} else {
				var date = parseTime( $("#txtEndDate").val() );
				date.setDate( date.getDate() - 1 );
				return formatTime( date );
			}
		} else {
			if ( $("#txtStartDate").val() == "" ) {
				return formatTime( new Date() );
			} else {
				return $("#txtStartDate").val();
			}
		}
	}
	/** 返回最大时间：(0: 开始时间，1：结束时间) */
	function getTimeMax(sign) {
		if ( sign == 0 ) {
			if ( $("#txtEndDate").val() == "" ) {
				return "";
			} else {
				return $("#txtEndDate").val();
			}
		} else {
			if ( $("#txtStartDate").val() == "" ) {
				return "";
			} else {
				var date = parseTime( $("#txtStartDate").val() );
				date.setDate( date.getDate() + 1 );
				return formatTime( date );
			}
		}
	}
	
	
</script>

</head>


<body class="gundongtiao" style="height:100%">

	<div class="route_bg">
	    <a href="#">监控中心</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="javascript: history.go(-1);">数据库性能监控</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="javascript: void(0);">创建任务</a>
	</div>
	
	<form id="createTask" action="CreateMonitorTask.action" method="post" >
	<fieldset>
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
			<div class="panel-heading">
			   <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:none; color:#333333;">
				    <div style="width: 100%;">
				    	<span class="panel-title">基本信息</span>   			
				   		<i class="button-icon-2 iconOpenClose"></i>
				    </div>
			   </a>
	    	</div>
			<!-- 基本信息 tab -->
			
		<div id="collapseOne" class="panel-collapse collapse in">
		<div class="panel-body" style=" padding: 15px 0px 0px 15px;">
		<input type="hidden" name="items" id="txtItems">
		<input type="hidden" name="taskId" id="txtTaskId" value="${task.id }">
		
		<div class="form-group"> 
			<label class="col-sm-2">任务名称</label>
			<div class="col-sm-10">
				<input name="taskName" id="txtTaskName" value="${task.taskName }" style="width:200px;">
				<p class="help-block"></p>
				</div>
		</div>
		
		<div class="form-group"> 
			<label class="col-sm-2">开始时间</label>
			<div class="col-sm-10">
				<input name="startDate" id="txtStartDate" style="width:200px;"
					onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss', min: getTimeMin(0), max: getTimeMax(0) })" value='<fmt:formatDate value="${task.startTime }" pattern="yyyy-MM-dd HH:mm:ss" />'>
		    <p class="help-block"></p>
		    </div>
		</div>
		
		<div class="form-group"> 
			<label class="col-sm-2">结束时间</label>
			<div class="col-sm-10">
				<input name="endDate" id="txtEndDate" style="width:200px;"
					onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss', min: getTimeMin(0), max: getTimeMax(0) })" value='<fmt:formatDate value="${task.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />'>
		    <p class="help-block"></p>
		    </div>
		</div>
		
		<div class="form-group"> 
			<label class="col-sm-2">数据库</label>
			<div class="col-sm-10">
				<select id="selServerId" name="serverId" style="width:200px;">
					<option value="">--请选择--</option>
					<c:forEach items="${databaseList }" var="database">
						<option value="${database.id }" <c:if test="${database.id eq task.serverId }">selected</c:if> >${database.onlinediskfile.server_name }</option>
					</c:forEach>
				</select>
				<p class="help-block"></p>
			</div>
		</div>
		
		<div class="form-group"> 
			<label class="col-sm-2">监控间隔时间</label>
			<div class="col-sm-10">
				<label> <input type="radio" name="interval" class="radInterval" value="2"  <c:if test="${task.interval eq 2 }">checked</c:if> > 2秒 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input type="radio" name="interval" class="radInterval" value="5"  <c:if test="${task.interval eq 5 }">checked</c:if> > 5秒 </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label> <input checked="checked" type="radio" name="interval" class="radInterval" value="10" <c:if test="${task.interval eq 10 }">checked</c:if> > 10秒 </label>
			    <p class="help-block"></p>
			</div>
		</div>
		
		<div class="form-group"> 
			<label class="col-sm-2">监控项目</label>
			<div class="col-sm-10">
			<c:forEach items="${itemMap }" var="item">
				<label> <input type="checkbox" name="chkMonitorItem" class="chkMonitorItem"
					<c:if test="${fn:indexOf(task.items, item.value) > -1 }">checked</c:if>
					value="${item.value }"> ${item.key } </label> &nbsp;&nbsp;
			</c:forEach>
			<p class="help-block"></p>
			</div>
		</div> 
		
		</div>
	    </div> 

	    <!-- 基本信息 tab end -->
	</div>
	    <div class="form-group" style="margin:20px;">
			<label class="col-sm-2">&nbsp;</label>
			<div class="col-sm-10">
				<button type="button" class="btnNew btn-size-1 btn-blue" onclick="save()">
					<i class="search-icon icon-save"></i>提交
				</button>
			</div>
		</div>

	</div>  
	</fieldset>
	</form>

</body>
</html>