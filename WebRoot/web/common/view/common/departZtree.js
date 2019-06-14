function filter(treeId, parentNode, childNodes) {
	if (!childNodes)
		return null;
	for ( var i = 0, l = childNodes.length; i < l; i++) {
		childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
	}
	return childNodes;
}

function onClick(event, treeId, treeNode) {
	zTreeObj.checkNode(treeNode,true,false,true);
}

function onCheck(event, treeId, treeNode){
	$("#hiUserorgname").val(treeNode.name);
	$("input[name='hiUser.org.id']").val(treeNode.id);
	//$("#hiUserorgname").trigger("blur");
	 zTreeObj.selectNode(treeNode);
	 showDepartTree();
	

}
function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
	var node = zTreeObj.getNodes();
	var nodes = zTreeObj.transformToArray(node);
	var orgId=$("input[name='hiUser.org.id']").val();
	if(orgId != null && orgId != ""){
		for(var i in nodes){
			if(nodes[i].id==orgId){
				$("#hiUserorgname").val(nodes[i].name);
				zTreeObj.checkNode(nodes[i], true, true);
			}
		}
	}
	ob();
}
	function showDepartTree(){
  		var dis = $("#departTree").css("display");
  		if(dis=="none"){
  			$("#departTree").css("display","block");
  			$("#departTree").find("*").blur(function(){
				ob();
			})
  		}else{
  			$("#departTree").css("display","none");
  		}
  	}
	
	function hideDepartTree(){
		if($(":focus").parents("#treeDemos").length==0){
			$("#departTree").css("display","none");
		}
	}
	function ob(){
		 setTimeout("hideDepartTree()",100);
	}

var settingOrg = {
		async: {
			enable:true,
			url:"${basePath }/departmentTree.action",
			autoParam:["id", "name=n", "level=lv"],
			otherParam:{"otherParam":"zTreeAsyncTest"},
			dataFilter: filter
		},
		view: {
			expandSpeed:"",
			selectedMulti: false
		},
		edit: {
			// 防止子父节点被随意的拖动
			drag:{		
				prev: true, 
				next: true, 
				inner: false
			},
			enable:true,
			showRemoveBtn:false,
			showRenameBtn:false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
 		callback: {
			onClick:onClick,
			onCheck : onCheck,
			onAsyncSuccess: zTreeOnAsyncSuccess
		} 
	};
var zTreeObj;
$(document).ready(function(){
	zTreeObj = $.fn.zTree.init($("#treeDemos"), settingOrg);
});