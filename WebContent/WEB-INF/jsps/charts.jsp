<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/highcharts.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<link href="<c:url value='/resources/css/bootstrap.css'/>"
	rel="stylesheet">
<title>Dashboard</title>
<script>
	$(document).ready(function() {

		$.ajax({

			url : "barchart",

			success : function(data) {

				$('#barchart').html(data)
			},

		});

		$.ajax({

			url : "linechart",

			success : function(data) {
				//console.log(data);

				$('#linechart').html(data)
			},

		});

		$.ajax({

			url : "piechart",

			success : function(data) {
				//console.log(data);

				$('#piechart').html(data)
			},

		});
		$.ajax({

			url : "mixchart",

			success : function(data) {
				//console.log(data);

				$('#mixchart').html(data)
			},
		});
	});
</script>
<script>
	$(function() {
		$('#sortable').sortable({
			items : ".row > div",
			placeholder : 'sortable-placeholder',
			distance : 4,
			containment: "parent"

		}).disableSelection(); //style=""
	});
</script>
</head>
<body style="background-color: #e9ecef;overflow-y: auto;">
	<jsp:include page="../jsps/header.jsp" />
	<div class="container pt-0" id="sortable">

		<div class=" row mt-4 pt-1 ">
			<div class="col-md-6 col-sm-12 col-lg-6 card     " style="border-width: 5px 5px;border-color: #e9ecef">
				<div id="barchart"></div>
			</div>
			<div class="col-md-6  col-sm-12 col-lg-6 card   " style="border-width: 5px 5px;border-color: #e9ecef">
				<div id="linechart"></div>
			</div>
		
				<div class="col-md-6 col-sm-12 col-lg-6 card  " style="border-width: 5px 5px;border-color: #e9ecef">
				<div id="piechart"></div>
			</div>
			<div class="col-md-6  col-sm-12 col-lg-6 card   " style="border-width: 5px 5px;border-color: #e9ecef">
				<div id="mixchart"></div>
			</div>
		</div>
	</div>

</body>
</html>