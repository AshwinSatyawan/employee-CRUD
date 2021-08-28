package com.jamocha.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamocha.controllers.Employee;
import com.jamocha.controllers.Login;

//@Repository
public class EmployeeHSQLdao  {

	///@Autowired
	SessionFactory factory;

	//@Override
	public String login(Login login) {

		System.out.println("in DAO impl.->" + login);

		Session s = factory.openSession();
		s.beginTransaction();

		List<Login> log = s.createQuery("from Login where l_id='" + login.getL_id() + "' and password='"
				+ login.getPassword() + "'            ").getResultList();
		// System.out.println("DAO-> "+log);
		// List<Student> students = s.createQuery("from Student").getResultList();
		String status = "";

		if (log.isEmpty()) {
			// System.out.println("ERROR!!!!!!!!!!!!");
			status = "login.error";
		}

		else {
			// System.out.println("SUCCESSSS!!!!!!");
			// System.out.println(log);
			status = "login.success";
		}

		s.getTransaction().commit();
		s.close();

		return status;

	}

	//@Override
	public String addEmp(Employee employee) {
		// TODO Auto-generated method stub

		System.out.println("emp in DAO " + employee);

		Session s = factory.openSession();
		s.beginTransaction();

		s.save(employee);

		s.getTransaction().commit();
		s.close();
		return "save.success";
	}

	//@Override
	public List<Employee> viewEmp() {
		Session s = factory.openSession();
		s.beginTransaction();

		List<Employee> emp = s.createQuery("from Employee").getResultList();
		// System.out.println("DAO ->"+emp);
		// List<Student> students = s.createQuery("from Student").getResultList();

		s.getTransaction().commit();
		s.close();

		// System.out.println(emp);
		return emp;

	}

	//@Override
	public String delEmp(Long id) {
		// TODO Auto-generated method stub
		Session s = factory.openSession();
		s.beginTransaction();

		Employee e = s.get(Employee.class, id);
		s.delete(e);

		s.getTransaction().commit();
		s.close();

		return "delete.success";
	}

	//@Override
	public String modEmp(Employee employee) {
		// TODO Auto-generated method stub

		System.out
				.println("-----------------==============================>>>>>>>>>>>>>>>>>>>>>>>" + employee.getE_id());

		Session s = factory.openSession();
		s.beginTransaction();

		// ;
		// Employee e=s.get(Employee.class,employee.getE_id());
		s.update(employee);

		s.getTransaction().commit();
		s.close();
		return "modify.success";
	}

	//@Override
	public Employee findEmp(Long id) {
		// TODO Auto-generated method stub

		Session s = factory.openSession();
		s.beginTransaction();

		Employee emp = s.get(Employee.class, id);

		// System.out.println(emp);

		s.getTransaction().commit();
		s.close();

		return emp;
	}

}
