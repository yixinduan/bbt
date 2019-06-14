$(function() {
	$("#idGroup").click(function() {
		if (document.getElementById("idGroup").checked) {
			$("input[name='ids']").each(function(i) {
				$(this).prop("checked", true);
			});
		} else {
			$("input[name='ids']").each(function(i) {
				$(this).prop("checked", false);
			});
		}
	});

	$("input[name='ids']").click(function() {
		if (!$(this).prop("checked")) {
			document.getElementById("idGroup").checked = false;
		} else {
			var count = $("input[name='ids']").length;
			var selectCount = $("input[name='ids']:checked").length;
			if (count == selectCount) {
				document.getElementById("idGroup").checked = true;
			}
		}
	});
});

/**
 * 表格头的组 复选框单击事件
 * 
 * @param obj 组复选框本身
 * @param itemName 组复选框Name
 */
function chkGroupClick(obj, itemName) {
	$("input[name='" + itemName + "']").each(function(i) {
		$(this).prop("checked", obj.checked);
	});
}

/**
 * 表格体的项 复选框单击事件
 * 
 * @param obj 项复选框本身
 * @param groupId 组复选框Id
 */
function chkItemClick(obj, groupId) {
	var checked = false;
	if (obj.checked) {
		var itemName = obj.name;
		var count = $("input[name='" + itemName + "']").length;
		var selectCount = $("input[name='" + itemName + "']:checked").length;
		checked = count == selectCount;
	}
	document.getElementById(groupId).checked = checked;
}

/** 批量删除 */
function deleteAllByUrl(baseUrl) {
	var selectCount = $("input[name='ids']:checked").length;
	if (selectCount == 0) {
		art.dialog.tips("请选中信息~！");
	} else {
		art.dialog.confirm("确定要删除选中的数据吗?", function() {
			art.dialog.tips("执行确定操作");
			var str = "";
			$("input[name='ids']:checked").each(function() {
				str += $(this).val() + ",";
			});
			str = str.substring(0, str.length - 1);
			if (str != "") {// ${basePath }/role.do?m=deleteAll&ids=
				location.href = baseUrl + str;
			}
		}, function() {
			art.dialog.tips("执行取消操作");
		});
	}
}

/** 单个删除 */
function deleteSingleByUrl(baseUrl) {
	art.dialog.confirm("确定要删除此条数据吗?", function() {
		art.dialog.tips("执行确定操作");
		location.href = baseUrl;
	}, function() {
		art.dialog.tips("执行取消操作");
	});
}