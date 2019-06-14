function checkReg(e){
	//alert("11");
	var checkReg=$(e).attr("check");
	var val=$(e).val();
	//alert(val);
	if(checkReg!=""&&checkReg!=null){
		var checkR=checkReg.split(",");
		for(var i=0;i<checkR.length;i++){
			//alert("12");
			checkMatch(e,val,checkR[i]);
		}
	}
}


function checkMatch(e,val,match){
	//alert(match);
	switch (match) {
		case "required":
			if(val==""||val==null){
				art.dialog.alert("此项不能为空！");
				$(e).focus();
			}
			break;
		case "num":
			var reg=/^(\d+)$/;
			genericRegularFun(reg,e);
			break;
		case "char":
			var reg=/^[A-Za-z0-9\-_]+$/;
			genericRegularFun(reg,e);
			break;
		case "float":
			var reg=/^\d+(\.\d+)?$/;
			genericRegularFun(reg,e);
			break;
		case "ip":
			var reg=/^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
			genericRegularFun(reg,e);
			break;
		case "notR":
			var reg = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？]", "g");
			if(val!=null&&val!=""){
				var result=val.match(reg);
				if(result!=null){
					art.dialog.alert("不能包含特殊符号！");
					$(e).focus();
				}
			}
			break;
		default:
			break;
	}
}


function genericRegularFun(reg,e){
	var val=$(e).val();
	if(val!=""&&val!=null&&val!=undefined){
		if(!reg.test(val)){
			art.dialog.alert("请填写正确格式");
			$(e).focus();
		}
	}
}