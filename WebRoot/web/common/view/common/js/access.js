function isIP2(){   
    var url = location.href;
	if(url.indexOf(":",10)==-1){
		return url.substring(url.indexOf("//")+2,url.indexOf("/",url.indexOf("//")+2));
	}else{
		return url.substring(url.indexOf("//")+2,url.indexOf(":",url.indexOf("//")));
	}
    //return "172.16.0.17";
}  