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

<title>数据库性能监控</title>

<%-- 基本js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp" %>

<%-- 表格分页css, js --%>
<%@ include file="/view/common/jsp/base_table_pagination.jsp" %>

<!-- 弹出框 js css -->
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<script type="text/javascript" src="${basePath }/view/common/js/idGroup.js"></script>

<!-- 日历控件 -->
<script type="text/javascript" src="${basePath }/view/common/plugin/laydate/laydate.js"></script>

<script type="text/javascript">
function deleteEntity(id) {
	deleteSingleByUrl("${basePath }/DeleteMonitorTask.action?taskId=" + id);
}

function deleteEntityAll() {
	deleteAllByUrl("${basePath }/BatchDeleteMonitorTask.action?taskIds=");
}

/** 边框自适应列表 */
$().ready(function(){
	var clientHeight = document.body.clientHeight - 43;
	if($("#Result").height()<clientHeight){
		$(".kuang").css("height","92%");
	}else{
		$(".kuang").css("height","auto");
	}
	//alert($(".kuang").height()+"============="+document.body.clientHeight);
});
</script>

<style type="text/css">
.input_out {
    height: 25px;
    }
input[type="radio"] {
    width: 14px;
    height: 14px;
    margin-top: -5.5px;
    }
</style>

</head>


<body class="gundongtiao" style="height:100%">

	<div class="route_bg">
	    <a href="#">监控中心</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="#" onclick="history.go(-1);">数据库性能监控</a>
	</div>
   	<div align="center" class="kuang" style="height:92%">
   	
   		<div class="tool">
   			<a href="${basePath }/DbRealTimeMonitor.action" class="buttonNew btn-blue"><i class="buttonAdd-icon icon-enlarge"></i>实时监控</a>
   			<a href="${basePath }/CreateMonitorTaskView.action" class="buttonNew btn-red-1"><i class="buttonAdd-icon icon-add"></i>新建任务</a>
 			<a href="javascript: deleteEntityAll();" class="buttonNew btn-red"><i class="button-icon icon-delete"></i>删除任务</a>
 			<a href="javascript: search();" style="display: none;" class="buttonNew btn-blue">刷新列表</a>
   		</div>
		<form id="paginationAndSearchForm" action="DbserverMonitor.action" method="post" class="form-inline" >
			<!-- 分页用的隐藏域 -->
			<%@ include file="/view/common/pagination/page_hide.jsp" %>
		</form>
	   	
		<table class="table tableNew" cellspacing="0" id="kuangTable">
			<thead><!-- 表头 -->
				<tr>
					<th width="30"><input type="checkbox" name="idGroup" id="idGroup"></th>
					<th>任务名称</th>
<!-- 					<th>创建时间</th> -->
					<th>开始时间</th>
					<th>结束时间</th>
					<th>类型</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead><!-- 表头结束 -->
			
			<!-- 表体 -->		
			<tbody>
				<c:forEach var="item" items="${taskList }" varStatus="s">
				<tr align="center" >	
					<td align="center"> <c:if test="${item.status ne 2 }"> <input type="checkbox" name="ids" value="${item.id }"> </c:if> </td>
					<td>${item.taskName }</td>
<%-- 					<td> <fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td> --%>
					<td> <fmt:formatDate value="${item.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					<td> <fmt:formatDate value="${item.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
					 <td>
				    	<c:if test="${item.type == 1}">
				    		定时任务
				    	</c:if>
				    	<c:if test="${item.type == 2}">
				    		实时监控
				    	</c:if>				  		 
				   	</td>				   
				    <td class="alarmi_select">
				    	<c:if test="${item.status == 1}">
				    		<samp style="color:#666;">未开始</samp>
				    	</c:if>
				    	<c:if test="${item.status == 2}">
				    		<samp style="color:#666;">执行中</samp>
				    	</c:if>
				    	<c:if test="${item.status == 3}">
				    		<samp style="color:#666;">已执行</samp>
				    	</c:if>
				    	<c:if test="${item.status == 4}">
				    		<samp style="color:#666;">已执行</samp><!-- 原意：断连结束 -->
				    	</c:if>
				    	<c:if test="${item.status == 5}">
				    		<samp style="color:#666;">该数据库无法连接</samp><!-- 连接出错 -->
				    	</c:if>
				   </td>
				   <td>
				   		<div style="width: 50px; text-align: left; margin: auto;">
					   		<c:if test="${item.status == 1 and item.type == 1 }"><!-- 定时任务 -->
						   		<a href="javascript: deleteEntity(${item.id });" title="删除"><i class="table-icon icon-delete"></i></a>
							   	<a href="${basePath }/CreateMonitorTaskView.action?taskId=${item.id }" title="修改"><i class="table-icon icon-edit"></i></a>
					    	</c:if>
					   		<c:if test="${item.status == 3 or item.status == 4 or item.status == 5 }">
						    	<c:if test="${item.status ne 5 }">
						   			<a href="${basePath }/ViewMonitorResult.action?taskId=${item.id }" title="查看"><i class="table-icon icon-open"></i></a>
						   		</c:if>
						    	<c:if test="${item.status ne 2}">
						   			<a href="javascript: deleteEntity(${item.id });" title="删除"><i class="table-icon icon-delete"></i></a>
						    	</c:if>
					    	</c:if>
				   		</div>
				   </td>
				</tr>
				</c:forEach>
			</tbody><!-- 表体结束 -->
		</table>
		
		<!-- 分页用的标签 -->
		<%@ include file="/view/common/pagination/page_tag.jsp" %>

	</div>
	
</body>
</html>