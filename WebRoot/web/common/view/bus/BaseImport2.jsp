<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%-- 基础头 --%>
<%@ include file="/view/common/jsp/base_head.jsp"%>

<!DOCTYPE HTML>
<html>
<head>
<title>策略批量导入</title>

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
	var id = $('#selectId option:selected') .val();
	if( id == 1 && $("#exceluser_hidden").val() == "" ){
		alertMsg_warn("请选择要导入的Excel文件");
		return false;
	}
	$("#fileUpload").submit();
}
function strategyExcel2(){
	window.location="strategyExcel.action";
}
function show(){
	var id = $('#selectId option:selected') .val();
	if(id==1){
		document.getElementById("importEvnatt_1").style.display="block";
		document.getElementById("importEvnatt_2").style.display="none";
		document.getElementById("sub1").style.display="block";
		document.getElementById("sub2").style.display="none";
	}else if(id==2){
		document.getElementById("importEvnatt_2").style.display="block";
		document.getElementById("importEvnatt_1").style.display="none";
		document.getElementById("sub2").style.display="block";
		document.getElementById("sub1").style.display="none";
	}
}
</script>

</head>


<body>

	<form action="strategyUpload.action?orgId=${param.orgId}" id="fileUpload" enctype="multipart/form-data" method="post">
		<div class="div_from_aoto" style="width: 550px;">
		
			<div class="control-group" style="width:800px;">
				<label class="laber_from" style="width: 800px; height: 34px;"><font size="+1"><b>策略批量导入Excel文件</b></font></label>
				<div class="controls" >
					<p class=help-block></p>
				</div>
			</div>
			<div class="control-group" style="width:800px; margin-top: 30px;">
				<label class="laber_from" style="width: 120px;" >请选择导入类型</label>
				<div class="controls" >
					<select style="width: 150px; margin-left: 50px;" onchange="show();" id="selectId" name="selectId">
						<option value="1" selected="selected">本地Excel导入</option>
						<option value="2">模板导入</option>
					</select>
				</div>
			</div>
			
			<div id="importEvnatt_1">
				<div class="control-group" style="width:800px; margin-top: 50px;">
					<label class="laber_from" style="width: 120px;" >文件</label>
					<div class="controls" >
						<input type="text" readonly id="filekeyShow" style="margin-left: 50px;">
						<a href="javascript:;" class="file" >
							<i class="font-icons fontSize-icons icon-upload"></i>选择文件
							<input type="hidden" id="exceluser_hidden" name="photo" />
							<input type="file" name="filekey" onchange="choosehiuserFile(this)">
						</a>
						<span style="color: red; font-size: 12;margin-left: 10px;"><i class="font-icons fontSize-icons icon-prompt"></i> 格式：*.xls, *.xlsx</span>
						<p class=help-block></p>
					</div>
				</div>
				<div class="control-group" style="width:800px;">
					<label class="laber_from" style="width: 120px;" >&nbsp;</label>
					<div class="controls" >
						<button type="button" style="margin-left: 50px;" class="btnNew btn-size-1 btn-blue" onclick="strategyExcel2()"><i class="search-icon icon-download"></i>下载模版</button>
						<p class=help-block></p>
					</div>
				</div>
			</div>
			
			<div id="importEvnatt_2" class="control-group" style="display: none; margin-top: 50px;">
				<label class="laber_from" style="width: 120px;" >请选择医疗模板</label>
				<div class="controls" >
					<select id="medicalmodelId" name="medicalmodelId" style="width: 150px; margin-left: 50px;">
						<c:forEach items="${mapMedical }" var="map">
							<option value="${map.key},${map.value}" <c:if test="${medicalid == map.key }">selected</c:if> >${map.value}</option>
						</c:forEach>
					</select>
					<p class=help-block></p>
				</div>
			</div>
			
			<div id="sub1" class="control-group">
				<label class="laber_from"></label>
				<div class="controls">
					<button type="button" class="btnNew btn-size-1 btn-blue" style="margin-left: 20px; margin-top: 20px; " onclick="submit_form()"><i class="search-icon icon-save"></i>提交</button>
				</div>
			</div>
			<div id="sub2" class="control-group" style="display: none;">
				<label class="laber_from"></label>
				<div class="controls">
					<button type="button" class="btnNew btn-size-1 btn-blue" style="margin-left: 20px; margin-top: 20px; " onclick="submit_form()"><i class="search-icon icon-save"></i>确定</button>
				</div>
			</div>
			
		</div>
	</form>

</body>
</html>