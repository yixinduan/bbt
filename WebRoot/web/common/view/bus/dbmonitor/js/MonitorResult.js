var uuid;
var timerSign;

function start() {
	
	for ( var i = 1; i <= 6; i++ ) {
		dataMap["arr" + i] = [];
		dataMap["xArr" + i] = [];
	}
	
	var serverId = $("#selServerId").val();
	var interval = $(".radInterval:checked").val();
	var items = "";
	items = $(".chkMonitorItem:checked").map(function(){
		return $(this).val();
	}).get().join(",");
	if ( serverId == "" ) {
		alertMsg_warn("请选择要监控的数据库！");
		return;
	}
	if ( interval === undefined ) {
		alertMsg_warn("请设置监控间隔！");
		return;
	}
	if ( items == "" ) {
		alertMsg_warn("请选择要监控的项目！");
		return;
	}
	$.getJSON(basePath + "/StartRealTime.action",
		{ R: Math.random(), serverId: serverId, interval: interval, items: items },
		function(data){
			if ( data.res == "0x00" ) {
				alertMsg_warn("监控后台出错！");
			} else {
				uuid = data.uuid;
				var iInterval = parseInt(interval) * 1000;
				timerSign = setInterval(getData, iInterval);
				showHide(false);
			}
		}
	);
}

/** true: 显示启动按钮，隐藏结束按钮 */
function showHide(sign) {
	if ( sign ) {
		$("#btnStart").show();
		$("#btnStop").hide();
	} else {
		$("#btnStart").hide();
		$("#btnStop").show();
		
		for ( var i = 1; i <= 6; i++ ) {
			$("#divItem_" + i).hide();
		}
		$(".chkMonitorItem:checked").each(function(){
			$( "#divItem_" + $(this).val() ).show();
		});
	}
}

function getData() {
	if ( uuid == null ) {
		return;
	} 
	$.getJSON(basePath + "/GetRealTimeData.action",
		{ R: Math.random(), uuid: uuid },
		function(data){
			if ( data.res == "0x01" ) {
				var arr = data.data;
				for ( var i = 0; i < arr.length; i++ ) {
					var dataObj = arr[i];
					var item = dataObj.item;
					if ( dataMap["arr" + item].length > 20 ) {
						dataMap["arr" + item].shift();
					}
					if ( dataMap["arr" + item].length > 20 ) {
						dataMap["xArr" + item].shift();
					}
					dataMap["arr" + item].push(  dataObj.value );
					dataMap["xArr" + item].push( dataObj.time );
					showChart(item);
				}
			} else {
				alertMsg_warn("获取数据时后台出错！");
				clearInterval(timerSign);
				showHide(true);
				uuid = null;
			}
		}
	);
}

function showChart(itemId) {
//    var max = 100;
    var paramMax = dataMap["max" + itemId];// 100;// 参考数
    var labelStr = itemStrMap[itemId];// '并发会话数';
    var titleText = labelStr + ' 监控数据表';
    var arr1 = dataMap["arr" + itemId];// new Array();
//    for (var i = 0; i < 12; i++) {
//        arr1[i] = Math.ceil( 5 + Math.random() * max );
//    }
    
    var xArr = dataMap["xArr" + itemId];// new Array();
//    for (var i = 1; i <= 12; i++) {
//    	var lv = i * 2;
//        xArr[i - 1] = lv < 10 ? "0" + lv : "" + lv;
//    }
    
    var maxObj = null;
    if ( paramMax !== undefined && paramMax > 0 ) {
    	console.info(paramMax);
    	maxObj = {
            color: 'red',           //线的颜色，定义为红色
            dashStyle: 'solid',     //默认值，这里定义为实线
            value: paramMax, // 150             //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
            width: 3,               //标示线的宽度，2px
            label: {
                text: '参考值: ' + paramMax + '',
                style: {
                    color: 'blue',
                    fontWeight: 'bold'
                }
            }
        };
    }
    
    var chartObj = 
    	{
            chart: {
                type: 'line'
            },
            title: {
                text: titleText // '服务监控数据表'
            },
            subtitle: {
                text: null // 'Source: WorldClimate.com'
            },
            xAxis: {
                categories: xArr
            },
            yAxis: {
                allowDecimals: false,
                title: {
                    text: '数<br>据',
                    rotation: 0
                }
//            	,
//              plotLines: [maxObj]
            },
            credits: {// 水印
                enabled: false
            },
            exporting: {// 导出
                enabled: false
            },
            tooltip: {
                enabled: false,
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br>'+this.x +': '+ this.y +'';
                }
            },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true
                    },
                    enableMouseTracking: false
                }
            },
            series: [
                {
                    name: labelStr,
                    data: arr1
                }
            ]
        };
    
    if ( maxObj != null ) {
    	chartObj.yAxis["plotLines"] = [maxObj];
    }

    $('#container_' + itemId).highcharts(chartObj);
}