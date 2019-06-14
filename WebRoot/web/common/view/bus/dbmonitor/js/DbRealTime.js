var uuid;
var timerSign;
var nonRunSign = true;

function start() {
	
	for ( var i = 1; i <= 6; i++ ) {
		var tempArr = [];
		var tempXArr = [];
		for ( var j = 1; j <= 20; j++ ) {
			tempArr.push( 0 );
			tempXArr.push( "00:00:00" );
		}
		dataMap["arr" + i] = tempArr;
		dataMap["xArr" + i] = tempXArr;
	}
	
//	$( "#divItem_" + 1 ).show();
//	showChart(1);// 
//	return;
	
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
//				alertMsg_warn("监控后台出错！");
				alertMsg_warn("该数据库无法连接！");
			} else {
				uuid = data.uuid;
				for ( var i = 1; i <= 6; i++ ) {
					dataMap["max" + i] = data["max" + i];
				}
				var iInterval = parseInt(interval) * 1000;
				timerSign = setInterval(getData, iInterval);
				showHide(false);
			}
		}
	);
}

function stop() {
	$.getJSON(basePath + "/StopRealTime.action",
		{ R: Math.random(), uuid: uuid },
		function(data){
			if ( data.res == "0x01" ) {
				clearInterval(timerSign);
				showHide(true);
				uuid = null;
			}
		}
	);
}

/** true: 表示还未开始，显示启动按钮，隐藏结束按钮 */
function showHide(sign) {
	nonRunSign = sign;
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

var dataMap = {
//	arr1, arr2, arr3, ...
//	xArr1, xArr2, xArr3, ...
//	max1, max2, max, ...
};

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
					if ( dataMap["xArr" + item].length > 20 ) {
						dataMap["xArr" + item].shift();
					}
					dataMap["arr" + item].push(  dataObj.value );
					dataMap["xArr" + item].push( dataObj.time );
					showChart(item);
				}
			} else if ( data.res == "0x02" ) {
				
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
    var paramMax = dataMap["max" + itemId];// 100;// 参考数
    var labelStr = itemStrMap[itemId];// '并发会话数';
    var titleText = labelStr + ' 监控数据表';// '服务器 ' + 
    var arr1 = dataMap["arr" + itemId];// 数据 数组
    var xArr = dataMap["xArr" + itemId];// x 轴坐标 数组
    
    // console.info(dataMap);
    var _id = '#container_' + itemId;
    var chart = $( _id ).highcharts();
    if ( chart == undefined || chart == null ) {
        var chartObj = getChartObj( paramMax, titleText, labelStr, arr1, xArr );
        $( _id ).highcharts(chartObj);
    } else {
    	for ( var i = 0; i < arr1.length; i++ ) {
			chart.series[0].data[i].update( arr1[i] );
		}
		chart.xAxis[0].categories = xArr;
    }
}

function getChartObj( paramMax, titleText, labelStr, arr1, xArr ) {
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
                type: 'line',
                animation: false
            },
            title: {
                text: titleText // '服务监控数据表'
            },
            subtitle: {
                text: null // 'Source: WorldClimate.com'
            },
            xAxis: {
                categories: xArr // x 轴坐标
            },
            yAxis: {
                allowDecimals: false,
                title: {
                    text: '数<br>据',
                    rotation: 0
                }
//	            	,
//	              plotLines: [maxObj]
            },
            loading: {
            	hideDuration: 0,
            	showDuration: 0
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
            xAxis: {
                // X轴的步进值，决定隔多少个显示一个
                tickInterval: 2
            },
            legend: {
            	//enabled: false
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
                    data: arr1 // 数据
                }
            ]
        };
    
    if ( maxObj != null ) {
    	chartObj.yAxis["plotLines"] = [maxObj];
    }
    
    return chartObj;
}