<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<html  style="height:100%">
<head>
<title>知识点列表</title>
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

function deleteEntityAll(url) {
	deleteAllByUrl(url);
}

</script>

</head>

<body class="gundongtiao" style="height:95%">
	<div id="divTable" align="center" style="height:95%">
		<div class="tool">
			<div id="searchDiv" style=" width: 100%; height: 32px;">
				<a onclick="excute('zymdEdit.action')" class="buttonNew btn-red-1" style="width: 46px;"><i class="buttonAdd-icon icon-add"></i>添加</a>
				<div style="float: right;height: 100%;">
					<form id="paginationAndSearchForm" action="zymdListBycondition.action" method="post" class="" >
						<!-- 分页隐藏域 -->
						<%@ include file="/web/common/view/common/pagination/page_hide.jsp" %>
						<ul class="ml-navigation-bar-5" style="margin-top: 0px;margin-bottom: 0px; ">
							<div class="search-field" >
								<input type="text" onblur="this.placeholder = '请输入...';" onfocus="this.placeholder = '';" placeholder="请输入名称..." name="condition" value="${condition }"/>
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
					<th width="25%">名称</th>
					<th width="25%">时间</th>
					<th width="52px">操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="item" items="${zymdList}" >
				<tr>
					<td align="center"><input type="checkbox" name="ids" value="${item.id }" ></td>
				   	<td>${item.shopname}</td>
				    <td>${item.time}</td>
					<td>
						<button onclick="excute('zymdEdit.action?zymd.id=${item.id}')" style="width: 40px" class="button button--tamaya button--round-s button--text-thick button--border-thin button--text-upper button--size-s1 button--inverted" data-text="编辑"><span>编辑</span></button>
						<button onclick="excute('zymdDel.action?zymd.id=${item.id}')" style="width: 40px" class="button button--tamaya button--round-s button--text-thick button--border-thin button--text-upper button--size-s1 button--inverted" data-text="删除"><span>删除</span></button>
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