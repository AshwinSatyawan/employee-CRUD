<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



</head>
<body>


<script language = "JavaScript">

$(document).ready(function() {
	
	
var i=10;	
	
	$.ajax({

		url :"linechart_data",

		success : function(data) {
			
			const keys = Object.values(data)
			const values = Object.keys(data)
			console.log(keys)
	
		
		
			console.log(data.values);
			
			var chart = {
		            height: 300
		        };
		
	    var title = {
	       text: 'Employee Agewise Average Salary'   
	    };
	    
	    var subtitle = {
	      
	    };
	    
	    var xAxis = {
	    		
	    		title: {
	    	          text: 'Age Group'
	    	       },
	       categories: ['<20','20-30','31-40','41-50','>50']
	    };
	    var yAxis = {
	       title: {
	          text: 'Average Salary (thousand)'
	       },
	       plotLines: [{
	          value: 0,
	          width: 1,
	          color: '#808080'
	       }]
	    };   
	    var tooltip = {
	       valuePrefix: 'Avg Salary :',
	       pointFormat: "avg salary: {point.y:.2f}"
	    }
	    var legend = {
	       layout: 'vertical',
	       align: 'right',
	       verticalAlign: 'middle',
	       borderWidth: 0
	    };
	    var series =  [{
	          
	          data: keys
	       
	    
	    }
	    ];

	    var json = {};
	    json.chart = chart; 
	    json.title = title;
	    json.subtitle = subtitle;
	    json.xAxis = xAxis;
	    json.yAxis = yAxis;
	    json.tooltip = tooltip;
	    json.legend = legend;
	    json.series = series;
	    
	    $('#container2').highcharts(json);

			
		},

	});
	
	
	
	
	
	
	
	
	
	

 });
      </script>
      
      
 <c:forEach items="${sal_avg}" var="v">

<c:out value="${v.key}"/>

</c:forEach>
<div id="container2"></div>











</body>
</html>