<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link href="<c:url value='/resources/css/bootstrap.css'/>" rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details</title>
</head>
<body>


<div class="container">

<div class="row">

<table class="table table-bordered">
  <tbody>
    
    <tr>
      <th scope="row">First Name</th>
      <td> ${empl.fname} </td>
    </tr>
    
    
    <c:if test="${not empty empl.lname}">
    <tr>
      <th scope="row">Last Name</th>
      <td> ${empl.lname} </td>
      </tr>
      </c:if>
    
    <tr>
      <th scope="row">Age</th>
      <td> ${empl.age} </td>
      </tr>
    
    <tr>
      <th scope="row">Salary</th>
      <td>${empl.salary}</td>
      </tr>
      
      <tr>
      <th scope="row">Dept.</th>
      <td>${empl.dept}</td>
      </tr>
      
      <tr>
      <th scope="row">State</th>
      <td>${empl.state}</td>
      </tr>
    
    	
      <tr>
      <th scope="row">City</th>
      <td>${empl.city}</td>
      </tr>
      
      <tr>
      <th scope="row">Skills</th>
      <td>
      <c:forEach items="${empl.skills}" var="sk"	varStatus="status">
	  <c:out value="${sk}" />
	  <c:if test="${!status.last}">,</c:if>
	  </c:forEach>
	  </td>
      </tr>
       
       <c:if test="${not empty empl.address}">
       <tr>
       <th scope="row">Address</th>
       <td> ${empl.address} </td>
       </tr>
       </c:if>
    
  </tbody>
</table>

</div>



</div>





</body>
</html>




















































