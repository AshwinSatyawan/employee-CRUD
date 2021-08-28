package com.jamocha.DAO;

import java.util.List;

import com.jamocha.controllers.Employee;
import com.jamocha.controllers.Login;

public interface EmployeeDAO {

	public String login(Login login);

	public String addEmp(Employee employee);

	public List<Employee> viewEmp();

	public String delEmp(Long id);

	public String modEmp(Employee employee);

	public Employee findEmp(Long id);

	public List<Employee> barchart();

	public List<Employee> linechart();

	public List<Employee> piechart();

	public List<Employee> mixchart();

	public List<Employee> mixchart1();

	
	
	
}
