<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp"%>

<!DOCTYPE HTML>
<html>
<head>
<title>用户批量导入</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<%-- 基础js --%>
<%@ include file="/view/common/jsp/base_js_css.jsp"%>

<%-- 弹出框 js css --%>
<%@ include file="/view/common/jsp/art_dialog.jsp"%>

<link type="text/css" href="${basePath }/view/common/form/css/add.css" rel="stylesheet" media="screen" />
<link type="text/css" href="${basePath }/view/common/bootstrap/bootstrap.css?R=2" rel="stylesheet" media="screen" />

<!-- 上传文件 css -->
<link type="text/css" href="${basePath }/view/common/form/css/file.css" rel="stylesheet" media="screen" />

<script type="text/javascript">
function choosehiuserFile(fileInput){
	var fileName = fileInput.value;
	
	var index = fileName.lastIndexOf('.');
	
	var suffix = ["xls","xlsx"];
	var file_suffix = fileName.substring(index+1);
	for(var s in suffix){
		if(file_suffix == suffix[s]){
			$("#exceluser_hidden").val(fileName);
			$("#filekeyShow").val(fileName);
			return;
		}
	}
	alertMsg_warn("请选择Excel文件(*.xls,*.xlsx)！");
	$("#exceluser_hidden").val("");
	$("#filekeyShow").val("");
}
function submit_form(){
	if($("#exceluser_hidden").val()==""){
		alertMsg_warn("请选择要导入的Excel文件");
		return false;
	}
	$("#fileUpload").submit();
}
function userExcel2(){
	window.location="exportExcel2.action";
}
</script>

</head>


<body>

	<form action="hiuserfileUpload.action?orgId=${param.orgId}" id="fileUpload" enctype="multipart/form-data" method="post">
		<div class="div_from_aoto" style="width: 550px;">
		
			<div class="control-group" style="width:800px;">
				<label class="laber_from" style="width: 800px; height: 34px;"><font size="+1"><b>用户批量导入Excel文件</b></font></label>
				<div class="controls" >
					<p class=help-block></p>
				</div>
			</div>
			<div class="control-group" style="width:800px; margin-top: 50px;">
				<label class="laber_from" style="width: 800px; height: 34px;">
				<button type="button" class="btnNew btn-size-1 btn-blue" onclick="userExcel2()"><i class="search-icon icon-download"></i>下载模版</button>
				</label>
				<div class="controls" >
					<p class=help-block></p>
				</div>
			</div>
			
			<div class="control-group" style="width:800px; margin-top: 50px;">
				<label class="laber_from" style="width: 120px;" >文件</label>
				<div class="controls" >
					<input type="text" readonly id="filekeyShow" style="margin-left: 80px;">
					<a href="javascript:;" class="file" >
						<i class="font-icons fontSize-icons icon-upload"></i>选择文件
						<input type="hidden" id="exceluser_hidden" name="photo" />
						<input type="file" name="filekey" onchange="choosehiuserFile(this)">
					</a>
					<span style="color: red; font-size: 12;margin-left: 10px;"><i class="font-icons fontSize-icons icon-prompt"></i> 格式：*.xls, *.xlsx</span>
					<p class=help-block></p>
				</div>
			</div>
				
			<div class="control-group">
				<label class="laber_from" style="width: 120px;" >密码导入类型</label>
				<div class="controls" >
					<div>
						<label style="margin-left: 80px;"><input type="radio"  name="isEncryption" checked="checked" value="1">明文</label>
						<label><input type="radio"  name="isEncryption" value="2" style="margin-left: 10px;">密文</label>
					</div>
					<p class=help-block></p>
				</div>
			</div>
			
			<div class="control-group">
				<label class="laber_from"></label>
				<div class="controls">
					<button type="button" class="btnNew btn-size-1 btn-blue" style="margin-left: 20px; margin-top: 20px; " onclick="submit_form()"><i class="search-icon icon-save"></i>提交</button>
				</div>
			</div>
			
		</div>
	</form>

</body>
</html>