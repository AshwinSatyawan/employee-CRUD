package com.jamocha.utils;

import org.springframework.validation.Errors;

import com.jamocha.controllers.Employee;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.*;


@Component
public class CustomValidator implements Validator {

	
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Employee.class.isAssignableFrom(clazz);
	}

	
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "error.age", "Only numbers allowed");
		boolean b=false;
		Employee emp=(Employee)target;
		
		
				
				
		
		
	
		
		
	}

}
