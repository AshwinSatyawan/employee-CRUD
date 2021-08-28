<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="st"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery.validate.js" />"></script>
<link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="<c:url value='/resources/js/form.js' />"></script>
<script	src="<c:url value='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js'/>"></script>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
<meta charset="ISO-8859-1">
<title><st:message code="lbl.view.title">
	</st:message></title>
</head>
<body >
	<jsp:include page="../jsps/header.jsp" />
	<script type="text/javascript">
	</script>
	<c:if test="${not empty Delconfirm}">
	</c:if>
	<div class="container" style="padding: 1px">
		<div>
			<c:if test=""></c:if>
			<div class="row">
				<c:choose>
					<c:when test="${not empty success}">
						<c:set var="show" value="true" />
						<c:set var="message" value="${success}" />
						<c:set var="message_code" value="alert-success" />
					</c:when>
					<c:when test="${not empty delSuccess }">
						<c:set var="show" value="true" />
						<c:set var="message" value="${delSuccess}" />
						<c:set var="message_code" value="alert-danger" />
					</c:when>
					<c:when test="${not empty modSuccess }">
						<c:set var="show" value="true" />
						<c:set var="message" value="${modSuccess}" />
						<c:set var="message_code" value="alert-success" />
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
				<c:if test="${not empty show}">
					<div align=center
						class="alert ${message_code} alert-dismissible col-md-6 offset-md-3"
						style="width: 80%">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<p class="text-center">
							<strong><st:message code="lbl.view.success" /></strong>
							${message}
						</p>
					</div>
				</c:if>
				<div class="widget stacked widget-table action-table mb-1"	style="margin-top: 50px">
					<a href="openAddEmp"
						class="btn btn-primary btn-lg confirmation mb-1" id="addemp"
						style="margin-bottom: '24px'; float: right">Add Employee</a>
					<div class="widget-header">
						<h3 style="display: inline-block">
							<st:message code="lbl.view.title"></st:message>
						</h3>
					</div>
					<div class="widget-content">
						<table
							class="table table-striped table-bordered table-responsive table-hover  col-centered"
							style="margin-top: 10px">
							<div>
								<span style="color: white">.</span>
							</div>
							<c:forEach items="${emp_res}" var="emp">
								</div>
								<div class="modal fade" id="modal${emp.e_id}" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel"><st:message code="lbl.view.delconfirm"></st:message></h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<st:message code="lbl.view.delconf"></st:message> <b>${emp.fname}
													${emp.lname}'s </b> Records ?
											</div>
											
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
												<a href="delEmp?id=${emp.e_id}" type="button"
													class="btn btn-primary">Delete</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="modal fade" id="dispModal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel"><st:message code="lbl.view.disp"></st:message></h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="container-fluid">
												<div id="dispEmp" class="row justify-content-center"></div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</table>
						<div class="row ">
							<display:table name="emp_res"
								class="table table-striped table-bordered  table-hover col-md-12 col-lg-12  mb-5 "
								requestURI="viewEmp" pagesize="5" export="true" uid="e_id"
								decorator="com.jamocha.utils.CustomTableDecorator">
								<display:setProperty name="export.decorated" value="false"/>
								<display:setProperty name="export.excel.filename" value="EmployeeDetails.xls" />
								<display:setProperty name="export.pdf" value="true" />
								<display:setProperty name="export.pdf.filename" value="EmployeeDetails.pdf"/>
								<display:column property="actions" class="text-nowrap"
									media="html" href="details.jsp"></display:column>
								<display:column property="dept" sortable="true" title="Dept." group="10"
									class="text-nowrap" />
								<display:column property="fname" sortable="true" 
									title="First Name" class="text-nowrap" media="all" />
								<display:column property="lname" sortable="true"
									title="Last Name" class="text-nowrap" />
								<display:column property="age" sortable="true" title="Age"
									class="text-nowrap" />
								<display:column property="salary" sortable="true" title="Salary" media="html xml pdf "
									class="text-nowrap" />
								<display:column property="state" sortable="true" title="State" media="html excel "
									class="text-nowrap" />
								<display:column property="city" sortable="true" title="City" media="html excel "
									class="text-nowrap" />
								<display:column property="skills" sortable="true" title="Skills"
									class="text-nowrap"
									decorator="com.jamocha.utils.CustomDecorator" />
								<display:column property="address" title="Address"
									class="text-nowrap" />
							</display:table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>