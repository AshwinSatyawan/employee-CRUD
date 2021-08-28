package com.jamocha.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jamocha.DAO.EmployeeDAO;
import com.jamocha.controllers.Employee;
import com.jamocha.controllers.Login;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service {

	@Autowired
	EmployeeDAO emp;
	
	
	public String login(Login login) {
		// TODO Auto-generated method stub
		
		//System.out.println("IN SERVICE-> "+login);
		
		String status="";
		
		status = emp.login(login);
		//System.out.println("status "+status);
		
		
		return status;
	}


	public String addEmp(Employee employee) {
		// TODO Auto-generated method stub
		//System.out.println("IN SERVICE emp-> "+employee);
		
		
		String status="";
		
		
		status=emp.addEmp(employee);
		
		return status;
	}

	
	public List<Employee> viewEmp() {
		List<Employee> empl=emp.viewEmp();
		return empl;
	}

	
	public String delEmp(Long id) {
		// TODO Auto-generated method stub
		
		String status=emp.delEmp(id);
		return status;
	}

	
	public String modEmp(Employee employee) {
		
		String status=emp.modEmp(employee);
		return status;
	}


	public Employee findEmp(Long id) {
		// TODO Auto-generated method stub
		Employee e =emp.findEmp(id);
		return e;
	}


	public List<Employee> barchart() {
		// TODO Auto-generated method stub
		List<Employee> empl=emp.barchart();
		return empl;
	}


	public List<Employee> linechart() {
		// TODO Auto-generated method stub
		List<Employee> empl=emp.linechart();
		return empl;
	}


	public List<Employee> piechart() {
		// TODO Auto-generated method stub
		List<Employee> empl=emp.piechart();
		return empl;
	}


	public List<Employee> mixchart() {
		// TODO Auto-generated method stub
		List<Employee> empl=emp.mixchart();
		return empl;
	}


	public List<Employee> mixchart1() {
		// TODO Auto-generated method stub
		List<Employee> empl=emp.mixchart1();
		return empl;
	}

}
