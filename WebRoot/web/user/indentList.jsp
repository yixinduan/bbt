<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<html  style="height:100%">
<head>
<title>采购集合(/IB/WebRoot/web/indent/indentList.jsp)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<!-- 基本js -->
<%@ include file="/web/common/view/common/jsp/base_js_css.jsp" %>
<!-- 表格 分页css, js -->
<%@ include file="/web/common/view/common/jsp/base_table_pagination.jsp" %>
<!-- 弹出框 js css -->
<%@ include file="/web/common/view/common/jsp/art_dialog.jsp"%>

<link rel="stylesheet" type="text/css" href="${basePath}/web/common/css3_button/css/buttons.css">
<style type="text/css">
.tool {
    padding: 0px;
    text-align: left;
    margin: 10px 0px 10px 0;
}
.tableNew {
    width: 100%;
    margin-top: 10px;
}
</style>
<script type="text/javascript">
function excute(url){
	window.location.href = url;
}
function excute_qr(url, user_id, indent_id){

	var content = '';
	while (content.trim() == '') {
		content = prompt("请留言","");
	}
	
	$.post("msgSave.action?date"+Math.random(),{'msg.user.id':user_id, 'msg.indent.id':indent_id, 'msg.user_content':content},function(data){
		window.location.href = url;
	});
}


function deleteEntityAll(url) {
	deleteAllByUrl(url);
}

</script>

</head>

<body class="gundongtiao" style="height:95%">
	<div id="divTable" align="center" style="height:95%">
		<div class="tool" style="display: none">
			<div id="searchDiv" style=" width: 100%; height: 32px;">
				<div style="float: right;height: 100%;">
					<form id="paginationAndSearchForm" action="indentListBycondition.action" method="post" class="" >
						<!-- 分页隐藏域 -->
						<%@ include file="/web/common/view/common/pagination/page_hide.jsp" %>
						<ul class="ml-navigation-bar-5" style="margin-top: 0px;margin-bottom: 0px; ">
							<div class="search-field" >
								<input type="text" onblur="this.placeholder = '请输入...';" onfocus="this.placeholder = '';" placeholder="请输入策略名称..." name="condition" value="${condition }"/>
								<input onclick="search();" class="search-button" type="image" src="${basePath }/web/common/view/common/simple_search/search-icon-1.png"/>
							</div>
						</ul>
					</form>
				</div>
			</div>
		</div>

	   	
		<table class="table tableNew" cellspacing="0" >
			<thead>
				<tr>
					<th width="30px"><input type="checkbox" name="idGroup" id="idGroup"></th>
					<th width="30%">订单编号</th>
					<th width="50%">菜单</th>
					<th width="5%">价格</th>
					<th width="10%">状态</th>
					<th width="52px">操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="item" items="${indentList}" >
				<tr>
					<td align="center"><input type="checkbox" name="ids" value="${item.id }" ></td>
				   	<td>${item.code}</td>
				   	<td>${item.zymd_ids}</td>
				   	<td>${item.price1}</td>
				   	<td>${item.price}</td>
					<td>
						<c:if test="${item.status eq 'xd'}">下单</c:if>
						<c:if test="${item.status eq 'fh'}">配送</c:if>
						<c:if test="${item.status eq 'sjqx'}">商家取消</c:if>
						<c:if test="${item.status eq 'yhqx'}">取消</c:if>
						<c:if test="${item.status eq 'qr'}">完成</c:if>
					</td>
					<td>
						
						<c:if test="${item.status eq 'xd'}">
							<button onclick="excute('indentUpdate.action?indent.id=${item.id}&indent.status=yhqx')"  style="width: 40px;" class="button button--tamaya button--round-s button--text-thick button--border-thin button--text-upper button--size-s1 button--inverted" data-text="取消"><span>取消</span></button>
						</c:if>
						<c:if test="${item.status eq 'fh'}">
							<button onclick="excute_qr('indentUpdate.action?indent.id=${item.id}&indent.status=qr', '${user.id }', '${item.id }')"  style="width: 40px;" class="button button--tamaya button--round-s button--text-thick button--border-thin button--text-upper button--size-s1 button--inverted" data-text="确认"><span>确认</span></button>
						</c:if>
						
					</td>
				</tr>
				</c:forEach>
			</tbody><!-- 表体结束 -->
		</table>
		
		<!-- 分页用的标签 -->
		<%@ include file="/web/common/view/common/pagination/page_tag.jsp" %>
	</div>

		
		<script>
			(function() {

				var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);

				if(isSafari) {

					document.getElementById('support-note').style.display = 'block';

				}

			})();

		</script>
</body>
</html>