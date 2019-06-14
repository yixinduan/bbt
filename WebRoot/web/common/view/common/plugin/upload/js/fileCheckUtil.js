
var updateFileId = "#filer_input";
var myFilerFile;

/**
 * 校验文件的正确性
 * 
 * @param  {[type]} suffix    默认：[ "xls", "xlsx" ]
 * @return void
 */
function checkFileValid(suffix) {
	var fileName = $( updateFileId ).val();

	var index = fileName.lastIndexOf('.');
	
	if ( suffix === undefined || suffix === null || typeof(suffix) !== 'object' ) {
		suffix = [ "xls", "xlsx" ];	
	}
	if ( suffix.length == 0 ) {// suffix = []，不校验！
		return;
	}

	var file_suffix = fileName.substring( index + 1 );
	for( var s in suffix ) {
		if ( file_suffix == suffix[s] ) {
			return;
		}
	}

	var des = "", i = 0;
	for( var s in suffix ) {
		if ( i++ > 0 ) {
			des += ",";
		}
		des += "*." + suffix[s];
	}
	var msg = "文件类型需是：(" + des + ")！";

	//console.info(msg);
	//alertMsg_warn("请选择Excel文件(*.xls,*.xlsx)！");
	alertMsg_warn(msg);

	$( updateFileId ).val("");
	//$(".jFiler-items").remove();// 不能直接删！
}

/**
 * 校验文件是否为空
 * 
 * @return boolean true: 表示为空
 */
function checkFileEmpty() {
	if ( $( updateFileId ).val() == "" ) {
		//console.info("请选择要导入的文件！");
		//alertMsg_warn("请选择要导入的文件！");
		return true;
	}
	return false;
}