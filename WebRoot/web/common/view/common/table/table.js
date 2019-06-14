$(function() {
	$("table tr:nth-child(odd)").addClass("odd-row");
	$("table td:first-child, table th:first-child").addClass("first");
	$("table td:last-child, table th:last-child").addClass("last");
	 
	$('tbody>tr').click(function () { 
		$('tbody>tr').removeClass("selected");// 先给所有的tr移除掉"selected"样式
		$("table tr:nth-child(odd)").addClass("odd-row");// 给所有的odd行添加"odd-row"样式
		if ($(this).hasClass("odd-row")) {  
			$(this).removeClass("odd-row");// 本身是odd行, 移除掉"odd-row"样式
		}
		$(this).addClass("selected");// 再给本身添加"selected"样式
	});
	$("th").click(function() {
		if ($(this).attr("sortField") != undefined) {
			var field = $(this).attr("sortField");
			removeAllSortField(field);
			var order = "";
			var ascSpan = "<span id='ascSpan'>▲</span>";
			var descSpan = "<span id='descSpan'>▼</span>";
			if ($(this).find("#ascSpan").length>0 || $(this).find("#descSpan").length>0 ) {
				if ($(this).find("#ascSpan").length>0) {
					$("#ascSpan").remove();
					$(this).html($(this).html()+descSpan);
					order = "desc";
				}else{
					$("#descSpan").remove();
					$(this).html($(this).html()+ascSpan);
					order = "asc";
				}
			}else{
				$(this).html($(this).html()+ascSpan);
				order = "asc";
			}
			$("input[name='sidx']").val(field);
			$("input[name='sord']").val(order);
			search();
		}
	});
});

function removeAllSortField(sortField) {
	$("table").find("th").each(function(i) {
		if ($(this).attr("sortField") != undefined && $(this).attr("sortField") != sortField) {
			$(this).find("#descSpan").remove();
			$(this).find("#ascSpan").remove();
		}
	});
};

function selectedSortField(sortField,order) {
	var ascSpan = "<span id='ascSpan'>▲</span>";
	var descSpan = "<span id='descSpan'>▼</span>";
	$("table").find("th").each(function(i) {
		if ($(this).attr("sortField") != undefined && $(this).attr("sortField") == sortField) {
			if (order == "asc") {
				$(this).html($(this).html()+ascSpan);
			}else{
				$(this).html($(this).html()+descSpan);
			}
		}
	});
}

/** 双击修改 */
function dblClickEdit(url) {
	window.location = url;
}
