<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- border: 1px solid #F00; --%>
<div style="margin: 0 auto; width: 100%; text-align: center; ">
	<!-- 注：pageNumDiv隐藏，js中show() -->
	<div id="pageNumDiv" style="display: none;height: 24px; float: left; margin: -1px 20px 10px 0px;font-size: 14px; ">
		总数&nbsp;:&nbsp;<c:out value="${pageInfo.totalRecords }" />&nbsp;&nbsp;&nbsp;每页：
		<c:set var="pageSizeList" value="${fn:split('10|20|50|100', '|') }" />   
		<select id="sel_page_rows" onchange="search()" 
		  class="page_select" style="line-height: 24px; width: 50px; height: 24px; cursor: pointer;">
			<c:forEach var="item" items="${pageSizeList }">
			<option  value="${item }" <c:if test="${item eq pageInfo.pageSize }">selected</c:if>>${item }</option>
			</c:forEach>
		</select>
	</div>
	<div id="Pagination"></div>
</div>