/**
 * 错误提示框
 * 
 * @param msg
 */
function alertMsg_error(msg) { 
//	art.dialog({
//		title: '错误',
//		icon: 'error',
//		content: msg,
//		lock: true,
//		ok: true
//	});
	art.dialog.alert(msg, function () { /* alert(0) */ });
}

/**
 * 警告提示框
 * 
 * @param msg
 */
function alertMsg_warn(msg) { 
//	art.dialog({
//		title: '警告',
//		icon: 'warning',
//		content: msg,
//		lock: true,
//		ok: true
//	});
	art.dialog.alert(msg, function () { /* alert(0) */ });
}

/**
 * 成功提示框
 * 
 * @param msg
 */
function alertMsg_ok(msg) { 
	art.dialog.custom(msg, "succeed", true, true);
//	art.dialog({
//		title: '提示',
//		icon: 'succeed',
//		content: msg,
//		lock: true,
//		ok: true
//	});
}

/**
 * 成功提示框
 * 
 * @param msg
 */
function alertMsg_correct(msg) { 
	art.dialog.custom(msg, "succeed", true, true);
//	art.dialog({
//		title: '提示',
//		icon: 'succeed',
//		content: msg,
//		lock: true,
//		ok: true
//	});
}

/**
 * 普通提示框
 * 
 * @param msg
 */
function alertMsg_info(msg) { 
	art.dialog.succeed(msg,function(){});
//	art.dialog({
//		title: '提示',
//		icon: 'succeed',
//		content: msg,
//		lock: true,
//		ok: true
//	});
}

/**
 * 确认提示框
 * 
 * @param msg
 * @param okCall
 * @param cancelCall
 */
function alertMsg_confirm(msg, okCall, cancelCall) { 
	art.dialog.confirm(msg, okCall, cancelCall);
}

/**
 * 显示提示框
 * 
 * @param msg
 */
function alertMsg_tips(msg) { 
	art.dialog.tips(msg);
}

/**
 * 弹出页面窗体
 * 
 * @param title
 * @param url
 */
function alertMsg_open(title, url, width, height) {
	art.dialog.open(url, { title: title, lock: true, width: width, heigth: height });
}

function alertMsg_open_dblclick(title, url, width, height,dblclick) {
	return art.dialog.open(url, { title: title, lock: true,dblclick_hide:dblclick,width: width, heigth: height });
}

/**
 * 弹出 加载...
 */
function alertMsg_loading() {
	art.dialog({
	    title: 'loading...',
	    lock: true,
	    dblclick_hide: false,// 不能双击
	    esc: false,
	    background: '#FFFFFF', // 背景色
		opacity: 0.5,	// 透明度
	    cancel: false
	});
}

/**
 * 关闭所有弹出窗体
 */
function alertMsg_close() {
	var list = art.dialog.list;
	for (var i in list) {
	    list[i].close();
	};
}


function alertMsg_infoOkCall(msg,okCall) { 
	art.dialog({
		title: '提示',
		icon: 'succeed',
		content: msg,
		lock: true,
		ok: okCall
	});
}