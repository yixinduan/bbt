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

<script type="text/javascript">
function deleteEntity(id) {
	deleteSingleByUrl("${basePath }/roleRemove.action?role.id=" + id);
}

function deleteEntityAll() {
	deleteAllByUrl("${basePath }/roleRemoveAll.action?ids=");
}

function openSearch() {
	var isOpen = $("#openBtn").css("display") == "block";
	if (isOpen) {
		$("#openBtn").hide();
		$("#closeBtn").show();
		$("#searchDiv").animate({
			height : '30px'
		}, "slow");
		$("#highDiv").slideDown("slow");
	} else {
		$("#closeBtn").hide();
		$("#openBtn").show();
		$("#highDiv").slideUp("slow");
		$("#searchDiv").animate({
			height : '30px'
		}, "slow");
	}
}

function sqlcontentExcel() {
	alertMsg_confirm (
		"确定要导出数据吗？", 
		function() {
		},
		function () {
			alertMsg_tips("取消导出！");
		}
	);
}

$(function(){
	selectedSortField("${sidx}","${sord}");
});
</script>

</head>


<body class="gundongtiao">
	<div class="route_bg">
	    <a href="#">系统管理</a><i class="glyph-icon icon-chevron-right"></i>
	    <a href="#" onclick="location.reload();">基本数据测试</a>
	</div>
   	<div align="center" class="kuang">
   		<div class="tool">
	   		<div id="searchDiv" style=" width: 100%; height: 32px;">
	   			<a href="hiUserEdit.action?hiUser.id=-1&orgId=${orgId}" class="buttonNew btn-red-1" style="width: 46px;"><i class="buttonAdd-icon icon-add"></i>添加</a>
	   			<a href="javascript: deleteEntityAll();" class="buttonNew btn-red" style="width: 46px;"><i class="button-icon icon-delete"></i>删除</a>
	   			<button style="" type="button" onclick="openSearch();" class="btnNew btn-size-3 btn-blue">
					<i id="openBtn" style="display: block;" class="button-icon-1 icon-searchOpen"></i>
	                <i id="closeBtn" style="display: none;" class="button-icon-1 icon-searchClose"></i>
				</button>
	   			<a style="cursor: default; padding-top: 6px; padding-left: 10px;" id="onlineuser"></a>
	   			<div title="字段类型 查询" style="float: right;">
	   				<form id="paginationAndSearchForm" action="hiUserList.action" method="post" class="form-inline" >
	   					<!-- 分页隐藏域 -->
	   					<%@ include file="/view/common/pagination/page_hide.jsp" %>
			    		<input type="hidden" name="sidx" value="${sidx}">
			    		<input type="hidden" name="sord" value="${sord}">
						<ul class="ml-navigation-bar-5">
							<div class="search-field" >
								<input type="text" onblur="this.placeholder = '请输入...';" onfocus="this.placeholder = '';" placeholder="请输入..." name="fCommonKey" value="${fCommonKey }"/>
								<input onclick="search();" class="search-button" type="image" src="${basePath }/view/common/simple_search/search-icon-1.png" >
							</div>
						</ul>
					</form>
	   			</div>
			</div>
	   			
	   		<div id="highDiv" style="display: none; width: 100%; margin-top: 5px;">	
	   			<a href="javascript: userExcel()" class="buttonNew btn-blue-2"><i class="button-icon icon-export"></i>导出</a>
	   			<a href="organization/HiuserImport.jsp?orgId=${orgId}" class="buttonNew btn-red-3"><i class="button-icon icon-import"></i>导入</a>
	   		</div>	
	   			
	   	</div>
   	
		<table class="table tableNew" cellspacing="0" >
			<thead><!-- 表头 -->
				<tr>
					<c:if test="${empty lookup }">
						<th width="30"><input type="checkbox" name="idGroup" id="idGroup"></th>
					</c:if>
					<th sortField="userName">用户名</th>
					<th sortField="fullName">姓名</th>
					<th>部门</th>
					<th>角色名称</th>
					<th>安全级别</th>
					<th>登录次数</th>
					<th>
						<c:choose>
							<c:when test="${empty lookup}">操作</c:when>
							<c:otherwise>查找带回</c:otherwise>
						</c:choose>
					</th>
				</tr>
			</thead><!-- 表头结束 -->
			
			<!-- 表体 -->
			<tbody>
				<c:forEach var="item" begin="0" end="10" >
				<tr ondblclick="dblClickEdit('url')">
					<c:if test="${empty lookup}">
						<td align="center">
							<input type="checkbox" name="ids" value="${item.id }" >
						</td>
					</c:if>	
				   	<td>用户${item }</td>
				    <td>zxf_${item }</td>
				    <td>研发部</td>
					<td>管理员</td>
					<td>
						<a title="${item.clientprogram }">
							<c:choose>
								<c:when test="${fn:length(item.clientprogram) > 50 }">	
									${fn:substring(item.clientprogram, 0, 50) }...
								</c:when>
								<c:otherwise>
									${item.clientprogram }
								</c:otherwise>
							</c:choose>
						</a>
					</td>
					<td>3${item }</td>
					<td width="76px;" style="text-align: center;">
						<a href="#" title="修改" > <i class="table-icon icon-edit"></i> </a>
						<a href="javascript: deleteEntity(${item.id })" title="删除" > <i class="table-icon icon-delete"></i> </a>
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