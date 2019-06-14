
function parseTime(str) {
	var _parseInt = function(sV) {
		return parseInt(sV, 10);
	};
	var yyyy = _parseInt( str.substr(0, 4) );
	var MM = _parseInt( str.substr(5, 2) );
	var dd = _parseInt( str.substr(8, 2) );
	var HH = _parseInt( str.substr(11, 2) );
	var mm = _parseInt( str.substr(14, 2) );
	var ss = _parseInt( str.substr(17, 2) );
	var date = new Date();
	date.setFullYear(yyyy);
	date.setMonth(MM - 1);
	date.setDate(dd);
	date.setHours(HH);
	date.setMinutes(mm);
	date.setSeconds(ss);
	return date;
}

function formatTime(date) {
	var fullInt = function(iV) {
		return iV > 9 ? "" + iV : "0" + iV;
	};
	var format = "yyyy-MM-dd HH:mm:ss";
	var str = format.replace("yyyy", date.getFullYear());
	str = str.replace("MM", fullInt(date.getMonth() + 1));
	str = str.replace("dd", fullInt(date.getDate()));
	str = str.replace("HH", fullInt(date.getHours()));
	str = str.replace("mm", fullInt(date.getMinutes()));
	str = str.replace("ss", fullInt(date.getSeconds()));
	return str;
}