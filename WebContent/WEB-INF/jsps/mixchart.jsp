<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

</head>
<body>
<script language = "JavaScript">



$.ajax({

	url : "mixchart_data",

	success : function(data) {
		console.log(data);

	//	$('#mixchart').html(data)
	
		Highcharts.chart('container4', {
			   
			
			chart: {
		        type: 'column',
		        height:300
		    },
		    
		    
		    title: {
		        text: 'Department-Citywise Distribution'
		    },   
		    xAxis: {
		        categories: [<c:forEach items="${dept}" var="e"> '<c:out value="${e.key}"></c:out>',</c:forEach>'' ],
		        crosshair: true
		    },
		    yAxis: {
		    	allowDecimals: false,
		        min: 0,
		        title: {
		            text: 'No.of Employees'
		        }
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}:<b> {point.y} </b> </td>' +
		            '<td style="padding:0"></td></tr>',
		        footerFormat: '</table>',
		        shared: true,
		        useHTML: true
		    },
		    plotOptions: {
		        column: {
		            pointPadding: 0.2,
		            borderWidth: 0,
		            series: {
		                pointStart: 0
		            }
		        }
		    },
		    series: [ {
		        name: 'Department',
		        data: [<c:forEach items="${dept}" var="e"> <c:out value=" ${e.value} " ></c:out>,</c:forEach> ],
		        connectNulls: false

		    },
		    
		    {
			    type: 'line',
			    name: 'City 1',
			    data: [0,2,1] 
			},
			 
			
			<c:forEach items="${map}" var="e" varStatus="loop" > 
			<c:out value="{"/>type: 'line',
			<c:out value="name:"/>'<c:out value="${e.key}"/>',
			<c:out value="data:"/>[
			<c:forEach items="${e.value}" var="i" varStatus="l">                                   //varStatus***** !mportant
			<c:out value="${i.value}"/>  <c:if test="${!l.last}"> ,</c:if>
			</c:forEach>]
			<c:out value="}"/><c:if test="${!loop.last}"> ,</c:if>
			</c:forEach> 
			
		    ]
		});
	},
});












</script>

	
	
	
<div id="container4" style="height: 25%"></div>

</body>
</html>

