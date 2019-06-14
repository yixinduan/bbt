<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<html  style="height:100%">
<head>
<title>供应商集合(/IB/WebRoot/web/supplier/supplierList.jsp)</title>
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

</script>

</head>

<body class="gundongtiao" style="height:95%">
	<div id="divTable" align="center" style="height:95%">
		
	   	
		<table class="table tableNew" cellspacing="0" >
			<thead>
				<tr>
					<th width="30px"><input type="checkbox" name="idGroup" id="idGroup"></th>
					<th width="20%">用户</th>
					<th width="20%">用户留言</th>
					<th width="30%">回复</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="item" items="${msgList}" >
				<tr>
					<td align="center"><input type="checkbox" name="ids" value="${item.id }" ></td>
				   	<td>${item.user.name}</td>
				   	<td>${item.user_content}</td>
				   	<td>${item.root_content}</td>
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