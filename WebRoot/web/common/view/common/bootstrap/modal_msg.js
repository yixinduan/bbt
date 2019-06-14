/**
 * 提示消息--模态化窗口，
 * 基于bootstrap模态化窗口
 * 
 * @param msg 消息体
 * @param title 标题 | 回调函数，标题时默认“提示”
 * @param callFun 关闭时的回调函数
 */
function modalMsg(msg, title, callFun) {
	var sTitle = typeof title === 'string' ? title : undefined;
	var fCall = typeof title === 'function' ? title : callFun;
	
	var modalId = "myModal2014";
	var $modalDiv = $("#" + modalId);
	
	if ($modalDiv.length == 0) {
		var $modalDivNew = $('<div class="modal fade" id="' + modalId + '"></div>').appendTo($("body")[0]);
		var $div1 = $('<div class="modal-dialog"></div>').appendTo($modalDivNew);
		var $div2 = $('<div class="modal-content"></div>').appendTo($div1);
		
		var $div21 = $('<div class="modal-header"></div>').appendTo($div2);
		var $btn1 = $('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>').appendTo($div21);
		var $h4 = $('<h4 id="msgTitle" class="modal-title">标题</h4>').appendTo($div21);
		
		var $div22 = $('<div id="msgContent" class="modal-body">提示内容</div>').appendTo($div2);
		
		var $div23 = $('<div class="modal-footer"></div>').appendTo($div2);
		var $btn2 = $('<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>').appendTo($div23);
		
		$modalDiv = $modalDivNew;
		// alert();
	}
	
	$modalDiv.find("#msgContent").text(msg || "Debug 中 !!!");
	$modalDiv.find("#msgTitle").text(sTitle || "提示");
	
	if (fCall !== undefined)
		$modalDiv.on("hide.bs.modal", fCall);// function(){alert(1);}
	
	$modalDiv.modal({
		keyboard: true // 按"Esc"键关闭
	});
}