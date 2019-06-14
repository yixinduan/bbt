<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
request.setAttribute("basePath", path);
%>

<!DOCTYPE HTML>
<html>
<head>

<title>原料添加 | 修改(/IB/WebRoot/web/zymd/zymdEdit.jsp)</title>

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
<script type="text/javascript" src="${basePath }/web/zymd/js/cheakReg.js" charset="UTF-8"></script>

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
.info{
	color: red
}
.info2{
	color: red
}
</style>
<style type="text/css">
body {
	background: #efd;
}
.section {
	width: 1200px;
	/* margin: 200px auto; */
}
.article {
	border: 1px solid #ccc;
	padding: 20px;
  min-height: 230px;
}
.item {
  width: 190px;
  height: 190px;
	float: left;
	position: relative;
	/* margin: 20px; */
}
.addImg {
	width: 190px;
	height: 190px;
  position: absolute;
  left: 0;
  top: 0;
  z-index: 2;
  cursor: pointer;
}
.preview,.preBlock{
	position: absolute;
  display: block;
	width: 190px;
	height: 190px;
	left: 0;
	top: 0;
}
.delete {
  width: 30px;
	position: absolute;
	right: -30px;
	top: -0px;
	cursor: pointer;
	display: none;
}
.preBlock img {
  display: block;
	width: 190px;
	height: 190px;
}
.upload_input{
  display: block;
  width: 0;
  height: 0;
  -webkit-opacity: 0.0;  
  /* Netscape and Older than Firefox 0.9 */  
  -moz-opacity: 0.0;  
  /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/  
  -khtml-opacity: 0.0;  
  /* IE9 + etc...modern browsers */  
  opacity: .0;  
  /* IE 4-9 */  
  filter:alpha(opacity=0);  
  /*This works in IE 8 & 9 too*/  
  -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";  
  /*IE4-IE9*/  
  filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0); 
}
</style>
<script type="text/javascript">

function savecheck(){
	$(".info").each(function(){
		if($(this).html()!=""){
			return;
		}
	});
	
	var flag = true;

	var name = $("input[name='zymd.name']").val();
	if(name.trim()==""){
		$("input[name='zymd.name']").next().html("此项不能为空！");
		flag = false;
	}
	/* 
	var raw_material_names = $("input[name='raw_material_names']").val();
	if(raw_material_names.trim()==""){
		$("input[name='zymd.raw_materials']").next().html("此项不能为空！");
		flag = false;
	}
	
	if(flag==false){
		return;
	}
	 */
	var id = $("input[name='zymd.id']").val();
	
	$.post("zymdByRepetition.action?date"+Math.random(),{'zymd.name':name, 'zymd.id':id},function(data){
		var obj = eval("("+data+")");
		if(obj.flag==false){
			$("input[name='zymd.name']").next().html("重复！");
			return;
		}else{
			$("#submitForm").submit();
		}
	});

}

function addDiv(e){
	var add='<div >\
				<select name="raw_material_names" style="width: 200px;">\
					<c:forEach var="item" items="${raw_materialList}" >\
						<option value="${item.id }">${item.name}(${item.unit })</option>\
					</c:forEach>\
				</select>\
				<input name="raw_material_counts" check="num" onblur="checkReg(this);" minNum="1" maxNum="999999" class="mask" style="width: 100px" maxlength="8" type="text"  placeholder="数量" class="textInput frequired" value=""/>\
				&nbsp;<a onclick="addDiv(this);">添加</a>&nbsp;\
				<a  onclick="delDiv(this);">删除</a> \
				<span class="info"></span> \
				<span class="info2"></span> \
			</div>';
	$("#raw_materialDiv").append(add);
}

function delDiv(e){
	var len=$("#raw_materialDiv").children().length;
	if(len>1){
		$(e).parent().remove();
	}
}

$(function(){
	//添加按钮
	var addImg = $("body").find(".addImg");
	//删除按钮
    var deleteImg = $("body").find(".delete");
	var img = "${zymd.img}";
	if(img!=null&&img!=""){
		addImg.hide();
        deleteImg.show();
	}else{
		addImg.show();
        deleteImg.hide();
	}
});
</script>
</head>


<body class="gundongtiao">
<form id="submitForm" class="form-horizontal" action="zymdSave.action" method="post" target="zymdBox">
	<input type="hidden" name="zymd.id" value="${zymd.id }">
	
	<div style="width: 100%;margin: 0px" class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">
			   <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:none; color:#333333;">
				    <div style="width: 100%;">	
				    	<span class="panel-title" style="">基本信息</span>
				   		<i class="button-icon-2 iconOpenClose"></i>
				    </div>
			   </a>
	    	</div>
			<!-- 基本信息 tab -->
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body" style="padding: 15px 0px 0px 15px;margin-bottom:0px;">
					
					<div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>菜单名称</label>
						<div class="col-sm-10">
							<input check="required,notR" onblur="checkReg(this);" maxlength="32" type="text" name="zymd.name" class="textInput frequired" value="${zymd.name}"/>
							<span class="info"></span>
						</div>
				    </div>
				    
				    <div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>原料</label>
						<div class="col-sm-10" id="raw_materialDiv">
							<c:if test="${empty zymd.raw_materials}">
								<div>
									<select name="raw_material_names" style="width: 200px;">
										<c:forEach var="item" items="${raw_materialList}" >
											<option value="${item.id }">${item.name}(${item.unit })</option>
										</c:forEach>
									</select>
									<input name="raw_material_counts" check="num" onblur="checkReg(this);" minNum="1" maxNum="999999" class="mask" style="width: 100px" maxlength="8" type="text" placeholder="数量" class="textInput frequired" value=""/>
									&nbsp;<a onclick="addDiv(this);">添加</a>&nbsp;
									<span class="info"></span>
									<span class="info2"></span>
								</div>
							</c:if>
							<c:if test="${not empty zymd.raw_materials}">
								<c:forEach items="${raw_materialMap }" var="map" varStatus="s">
									<c:if test="${s.count eq 1 }">
										<div>
											<select name="raw_material_names" style="width: 200px;">
												<c:forEach var="item" items="${raw_materialList}" >
													<option <c:if test="${map.key eq item.id}">selected</c:if> value="${item.id }">${item.name}(${item.unit })</option>
												</c:forEach>
											</select>
											<input name="raw_material_counts" check="num" onblur="checkReg(this);" minNum="1" maxNum="999999" class="mask" style="width: 100px" maxlength="8" type="text" placeholder="数量" class="textInput frequired" value="${map.value }"/>
											&nbsp;<a onclick="addDiv(this);">添加</a>&nbsp;
											<span class="info"></span>
											<span class="info2"></span>
										</div>
									</c:if>
									<c:if test="${s.count ne 1 }">
										<div>
											<select name="raw_material_names" style="width: 200px;">
												<c:forEach var="item" items="${raw_materialList}" >
													<option <c:if test="${map.key eq item.id}">selected</c:if> value="${item.id }">${item.name}(${item.unit })-${raw_materialMap.key }</option>
												</c:forEach>
											</select>
											<input name="raw_material_counts" check="num" onblur="checkReg(this);" minNum="1" maxNum="999999" class="mask" style="width: 100px" maxlength="8" type="text" placeholder="数量" class="textInput frequired" value="${map.value }"/>
											&nbsp;<a onclick="addDiv(this);">添加</a>&nbsp;
											<a  onclick="delDiv(this);">删除</a>
											<span class="info"></span>
											<span class="info2"></span>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
				    </div>
				    
				    <div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>价格</label>
						<div class="col-sm-10">
							<input check="required,num" onblur="checkReg(this);" maxlength="32" type="text" name="zymd.price" class="textInput frequired" value="${zymd.price}"/>
							<span class="info"></span>
						</div>
				    </div>
				    
				    
				    <div class="form-group">
						<label class="col-sm-2 control-label"><span style="color: #ff0000;">* </span>图片</label>
						<div class="col-sm-10">
							<div class="item">
								<img class="addImg" onclick="clickImg(this);" src="${basePath }/web/zymd/images/addImg.png" />
								<input type="file" class="upload_input" onchange="change(this)"  />
								<input id="imgData" name="zymd.img" type="hidden"  value="${zymd.img }" />
								<div class="preBlock">
									<img class="preview" id="preview" alt="" name="pic" width="200" height="200" src="${zymd.img }" />
								</div>
								<img class="delete" onclick="deleteImg(this)" src="${basePath }/web/zymd/images/delete.png"/>
							</div>
							<span class="info"></span>
						</div>
				    </div>

				    
					<div class="form-group">
							<label class="col-sm-2 control-label"><span style="color: #ff0000;"></span>描述</label>
							<div class="col-sm-10">
								<textarea onblur="checkReg(this);" maxlength="256" style="width:200px; height: 90px; line-height: 20px; font-size: 14px; padding-top: 3px;" name="zymd.descs">${zymd.descs }</textarea>
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
							<button type="button" onclick="savecheck()" class="btnNew btn-size-1 btn-blue" ><i class="search-icon icon-save"></i>提交</button>
							<button type="button" class="btnNew btn-size-1 btn-blue" onclick="history.go(-1);"><i class="search-icon icon-back"></i>返回</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	
</form>


<script type="text/javascript">
  //点击
  var clickImg = function(obj){
    $(obj).parent().find('.upload_input').click();
  }
  //删除
  var deleteImg = function(obj){
    $(obj).parent().find('input').val('');
    $(obj).parent().find('img.preview').attr("src","");
    //IE9以下
    $(obj).parent().find('img.preview').css("filter","");
    $(obj).hide();
    $(obj).parent().find('.addImg').show();
  }
  var imgData = $("#imgData");
  //选择图片
  function change(file) {
      //预览
      var pic = $(file).parent().find(".preview");

      //添加按钮
      var addImg = $(file).parent().find(".addImg");
      //删除按钮
      var deleteImg = $(file).parent().find(".delete");

      var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

       // gif在IE浏览器暂时无法显示
       if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
          if (ext != '') {
            alert("图片的格式必须为png或者jpg或者jpeg格式！"); 
          } 
           return;
       }
       //判断IE版本
       var isIE = navigator.userAgent.match(/MSIE/)!= null,
           isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
           isIE10 = navigator.userAgent.match(/MSIE 10.0/)!= null;
       if(isIE && !isIE10) {
          file.select();
          var reallocalpath = document.selection.createRange().text;
           // IE6浏览器设置img的src为本地路径可以直接显示图片
           if (isIE6) {
              pic.attr("src",reallocalpath);
              imgData.val(reallocalpath);
           }else{
              // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现             
              pic.css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + reallocalpath + "\")");
              // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
              pic.attr('src','data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
              
              imgData.val('data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');          
           }
           addImg.hide();
           deleteImg.show();
       }else {
          html5Reader(file,pic,addImg,deleteImg);
       }
  }
 //H5渲染
  function html5Reader(file,pic,addImg,deleteImg){
     var file = file.files[0];
     var reader = new FileReader();
     reader.readAsDataURL(file);
     reader.onload = function(e){
         pic.attr("src",this.result);
         imgData.val(this.result); 
     }
     addImg.hide();
     deleteImg.show();
  }
</script>
</body>
</html>
