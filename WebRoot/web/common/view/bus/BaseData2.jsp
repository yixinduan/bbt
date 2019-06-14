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

function openSearch() {
	var isOpen = $("#openBtn").css("display") == "block";
	if (isOpen) {
		$("#openBtn").hide();
		$("#closeBtn").show();
		$("#searchDiv").animate({
			height : '65px'
		}, "slow");
		$("#highDiv").slideDown("slow");
		$("#openBtn").hide();
		$("#closeBtn").show();
		$("#searchDiv").animate({
			height : '90px'
		}, "slow");
		$("#highDiv3").slideDown("slow");
	} else {
		$("#closeBtn").hide();
		$("#openBtn").show();
		$("#highDiv").slideUp("slow");
		$("#searchDiv").animate({
			height : '25px'
		}, "slow");
	}
}

function deleteEntity(id) {
	deleteSingleByUrl("${basePath }/roleRemove.action?role.id=" + id);
}

function deleteEntityAll() {
	deleteAllByUrl("${basePath }/roleRemoveAll.action?orderIndexs=");
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
   		<div id="searchDiv"  class="search" style="width: 96.5%; height: 25px;">
			<form id="paginationAndSearchForm" action="hiLogList.action" method="post" class="form-inline" >
				<!-- 分页用的隐藏域 -->
				<%@ include file="/view/common/pagination/page_hide.jsp" %>
				<div style=" height: 25px;">
					    
					<label>操作时间</label><!-- onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" -->
						<input type="text" id="start_hilog"  style="width:125px;" name="startDate" class="inline laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="<fmt:formatDate value='${pageInfo.f_operateDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" />
						<input type="hidden" name="pageInfo.f_operateDate_op" value="&gt;="><span style="margin-top: -1px;">-</span> 
						<input type="text" id="end_hilog" style="width:125px;" name="endDate" class="inline laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="<fmt:formatDate value='${pageInfo.f_operateDate01}' pattern='yyyy-MM-dd HH:mm:ss'/>" />
						<input type="hidden" name="pageInfo.f_operateDate01_op" value="&lt;=">
					
					<label>员工姓名</label>
					    <input class="input_out" type="text" style="width:125px;" name="pageInfo.operator.f_fullName" value="${pageInfo.operator.f_fullName}" />

					<label>aaaaaa</label>
					    bbbbbbb
					    		
					<div class="subBar">
						<button type="button" onclick="search();" class="btnNew btn-size-1 btn-blue"><i class="search-icon icon-search"></i>查询</button>
						<button type="button" onclick="openSearch();" class="btnNew btn-size-3 btn-blue">
				   			<i id="openBtn" style="display: block;" class="button-icon-1 icon-searchOpen"></i>
				   			<i id="closeBtn" style="display: none;" class="button-icon-1 icon-searchClose"></i>
				   		</button> 
		            </div>
				  </div>					
					
                <div id="highDiv" style="display: none; width: 100%;margin-left: 13px; height: 65px; margin-top: 10px;">
					<label>关键字</label>
					<input class="input_out" type="text"  style="width:123.5px; height: 23px;" name="keyword" value="${keyword }"/>
					<select name="keywordRel" class="input_out" style="height:25px; margin-left: 2px; width:54px; margin-right: 2px;">
						<option value="AND" <c:if test="${keywordRel eq 'AND' }">selected</c:if> >并且</option>
						<option value="OR"  <c:if test="${keywordRel eq 'OR' }">selected</c:if>  >或者</option>
						<option value="NOT" <c:if test="${keywordRel eq 'NOT' }">selected</c:if> >排除</option>
					</select>
					<input class="input_out" type="text"  style="width:123.5px; height: 23px;" name="keywordChild" value="${keywordChild }"/>
					<label>操作内容</label>
					<input class="input_out" type="text" name="pageInfo.f_actionContext" style="width:125px;" value="${pageInfo.f_actionContext}" />
					<br />
			      <div id="highDiv3" style="display: none;margin-left: 13px; width: 100%; height: 100px; margin-top: 15px;">
			        <label>动作</label>
					<input class="input_out" type="text" name="pageInfo.f_action" style="width:143px;" value="${pageInfo.f_action}" />
			       
                  </div>
                </div>
   		
			</form>

	   	</div>
   	
   		<div class="tool">
   			<a href="hiUserEdit.action?hiUser.id=-1&orgId=${orgId}" class="buttonNew btn-red-1" style="width: 46px;"><i class="buttonAdd-icon icon-add"></i>添加</a>
	   		<a href="javascript: deleteEntityAll();" class="buttonNew btn-red" style="width: 46px;"><i class="button-icon icon-delete"></i>删除</a>
			<a href="javascript: hiLogExcel()" title="导出EXCEL" class="buttonNew btn-blue-2"><i class="button-icon icon-export"></i>导出</a>
			<a href="organization/HiuserImport.jsp?orgId=${orgId}" class="buttonNew btn-red-3"><i class="button-icon icon-import"></i>导入</a>
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
					<td>高级</td>
					<td>3${item }</td>
					<td width="76px;" style="text-align:left;">
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