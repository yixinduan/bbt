<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<html  style="height:100%">
<head>
<title>课程留言</title>
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
				<%-- <a href="javascript: deleteEntityAll('${basePath }/kclyAllDel.action?ids=');" class="buttonNew btn-red" style="width: 46px;"><i class="button-icon icon-delete"></i>删除</a> --%>
				<div style="float: right;height: 100%;">
					<form id="paginationAndSearchForm" action="shopcarListBycondition.action" method="post" class="" >
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
					<th width="10%">课程</th>
					<th width="10%">用户</th>
		<!-- 			<th>留言</th> -->
					<th width="100px">操作</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="item" items="${shopcarList}" >
				<tr>
				   	<td>${item.kcgl.name}</td>
				   	<td>${item.user.name}</td>
				   	<%-- <td>${item.content}</td> --%>
					<td>
						<%-- <button onclick="excute('shopcarEdit.action?shopcar.id=${item.id}')" style="width: 40px" class="button button--tamaya button--round-s button--text-thick button--border-thin button--text-upper button--size-s1 button--inverted" data-text="编辑"><span>回复</span></button> --%>
						<button onclick="excute('shopcarDel.action?shopcar.id=${item.id}')" style="width: 40px" class="button button--tamaya button--round-s button--text-thick button--border-thin button--text-upper button--size-s1 button--inverted" data-text="删除"><span>删除</span></button>
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