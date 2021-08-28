<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://www.springframework.org/tags" prefix="st"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/font-awesome.min.css'/>" rel="stylesheet">

    
</head>
<body>
<div>
<section class=" bg-primary inner-header ">

<c:if test ="${not empty islogin.password}">
    <div class="float-right">
      <div class="">
        <a href="logout" class="btn btn-success btn-md" style="border-radius: 0px;">
          <span class="fa fa-sign-out"></span>Logout
        </a>
      </div> 
    </div>
</c:if>

<c:if test ="${(empty chart) && (not empty islogin.password )}">
 <div class="float-right">
      <div class="mr-1">
        <a href="charts" class="btn btn-primary btn-md" >
          <span class="fa fa-bar-chart "></span>
        </a>
      </div> 
    </div>
</c:if>
<c:if test ="${not empty chart}">
 <div class="float-right">
      <div class="">
        <a href="viewEmp" class="btn btn-primary btn-md">
          <span class="fa fa-table mr-1"></span>
        </a>
      </div> 
    </div>
 </c:if>
	<div class="row">
		<div class="col-md-12   " style="display:'block-inline';">
			<h5 class="m-2 text-white">Employee</h5>  
			<div class="breadcrumbs">
			</div>       
		</div>
	</div>
</div>   
</section>
</div>

</body>
</html>


