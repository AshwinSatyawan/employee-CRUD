package com.jamocha.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class RequestInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception exp)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		// TODO Auto-generated method stub
		
		/*
		 * 
		 * 
		 */

		
		
		
		  if(null==request.getSession(false)||null==request.getSession(false). getAttribute("islogin")) {
		  
		  
		  HttpSession session = request.getSession(true);
		  response.sendRedirect("/EmployeeCRUD/home"); return false;
		  //System.out.println("HANDLER--------->"+session.getAttribute("login"));http:
		  //localhost:8080/EmployeeCRUD/findEmp?id=24 
		  }
		 
		
		
		return true;
	}

}
	
	

