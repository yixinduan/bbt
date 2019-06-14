var $pageForm		= $("form#paginationAndSearchForm");
var $pageDiv 		= $pageForm.find("div#pageDiv");
var $pageIndexInput = $pageDiv.find("input#pageIndex");
var $pageSizeInput 	= $pageDiv.find("input#pageSize");
var $pageCountInput = $pageDiv.find("input#pageCount");
var $pageRowsInput	= null;//$("#sel_page_rows");

$(function() {
	$pageForm		= $("form#paginationAndSearchForm");
	$pageDiv 		= $pageForm.find("div#pageDiv");
	$pageIndexInput = $pageDiv.find("input#pageIndex");
	$pageSizeInput 	= $pageDiv.find("input#pageSize");
	$pageCountInput = $pageDiv.find("input#pageCount");
	//$pageRowsInput	= $("#sel_page_rows");
	
	// 需转换成int类型
	var pageIndex 	= parseInt($pageIndexInput.val()); // 页面索引初始值
	var pageSize 	= parseInt($pageSizeInput.val());  // 每页显示条数初始化，修改显示条数，修改这里即可
	var pageCount 	= parseInt($pageCountInput.val()); // 可显示的总数据量
	// 分页，PageCount是总条目数，这是必选参数，其它参数都是可选
	$("#Pagination").pagination(pageCount, {// 总条数
		callback : PageCallback,
		prev_text : '<i class="button-icon-1 icon-pagePrev"/>', // 上一页 按钮里text
		next_text : '<i class="button-icon-1 icon-pageNext"/>', // 下一页 按钮里text 
		items_per_page : pageSize, // 显示条数
		num_display_entries : 5,   // 连续分页主体部分分页条目数
		current_page : pageIndex,  // 当前页索引
		num_edge_entries : 2 // 两侧首尾分页条目数
	});

	// 翻页调用--点击"2"、"下一页"时触发
	function PageCallback(index, jq) {
		InitTable(index);
	}

	// 请求数据
	function InitTable(pageIndex) {
		$pageIndexInput.val(pageIndex + 1);// 在这里加 1 ！
		$pageSizeInput.val($pageRowsInput.val());
		$pageForm.submit();
	}

	/** 布局 */
	layout();
});

function layout() {
	var $pageNumDiv = $("#pageNumDiv").clone();// 克隆一份
	$pageRowsInput	= $pageNumDiv.find("#sel_page_rows");// 重新给$pageRowsInput赋值，注：只能从克隆的部分中去找，有能直接从$中去找
	$pageNumDiv.show();// 显示
	$("#Pagination").find(".pagination").prepend($pageNumDiv);	
}

function search() {
	if (typeof searchValidity == 'function') {
		if (!searchValidity())
			return;
	}
	$pageIndexInput.val(1);// 条件查询时，清空pageIndex为1
	$pageSizeInput.val($pageRowsInput.val());// 重新赋值pageSize
	$pageForm.submit();
}