<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- 그래프 JS Import -->
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<title>검색어 조회 현황</title>
<style type="text/css">
	#chartdiv {
		width	: 100%;
		height	: 500px;
	}		
</style>
</head>
<body>
<%@ include file="../nav.jsp" %>
	<div class="container" id="main">
		<h1>사용자의 검색 내역을 그래프화 합니다.</h1>
		<br><br><br><br>
		<div id="chartdiv"></div>
	</div>
	
	<script type="text/javascript">
		var chart = AmCharts.makeChart("chartdiv", 
		{
			"startDuration": 0.2,
		    "type": "serial",
		    "theme": "light",
		    "marginRight": 40,
		    "marginLeft": 40,
		    "autoMarginOffset": 20,
		    "mouseWheelZoomEnabled":true,
		    "dataDateFormat": "YYYY-MM-DD",
		    "valueAxes": [{
		        "id": "v1",
		        "axisAlpha": 0,
		        "position": "left",
		        "ignoreAxisWidth":true
		    }],
		    "balloon": {
		        "borderThickness": 1,
		        "shadowAlpha": 0
		    },
		    "graphs": [${graphs}],		    	
		    "chartScrollbar": {
		        "graph": "g1",
		        "oppositeAxis":false,
		        "offset":30,
		        "scrollbarHeight": 80,
		        "backgroundAlpha": 0,
		        "selectedBackgroundAlpha": 0.1,
		        "selectedBackgroundColor": "#888888",
		        "graphFillAlpha": 0,
		        "graphLineAlpha": 0.5,
		        "selectedGraphFillAlpha": 0,
		        "selectedGraphLineAlpha": 1,
		        "autoGridCount":true,
		        "color":"#AAAAAA"
		    },
		    "chartCursor": {
		        "pan": true,
		        "valueLineEnabled": true,
		        "valueLineBalloonEnabled": true,
		        "cursorAlpha":1,
		        "cursorColor":"#258cbb",
		        "limitToGraph":"아냐",
		        "valueLineAlpha":0.2,
		        "valueZoomable":true
		    },
		    "valueScrollbar":{
		      "oppositeAxis":false,
		      "offset":50,
		      "scrollbarHeight":10
		    },
		    "categoryField": "date",
		    "categoryAxis": {
		        "parseDates": true,
		        "dashLength": 1,
		        "minorGridEnabled": true
		    },
		    "export": {
		        "enabled": true
		    },
		    "dataProvider": [${datas}]
						});
		
		//chart.addListener("rendered", zoomChart);
		var legend = new AmCharts.AmLegend();
		  legend.useGraphSettings = true;
		  chart.addLegend(legend);

		zoomChart();

		function zoomChart() {
			chart.zoomToIndexes(chart.dataProvider.length - 40,
					chart.dataProvider.length - 1);
		}
	</script>
</body>
</html>