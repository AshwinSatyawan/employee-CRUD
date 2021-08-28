<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>

	<script language="JavaScript">


    $(document).ready(function() {  
    	
    	$.ajax({

			url :"barchart_data",

			success : function(data) {
			
				console.log(data.IT);
				
				for(var i=0;i<data.length;i++)
					{
					console.log(data[i]);
					}
				
				
				 var chart = {
				           type: 'bar',
				           height: 300
				        };
				        var title = {
				           text: 'Compensation Cost by Dept'   
				        };
				        
				        var subtitle = {
				             
				        };
				        
				        var xAxis = {
				           categories: ['IT','CS','EC'],
				           title: {
				              text: null
				           }
				        };
				        var yAxis = {
				           min: 0,
				           title: {
				              text: 'Salary (Thousand)',
				              align: 'high'
				           },
				           labels: {
				              overflow: 'justify'
				           }
				        };
				        var tooltip = {
				           valueSuffix: ' thousand'
				        };
				        var plotOptions = {
				           bar: {
				              dataLabels: {
				                 enabled: true
				              }
				           }
				        };
				        var legend = {
				           layout: 'horizontal',
				           align: 'right',
				           verticalAlign: 'top',
				           x: -40,
				           y: 100,
				           floating: true,
				           borderWidth: 1,
				           
				           backgroundColor: (
				              (Highcharts.theme && Highcharts.theme.legendBackgroundColor) ||
				                 '#FFFFFF'),
				           shadow: true
				        };
				        var credits = {
				           enabled: false
				        };
				        var series = [
				           {
				              
				              data: [data.IT, data.CS,data.EC,],
				              name: 'Total Department Salary'
				           }
				        ];
				  
				        var json = {};   
				        json.chart = chart; 
				        json.title = title;   
				        json.subtitle = subtitle; 
				        json.tooltip = tooltip;
				        json.xAxis = xAxis;
				        json.yAxis = yAxis;  
				        json.series = series;
				        json.plotOptions = plotOptions;
				        json.legend = legend;
				        json.credits = credits;
				        $('#container1').highcharts(json);
			},

		});
       
     });
        	 
        
      </script>


	<div id="container1"></div>



</body>
</html>