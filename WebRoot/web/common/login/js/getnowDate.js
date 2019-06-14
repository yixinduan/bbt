function a(){
    	var now=new Date();
		var y=now.getFullYear();
		var m=now.getMonth();
		var d=now.getDate();
		var h=now.getHours();
		var mm=now.getMinutes();
		var s=now.getSeconds();
		var show=(y+"年"+m+"月"+d+"日 "+h+":"+mm+":"+s);
		document.getElementById('nowDate').value = show;
    }