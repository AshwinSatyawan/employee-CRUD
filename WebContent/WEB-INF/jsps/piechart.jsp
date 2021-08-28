<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


</head>
<body>

<script language = "JavaScript">

$(document).ready(function() {
	
	
	$.ajax({

		url :"piechart_data",

		success : function(data) {
			

			 var chart = {
				       plotBackgroundColor: null,
				       plotBorderWidth: null,
				       plotShadow: false,
				       height:300
				    };
				    var title = {
				       text: 'Citywise Employee Distribution'   
				    };
				    var tooltip = {
				       pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				    };
				    var plotOptions = {
				       pie: {
				          allowPointSelect: true,
				          cursor: 'pointer',
				          
				          dataLabels: {
				             enabled: true,
				             format: '<b>{point.name}</b>:{point.percentage:.1f} %',
				             style: {
				                color: (Highcharts.theme && Highcharts.theme.contrastTextColor)||
				                'black'
				             }
				          }
				       }
				    };
				    var series = [{
				       type: 'pie',
				       name: 'Percentage of Employees',
				       data: data
				    }];
				    var json = {};   
				    json.chart = chart; 
				    json.title = title;     
				    json.tooltip = tooltip;  
				    json.series = series;
				    json.plotOptions = plotOptions;
				    $('#container3').highcharts(json);
		},

	});
	
	
	

 });
      </script>

<div id="container3" class="h-25"></div>

</body>
</html>
