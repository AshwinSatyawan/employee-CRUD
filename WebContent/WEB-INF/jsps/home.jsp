<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="st"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/bootstrap.css'/>"	rel="stylesheet">
<script src="<c:url value='/resources/js/form.js' />"></script>
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery.validate.js" />"></script>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body style="background-color: #e9ecef; mb: 100px">
	<main class="login-form" style="margin-top:200px">
	<div class="cotainer" bg-color="#007bff">
		<div class="row justify-content-center">
			<div class="col-md-4">
				<div class="card">
					<div class="card-header">
						<st:message code="lbl.login.title" />
					</div>
					<div class="card-body">
						<sf:form action="viewEmp" modelAttribute="login" name="loginForm" id="loginForm">
							<div class="form-group row">
								<label for="email_address"
									class="col-md-4 col-form-label text-md-right"><st:message
										code="lbl.login.user" /></label>
								<div class="col-md-6">
									<sf:input path="l_id" class="form-control" maxlength="9"
										name="l_id" id="l_id" />
									<span style="color: red; font-weight: bold"> 
									<sf:errors path="l_id" /></span>
								</div>
							</div>
							<div class="form-group row">
								<label for="password"
									class="col-md-4 col-form-label text-md-right"><st:message
										code="lbl.login.pass" /></label>
								<div class="col-md-6">
									<sf:password path="password" class="form-control" maxlength="9"
										name="password" id="password" />
									<span style="color: red; font-weight: bold"> 
									<c:if	test="${not empty error}">
  									 Error: ${error}
									</c:if> <sf:errors path="password" /></span>
								</div>
							</div>
							<div class="col-md-6 offset-md-4">
								<button type="submit" class="btn btn-primary" id="loginsubmit">
									<st:message code="lbl.login.submit" />
								</button>
								<button type="reset" class="btn btn-primary">
									<st:message code="lbl.login.clear" />
								</button>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
</body>
</html>