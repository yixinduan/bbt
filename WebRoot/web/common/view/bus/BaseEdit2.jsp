<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp"%>

<!DOCTYPE HTML>
<html>
<head>

<title>Role  Edit</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<%-- 基础js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp"%>

<%-- 弹出框 js css --%>
<%@ include file="/view/common/jsp/art_dialog.jsp"%>


<link rel="stylesheet" href="${basePath }/view/common/form/css/zTreeStyle/zTreeStyle.css"  type="text/css">
<script type="text/javascript"	src="${basePath }/view/common/form/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"	src="${basePath }/view/common/form/js/jquery.ztree.excheck-3.5.js"></script>

<link type="text/css"	href="${basePath }/view/common/form/css/add.css?R=3" rel="stylesheet" />
<link type="text/css" href="${basePath }/view/common/bootstrap/bootstrap.css?R=2" rel="stylesheet" media="screen" />

<!-- 垂直 Tab 样式 -->
<link type="text/css"	href="${basePath }/view/common/tabs/tab-vertical.css" rel="stylesheet" />

<style type="text/css">
input[type="radio"] {
    margin: -2px 0px 0px;
	vertical-align: middle;
	width: 14px;
    height: 14px;
}
button {
    border: 1px solid #ccc;
    }
</style>

</head>


<body>
	<div class="route_bg">
		<a  style="text-decoration:none; color:#333333;">系统管理</a><i class="glyph-icon icon-chevron-right"></i> 
		<a href="${basePath }/roleList.action" style="text-decoration:none;">角色管理</a><i class="glyph-icon icon-chevron-right"></i> 
		<a href="#" onclick="location.reload()" style="text-decoration:none; color:#666;">${empty role.id ? "新增" : "修改" }角色</a>
	</div>
	
<form id="roleForm" class="form-horizontal" action="roleSave.action" method="post">
	<input type="hidden" name="role.id" value="${role.id}"/>
	<input type="hidden" name="role.version" value="${role.version}"/>
	<input type="hidden" name="role.creator.id" value="${role.creator.id}"/>

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
					<input name="authority" type="hidden" />
					<input name="zymdLinkId" type="hidden" />
					
					<div class="form-group">
				    	<label class="col-sm-2 control-label">aaaaaa</label>
				    	<div class="col-sm-10">
							bbbbbbbbb
				    	</div>
					</div>
						
				   <div class="form-group">
				      <label class="col-sm-2 control-label">角色名称</label>
				      <div class="col-sm-10">
							<input style="width: 200px;" name="role.roleName" value="${role.roleName }" required placeholder="" />
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="inputPassword" class="col-sm-2 control-label">角色权限</label>
				      <div class="col-sm-10">
							<ul id="zymdTreeTiming" class="ztree" style="/*margin: 10px;*/ margin-top:0px;width:200px; height:200px; background:white;overflow: auto; border: solid #A9A9A9 1px;"></ul>
				      </div>
				   </div>			
		      </div>
			</div><!-- 基本信息 tab end -->
		</div>
	
		<div class="panel panel-default">
			<div class="panel-heading">
			   <a data-toggle="collapse" data-parent="#accordion" href="#collapse22" style="text-decoration:none; color:#333333;">
				    <div style="width: 100%;">	
				    	<span class="panel-title">aaaaaaa</span>   			
				   		<i class="button-icon-2 iconOpenClose"></i>
				    </div>
			   </a>
	    	</div>
			<!-- aaaaaaa tab -->
			<div id="collapse22" class="panel-collapse collapse">
				<div class="panel-body" style=" padding: 15px 0px 0px 15px;">
				
					
				
		      	</div>
			</div><!-- aaaaaaa tab end -->
		</div>
	
		<div class="panel panel-default" style="border: 1px solid #FFF;-webkit-box-shadow: 0 1px 1px #FFF;box-shadow: 0 1px 1px #FFF;">
			<div class="panel-heading" style="background-color:#fff;">
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="form-group" style=" margin-top:10px;">
						<label class="col-sm-2 control-label" ></label>
						<div class="col-sm-10">&nbsp;
							<button type="button" onclick="saveRole()" class="btnNew btn-size-1 btn-blue" ><i class="search-icon icon-save"></i>提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	    
	</div>
		
		
</form>
</body>
</html>
