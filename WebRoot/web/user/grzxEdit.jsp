<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<html>
<head>

<title>供应商添加 | 修改(/IB/WebRoot/web/user/userEdit.jsp)</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script src="${basePath}/web/common/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<%-- 基础js --%>
<%@ include file="/web/common/view/common/jsp/base_js_css.jsp"%>
<%@ include file="/web/common/view/common/jsp/art_dialog.jsp"%>
 
<link href="${basePath}/web/common/view/common/switchmaster/docs/css/highlight.css" rel="stylesheet">
<link href="${basePath}/web/common/view/common/switchmaster/dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
<link href="${basePath}/web/common/view/common/switchmaster/docs/css/main.css" rel="stylesheet">

<!-- 关键词标签插件 -->
<%-- 
<link rel="stylesheet" href="${basePath}/web/common/view/common/form/css/zTreeStyle/zTreeStyle.css"  type="text/css">
<script type="text/javascript"	src="${basePath}/web/common/view/common/form/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"	src="${basePath}/web/common/view/common/form/js/jquery.ztree.excheck-3.5.js"></script>
 --%>
<link type="text/css"	href="${basePath}/web/common/view/common/form/css/add.css?R=3" rel="stylesheet" />
<%-- <link type="text/css" href="${basePath}/web/common/view/common/bootstrap/bootstrap.css?R=2" rel="stylesheet" media="screen" /> --%>

<!-- 垂直 Tab 样式 -->
<link type="text/css"	href="${basePath}/web/common/view/common/tabs/tab-vertical.css" rel="stylesheet" />

<script src="${basePath}/web/common/view/common/switchmaster/dist/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="${basePath}/web/common/view/common/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${basePath}/web/common/view/common/js/jquery.multiselect.js"></script>
<link type="text/css" href="${basePath}/web/common/view/common/css/jquery-ui.css" rel="stylesheet" media="screen" />
<link type="text/css" href="${basePath}/web/common/view/common/css/jquery.multiselect.css" rel="stylesheet" media="screen" />

<!-- 时间控件 -->
<script type="text/javascript" src="${basePath}/web/common/view/common/plugin/laydate/laydate.js"></script>


<!-- 表格 js -->
<script type="text/javascript" src="${basePath}/web/common/view/common/js/idGroup.js"></script>
<link type="text/css" href="${basePath}/web/common/view/common/css/animate.css" rel="stylesheet">
<link type="text/css" href="${basePath}/web/common/view/common/simple_search/ml-navigation-bar.css?R=2" rel="stylesheet"/>
<link type="text/css" href="${basePath}/web/common/view/common/table/table.css?R=1" rel="stylesheet" media="screen" />

<script type="text/javascript" src="${basePath}/web/common/view/common/bootstrap/bootstrap.js"></script>

<link rel="stylesheet" href="${basePath }/web/common/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${basePath }/web/common/css/bootstrap-select.css">
<script type="text/javascript" src="${basePath }/web/common/bootstrap/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="${basePath }/web/common/js/bootstrap-select.js"></script>

<!-- 字段验证 -->
<script type="text/javascript" src="${basePath }/web/common/js/cheakReg.js"></script>

<style type="text/css">
.multiSelect {border: solid 1px #BBB;background: #FFF url(../Js/myflow/img/dropdown.gif) right center no-repeat;padding: 2px 4px;
		padding-right: 20px;display: inline;cursor: default;}
.multiSelect_txt {border: 0px;cursor: default;}
.multiSelect.hover {background: url(../Js/myflow/img/dropdown_hover.gif) right center no-repeat;}
.multiSelect.active,.multiSelect.focus {border: inset 1px #000;}
.multiSelect.active {background: url(../Js/myflow/img/dropdown_active.gif) right center no-repeat;}
.multiSelectOptions {max-height: 150px;margin-top: -1px;border: solid 1px #B2B2B2;background: #FFF;position: absolute;}
.multiSelectOptions LABEL {padding: 2px 5px;display: block;}
.multiSelectOptions LABEL.checked {background: #E6E6E6;}
.multiSelectOptions LABEL.selectAll {border-bottom: dotted 1px #CCC;}
.multiSelectOptions LABEL.hover {background: #CFCFCF;}

input[type="radio"] {
    margin: -2px 0px 0px;
	vertical-align: middle;
	width: 14px;
    height: 14px;
}
input {
    font-size: 14px;
    padding: 5px;
}
input[type='text'] {
    padding-left: 5px;
}
button {
    border: 1px solid #ccc; 
}
.buttonNew {
    display: initial;
    padding: 10px 15px;
    text-decoration:none;
}
.col-sm-2 {
    width: 26.66666667%;
    text-align: right;
    line-height: 30px;
    float: left;
    font-size: 13px;
}
.col-sm-3 {
    width: 21.66666667%;
    text-align: right;
    line-height: 30px;
    float: left;
    font-size: 13px;
}
.col-sm-10 {
    width: 73.33333333%;
    float: left;
    line-height: 30px;
    }
.col-sm-4 {
    width: 78.33333333%;
    float: left;
    line-height: 30px;
    }
button {
    border: 1px solid #ccc;
}
button[type="button"] {
    outline: none;
    height: 30px;
    width: 102px;
    margin-left: 0px;
    }
.table > thead > tr > th {
    vertical-align: bottom;
    border-bottom: 0px solid #ddd;
}

.buttonAdd-icon {
    vertical-align: middle;
    color: black;
    font-family: FontAwesome;
    font-weight: 400;
    font-size: 12px;
    font-style: normal;
    padding-top: -1px;
    padding-right: 5px;
}
.buttonAdd-icon add:before {
    content: "\f067";
}

.button-icon {
    vertical-align: middle;
    color: black;
    font-family: FontAwesome;
    font-weight: 400;
    font-size: 15px;
    font-style: normal;
    padding-top: -1px;
    padding-right: 5px;
}

.button-icon .icon-delete:before {
    content: "\f014";
}
input[type="checkbox"] {
    width: 14px;
    margin-right: 5px;
    margin-top: -3px;
    vertical-align: middle;
}
.info{
	color: red
}
body{
	overflow:scroll;
	overflow:hidden;
}
html { overflow-y:hidden; }
</style>

<script type="text/javascript">

function savecheck(){
	$(".info").each(function(){
		if($(this).html()!=""){
			return;
		}
	});
	
	var flag = true;

	var name = $("input[name='user.name']").val();
	if(name.trim()==""){
		alert("账号不能为空！");
		flag = false;
	}
	
	
	var pwd = $("input[name='user.pwd']").val();
	if(pwd.trim()==""){
		//$("input[name='user.pwd']").next().html("此项不能为空！");
		alert("密码不能为空！");
		flag = false;
	}
	
	if(flag==false){
		return;
	}
	
	var id = $("input[name='user.id']").val();

	if(id==""){
		alert("用户没有登录！");
	}else{
		$("#submitForm").submit();
	}

}
</script>
</head>


<body style="height: 60%">
<form id="submitForm" class="form-horizontal" action="userUpdate.action" method="post" target="grzxBox">
	<input type="hidden" name="user.id" value="${user.id }">
	
	<div style="width: 100%;margin: 0px" class="panel-group">
		<div class="panel panel-default" style="border: 0px">
			
			<!-- 基本信息 tab -->
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body" style="padding: 15px 0px 0px 15px;margin-bottom:0px;">
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>账号</label>
						<div class="col-sm-10">
							<input check="required,notR" maxlength="32" type="text" name="user.name" class="textInput frequired" value="${user.name}"/>
							<span class="info"></span>
						</div>
				    </div>
				    
				    <div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>手机号码</label>
						<div class="col-sm-10">
							<input check="required,notR" maxlength="32" type="text" name="user.phone" class="textInput frequired" value="${user.phone}"/>
							<span class="info"></span>
						</div>
				    </div>

				    <div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>密码</label>
						<div class="col-sm-10">
							<input check="required" maxlength="64" type="text" name="user.pwd" class="textInput frequired" value="${user.pwd}"/>
							<span class="info"></span>
						</div>
				    </div>
	
		      </div>
			</div><!-- 基本信息 tab end -->
		</div>

		<div class="panel panel-default" style="border: 1px solid #FFF;-webkit-box-shadow: 0 1px 1px #FFF;box-shadow: 0 1px 1px #FFF;">
			<div class="panel-heading" style="background-color:#fff;">
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="form-group">
						<label class="col-sm-2 control-label" ></label>
						<div class="col-sm-10">
							<button type="button" onclick="savecheck()" class="btnNew btn-size-1 btn-blue" ><i class="search-icon icon-save"></i>保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
</form>
</body>
</html>
