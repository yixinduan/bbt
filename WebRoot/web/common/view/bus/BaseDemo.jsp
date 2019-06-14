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

<title>默认首页值</title>

<%-- 基本js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp" %>
<%-- 表格分页css, js --%>
<%@ include file="/view/common/jsp/base_table_pagination.jsp" %>

<script type="text/javascript" src="${basePath }/view/common/js/idGroup.js"></script>

</head>


<body class="gundongtiao">

	<div style="margin: 30px;">
		<b>静态参照</b>
		<br>	<br>	<br>
		
		<a href="${basePath }/downFile.jsp">单查询列表-参照</a>	<br> <br>
		
		<a href="${basePath }/view/bus/BaseData2.jsp">多查询列表-参照</a>	<br> <br>

		<a href="${basePath }/view/bus/BaseEdit.jsp">单Tab修改-参照</a>	<br> <br>

		<a href="${basePath }/view/bus/BaseEdit2.jsp">多Tab修改-参照</a>	<br> <br>

		<a href="${basePath }/view/bus/BaseImport.jsp">导入-参照</a>	<br> <br>

		<a href="${basePath }/view/bus/BaseImport2.jsp">模板导入-参照</a>	<br> <br>
		
	</div>	
	
</body>
</html>