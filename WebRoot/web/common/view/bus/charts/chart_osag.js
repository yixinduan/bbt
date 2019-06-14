// 加载完...
$(function () {
	var now = laydate.now();
	var month = now.substr(0, 7);
	$("#timeValue").val(month);
	
	// 审计查询
	queryAudit();
});

// json数据 url
var jsonURL = null;

// 查询月分
var queryMonth = null;

/**
 * 审计查询
 */
function queryAudit() {
	queryMonth = $("#timeValue").val();
	jsonURL = "chartJson.action?queryMonth=" + queryMonth + "&method=";
	
    // 初始化--设备审计比例
    initDeviceRatio();

    // 初始化--账号审计比例
    initAccountRatio();
    
    // 初始化--高中低告警统计
    initAlarmStats();
    
    // 初始化--各类事件告警统计
    initEventStats();

    // 初始化--当月每天会话访问时长
    initSessionTimes();

    // 初始化--当月每天高中低告警数量
    initDayAlarmNum();
}

/**
 * 初始化--设备审计比例
 */
function initDeviceRatio() {
	$.getJSON(jsonURL + "initDeviceRatio", function(data){
		$('#deviceRatio').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '设备审计比例'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: false,
	                cursor: null,// 手势 'pointer',
	                dataLabels: {
	                    enabled: false
	                },
	                showInLegend: true // 图标下面的备注
	            }
	        },
	        credits: {// 水印
	            enabled: false
	        },
	        exporting: {// 导出
	            enabled: false
	        },
	        series: [{
	            type: 'pie',
	            name: '设备比例',
	            data: [
	                {
	                    name: '审计中',
	                    y: data.audit_num
	                },
	                {
	                    name: '非审计',
	                    color: '#9c9c9c',
	                    y: data.total_num - data.audit_num
	                }
	            ]
	        }]
	    });
		$("#spanDeviceTotal").text(data.total_num);
		$("#spanDeviceAuditNum").text(data.audit_num);
	});
}

/**
 * 初始化--账号审计比例
 */
function initAccountRatio() {
	$.getJSON(jsonURL + "initAccountRatio", function(data){
		$('#accountRatio').highcharts({
			chart: {
				plotBackgroundColor: null,
				plotBorderWidth: null,
				plotShadow: false
			},
			title: {
				text: '账号审计比例'
			},
			tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions: {
				pie: {
					allowPointSelect: false,
					cursor: null,// 手势 'pointer',
					dataLabels: {
						enabled: false
					},
					showInLegend: true // 图标下面的备注
				}
			},
			credits: {// 水印
				enabled: false
			},
			exporting: {// 导出
				enabled: false
			},
			series: [{
				type: 'pie',
				name: '账号比例',
				data : [ 
				    {
						name : '审计中',
						y : data.audit_num
					}, {
						name : '非审计',
	                    color: '#9c9c9c',
						y : data.total_num - data.audit_num
					} 
				]
			}]
		});
		$("#spanAccountTotal").text(data.total_num);
		$("#spanAccountAuditNum").text(data.audit_num);
	});
}

/**
 * 初始化--高中低告警统计
 */
function initAlarmStats() {
	$.getJSON(jsonURL + "initAlarmStats", function(data){
		$('#alarmStats').highcharts({
			chart: {
				type: 'column'
			},
			title: {
				text: '高中低告警统计'
			},
			subtitle: {
				text: null // 'Source: WorldClimate.com'
			},
			xAxis: {
				categories: [
				    queryMonth// 'Jan'
	            ],
	            crosshair: true
			},
			yAxis: {
				min: 0,
				title: {
					text: null // 'Rainfall (mm)'
				}
			},
			tooltip: {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				'<td style="padding:0"><b>{point.y:.0f} 次</b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0
				}
			},
			credits: {// 水印
				enabled: false
			},
			exporting: {// 导出
				enabled: false
			},
			series: [{
				name: '高',
				data: [ data[1] ]// 要在数组中!!
			}, {
				name: '中',
                color: '#9c9c9c',
				data: [ data[2] ]
			}, {
				name: '低',
				color: "#90ed7d",
				data: [ data[3] ]
			}]
		});
	});
}

/**
 * 初始化--各类事件告警统计
 */
function initEventStats() {
	$.getJSON(jsonURL + "initEventStats", function(data){
		var showData = new Array();
		var itemIndex = 0;
		var colorArr = [ "#7cb5ec", "#9c9c9c", "#90ed7d" ];
		for (var key in data) {
			var itemObj = { "name" : key, "data" : [ data[key] ] };
			itemIndex++;
			if (itemIndex <= 3)
				itemObj["color"] = colorArr[itemIndex - 1];
			else 
				itemObj["color"] = "#90b" + ((itemIndex - 3) * 111);
			showData.push(itemObj);// 数组中！！
		}
		$('#eventStats').highcharts({
			chart: {
				type: 'column'
			},
			title: {
				text: '各类事件告警统计'
			},
			subtitle: {
				text: null // 'Source: WorldClimate.com'
			},
			xAxis: {
				categories: [
	            	queryMonth// 'Jan'
	            ],
	            crosshair: true
			},
			yAxis: {
				min: 0,
				title: {
					text: null // 'Rainfall (mm)'
				}
			},
			tooltip: {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				'<td style="padding:0"><b>{point.y:.0f} 次</b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0
				}
			},
			credits: {// 水印
				enabled: false
			},
			exporting: {// 导出
				enabled: false
			},
			series: showData
		});
	});
}

/**
 * 初始化--当月每天会话访问时长
 */
function initSessionTimes() {
	$.getJSON(jsonURL + "initSessionTimes", function(data){
		$('#sessionTimes').highcharts({
			chart: {
				type: 'column'
			},
			title: {
				text: '当月每天会话访问时长'
			},
			subtitle: {
				text: null // 'Source: WorldClimate.com'
			},
			xAxis: {
				categories: data.dayArr,// 天数
				crosshair: true
			},
			yAxis: {
				min: 0,
				title: {
					text: null // 'Rainfall (mm)'
				}
			},
			tooltip: {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				'<td style="padding:0"><b>{point.y:.0f} 分钟</b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0,
					showInLegend: false
				}
			},
			credits: {// 水印
				enabled: false
			},
			exporting: {// 导出
				enabled: false
			},
			series: [{
				name: queryMonth, // '高',
				data: data.valueArr // 数据
			}]
		});
	});
}

/**
 * 初始化--当月每天高中低告警数量
 */
function initDayAlarmNum() {
	$.getJSON(jsonURL + "initDayAlarmNum", function(data){
		$('#dayAlarmNum').highcharts({
			chart: {
				type: 'column'
			},
			title: {
				text: '当月每天高中低告警数量'
			},
			subtitle: {
				text: null // 'Source: WorldClimate.com'
			},
			xAxis: {
				categories: data.dayArr,// 天数
				crosshair: true
			},
			yAxis: {
				min: 0,
				title: {
					text: null // 'Rainfall (mm)'
				}
			},
			tooltip: {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				'<td style="padding:0"><b>{point.y:.0f} 次</b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
			},
			plotOptions: {
				column: {
					pointPadding: 0.2,
					borderWidth: 0
				}
			},
			credits: {// 水印
				enabled: false
			},
			exporting: {// 导出
				enabled: false
			},
			series: [{
				name: '高',
				data: data.lv3Arr // 数据...
			
			}, {
				name: '中',
                color: '#9c9c9c',
				data: data.lv2Arr // 数据...
			
			}, {
				name: '低',
				color: "#90ed7d",
				data: data.lv1Arr // 数据...
			
			}]
		});
	});
}