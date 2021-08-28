<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="st"%>

<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery.validate.js" />"></script>
<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/bootstrap.css'/>"	rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="<c:url value="/resources/js/form.js" />"></script>
<script src="<c:url value="/resources/js/city.js" />"></script>
<meta charset="ISO-8859-1">
<title><st:message code="lbl.manage.title"/></title>
</head>
<body style="background-color: #e9ecef;">
<jsp:include page="../jsps/header.jsp"/>
	<main class="my-form">
	<div class="container">
		<div class="">
			<c:choose>
				<c:when test="${flag=='modify' }">
					<c:set var="tag1" value="modEmp" />
					<c:set var="tag2" value="employee" />
					<c:set var="tag3" value="${employee.e_id}" />
					<c:set var="tag4" value="" />
					<c:set var="tag6" value="" />
					<c:set var="tag6" value="" />
					<c:set var="tag7" value="Modify Employee Details" />
					<c:set var="tag8" value="${employee.state}" />
				</c:when>
				<c:otherwise>
					<c:set var="tag1" value="addEmp" />
					<c:set var="tag2" value="employee" />
					<c:set var="tag3" value="" />
					<c:set var="tag4" value="reset" />
					<c:set var="tag7" value="Add Employee Details" />
					<c:set var="tag8" value="Select State" />
				</c:otherwise>

			</c:choose>


			<div class="card" style="margin-top: 50px">
				<div class="card-header">
				<div class="d-inline-block"><a href="viewEmp" class="btn btn-info d-inline-block">Back</a></div>
				<div class="d-inline-block float-right"><p class="mt-2 mb-1">${tag7}</p></div>
				</div>
				<div class="card-body">
					<sf:form action="${tag1}" modelAttribute="${tag2}" name="mform"	id="mform" method="POST">
						<input type="hidden" name="e_id" value="${tag3}">
						<input type='hidden' id='state_val' value='${employee.state}'>
						<input type='hidden' id='city_val' value='${city}'>
						<div class="row">
							<div class="col-md-6 col-sm-12" style="border-right: 1px">
								<div class="form-group row">
									<label for="fname"
										class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.fname"/><span style="color: red; font-weight: bold">* </span>
									</label>
									<div class="col-md-6">
										<sf:input path="fname" id="fname" name="fname" size="50"
											onkeypress='validate_text(event)' class="form-control"
											maxlength="20" />
										<span style="color: red; font-weight: bold"> <sf:errors
												path="fname" /></span>
									</div>
								</div>
								<div class="form-group row">
									<label for="lname"
										class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.lname"/></label>
									<div class="col-md-6">

										<sf:input path="lname" size="50" name="lname" id="lname"
											onkeypress='validate_text(event)' class="form-control"
											maxlength="20" />
										<span style="color: red; font-weight: bold"> <sf:errors
												path="lname" />
										</span>
									</div>
								</div>
								<div class="form-group row">
									<label for="age" class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.age"/><span
										style="color: red; font-weight: bold">* </span></label>
									<div class="col-md-6">
										<sf:input path="age" id="age" class="form-control"
											onkeypress='validate_num(event)' maxlength="2" />
										<span style="color: red; font-weight: bold"> <sf:errors
												path="age" />
										</span>
									</div>
								</div>
								<div class="form-group row">
									<label for="salary"
										class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.salary"/><span
										style="color: red; font-weight: bold">* </span></label>
									<div class="col-md-6">
										<sf:input path="salary" onkeypress='validate_num(event)'
											class="form-control" maxlength="9" id="salary" />
										<span style="color: red; font-weight: bold"> <sf:errors
												path="salary" />
										</span>
									</div>
								</div>
								<div class="form-group row">
									<label for="dept" class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.dept"/><span
										style="color: red; font-weight: bold">* </span></label>
									<div class="col-md-6">
										<sf:select path="dept" class="form-control " id="dept"
											name="dept">
											<sf:option value="" size="5"><st:message code="lbl.manage.select"/></sf:option>
											<sf:option value="IT" size="5"><st:message code="lbl.manage.IT"/></sf:option>
											<sf:option value="CS"><st:message code="lbl.manage.CS"/></sf:option>
											<sf:option value="EC"><st:message code="lbl.manage.EC"/></sf:option>
										</sf:select>
										<span style="color: red; font-weight: bold"> <sf:errors
												path="dept" />
										</span>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-sm-12" style="">
								<div class="form-group row">
									<label for="sts" class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.state"/><span
										style="color: red; font-weight: bold">* </span></label>
									<div class="col-md-6">
										<sf:select path="state" class="form-control"
											 id="sts" value="">
											<sf:option value="${tag8}"></sf:option>										
										</sf:select>
										<span style="color: red; font-weight: bold"> <sf:errors
												path="state" />
										</span>
									</div>
								</div>
								<div class="form-group row">
									<label for="state"
										class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.city"/><span
										style="color: red; font-weight: bold">* </span></label>
									<div class="col-md-6">
										<sf:select path="city" type="text" id="state"
											class="form-control" name="city" value="${employee.city}">
											<sf:option value="${employee.city}"></sf:option>
										</sf:select>
										<span style="color: red; font-weight: bold"> <sf:errors	path="city" />
										</span>
									</div>
								</div>

								<div class="form-group row">
									<label for="defaultCheck1"
										class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.skills"/><span
										style="color: red; font-weight: bold">* </span></label>
									<div class="col-md-6">
										<div class="form-check">
											<div>
												<sf:checkbox path="skills" id="skill1" value="Java"
													class="form-check-input" />
												<label for="skill1" class="form-check-label"> <st:message code="lbl.manage.java"/> </label>
											</div>
											<div>
												<sf:checkbox path="skills" id="skill2" value="J2EE"
													class="form-check-input" />
												<label for="skill2" class="form-check-label"> <st:message code="lbl.manage.j2ee"/> </label>
											</div>
											<div>
												<sf:checkbox path="skills" id="skill3" value="Spring"
													class="form-check-input" />
												<label for="skill3" class="form-check-label"> <st:message code="lbl.manage.spring"/>
												</label>
											</div>
											<div id="skillst" name="skillst">
												<sf:checkbox path="skills" id="skill4" value="Oracle"
													class="form-check-input" />
												<label for="skill4" class="form-check-label"> <st:message code="lbl.manage.oracle"/>
												</label>
											</div>
											<span style="color: red; font-weight: bold" id="skillerror">
											</span>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="address"
										class="col-md-4 col-form-label text-md-right"><st:message code="lbl.manage.address"/></label>
									<div class="col-md-6">
										<sf:textarea path="address" id="address" size="500"
											class="form-control rounded-0" maxlength="100" />
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-center">
							<button type="submit" class="btn btn-primary"
								style="margin: 5px; color: black; border-color: black"
								id="addsubmit">Save Changes</button>
							<input type="button" class="btn btn-primary" id="clear"
								value="Clear" onclick="fclear()"
								style="margin: 5px; background-color: #9e9e9e; color: black; border-color: black" />
							<script type="text/javascript">
									function fclear() {
										//alert("clearing");
										document.getElementById("fname").value = "";
										document.getElementById("lname").value = "";
										document.getElementById("age").value = "";
										document.getElementById("dept").value = "";
										document.getElementById("salary").value = "";
										document.getElementById("sts").value = '';
										document.getElementById("state").value = '';
										document.getElementById("state").value = '';
										document.getElementById("skill1").checked = false;
										document.getElementById("skill2").checked = false;
										document.getElementById("skill3").checked = false;
										document.getElementById("skill4").checked = false;
										document.getElementById("address").value = '';
									}
								</script>
						</div>
				</div>
				</sf:form>
			</div>
		</div>
	</div>
	</div>
	</div>
	***
	</div>
	</main>
</body>
</html>