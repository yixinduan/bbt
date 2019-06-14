/**
 * 验证，成功返回 true，失败返回 false，并弹出提示消息
 * 
 * @param  formDoc
 * @return {[boolean]}
 */
function myCheckForm(formDoc) {
	var inputArr = formDoc.getElementsByTagName("input");
	var curInputDoc = null;

	var infoStr = "";
	for ( var i = 0; i < inputArr.length; i++ ) {
		var inputDoc = curInputDoc = inputArr[i];
		var label = inputDoc.getAttribute("label");
		var value = inputDoc.value;

		/* 
		 * 非空判断
		 */
		var isRequired = !!inputDoc.required;
		if ( isRequired ) {
			if ( value === "" ) {
				infoStr = _myFormat("{1}不能为空！", label);
				// break;
			}
		}
		if ( infoStr != "" ) {
			break;
		}

		/* 
		 * 格式判断
		 */
		var contentType = inputDoc.getAttribute("contentType");
		contentType = contentType == null ? "text" : contentType;// 默认为 text
		var checkReg = null;
		switch (contentType) {
			case "text":
				var pattern = inputDoc.getAttribute("pattern");
				if ( pattern !== null ) {
					checkReg = new RegExp("^" + pattern + "$");// 这个地方不用转换反斜杠
				}
				break;
			default:
				checkReg = _myRegexpMap[ contentType + "Reg" ];
				break;
		}// switch end ...
		if ( checkReg != null && !checkReg.test(value) ) {
			infoStr = _myFormat("{1}格式不对！", label);
			break;
		}

		/* 
		 * 大小判断
		 */
		var min = inputDoc.getAttribute("min");
		var max = inputDoc.getAttribute("max");
		switch (contentType) {
			case "integer":
				var iCurV = parseInt(value);
				if ( min !== null ) {
					var iMinV = parseInt(min);
					if ( iMinV > iCurV ) {
						infoStr = _myFormat("{1}值不能小于{2}！", label, min);
					}
				} 
				if ( infoStr == "" && max !== null ) {
					var iMaxV = parseInt(max);
					if ( iMaxV < iCurV ) {
						infoStr = _myFormat("{1}值不能大于{2}！", label, max);
					}
				}
				break;
			case "decimal":
				var fCurV = parseFloat(value);
				if ( min !== null ) {
					var fMinV = parseFloat(min);
					if ( fMinV > fCurV ) {
						infoStr = _myFormat("{1}值不能小于{2}！", label, min);
					}
				} 
				if ( infoStr == "" && max !== null ) {
					var fMaxV = parseFloat(max);
					if ( fMaxV < fCurV ) {
						infoStr = _myFormat("{1}值不能大于{2}！", label, max);
					}
				}
				break;
			}// switch end ...
		if ( infoStr != "" ) {
			break;
		}
	}

	if (infoStr !== "") {
		_myDialog(infoStr);
		curInputDoc.focus();
		return false;
	}
	return true;
}

var _myRegexpMap = {
	ipReg : /^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])(\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)){3}$/,
	integerReg : /^\-?[0-9]+$/,
	decimalReg : /^\-?[0-9]+(\.[0-9]+)?$/,
	emailReg : /^\w+@\w+\.\w+$/
};

/**
 * 弹出提示
 * 
 * @param  msg 消息
 * @return void
 */
function _myDialog(msg) {
	// console.info("提示信息：", msg);
	// alert(msg);
	alertMsg_warn(msg);
}

/**
 * 格式化字符串
 * 
 * @param  fmt  格式化的样式
 * @param  args 参数
 * @return string
 */
function _myFormat(fmt, args) {
	var result = fmt; 
	if ( arguments.length == 2 && typeof(args) == "object") { 
		for ( var key in args ) { 
			var reg = new RegExp ("({" + key + "})", "g"); 
			result = result.replace(reg, args[key]); 
		}
	} else { 
		for ( var i = 1; i < arguments.length; i++) { 
			if ( arguments[i] == undefined ) { 
				return ""; 
			} else { 
				var reg = new RegExp ("({[" + i + "]})", "g"); 
				result = result.replace(reg, arguments[i]); 
			}
		} 
	} 
	return result; 
}