package com.jamocha.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.jamocha.controllers.Employee;
import com.jamocha.controllers.Login;
import com.jamocha.mybatis.MyBatisUtil;

@Repository
public class EmployeeMYBATISdao implements EmployeeDAO {

	public String login(Login login) {

		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();

		try {

			// login(login);
			String status;
			//System.out.println(login);
			List<Login> log = new ArrayList<Login>();

			System.out.println(log);
			log = sqlSession.selectList("login", login);

			sqlSession.commit();

			if (log.isEmpty()) {
				return "login.fail";
			} else {
				return "login.success";
			}

		} finally {
			sqlSession.close();
		}

	}

	public String addEmp(Employee employee) {

		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			
			//System.out.println(employee);
			EmployeeDAO userMapper = sqlSession.getMapper(EmployeeDAO.class); // sqlSession.getMapper(UserMapper.class);
			// userMapper.addEmp(employee); //userMapper.insertUser(employee);
			Integer insertedId = (Integer) sqlSession.insert("addEmp1", employee);

			List<String> skills = employee.getSkills();

			sqlSession.insert("addskills", employee);

			// sqlSession.insert("addskills", employee);

			// System.out.println("llllllllllll" + employee.getE_id());
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

		return "save.success";
	}

	public List<Employee> viewEmp() {

		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			EmployeeDAO userMapper = sqlSession.getMapper(EmployeeDAO.class);

			List<Employee> emp = sqlSession.selectList("viewEmpr");
			//System.out.println(emp);
			return emp;
		} finally {
			sqlSession.close();
		}

	}

	public String delEmp(Long id) {

		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			EmployeeDAO userMapper = sqlSession.getMapper(EmployeeDAO.class);
			// userMapper.delEmp(id);
			int i = id.intValue();

			sqlSession.delete("deleteEmps", i);

			sqlSession.delete("deleteEmpr", i);

			// sqlSession.delete(i);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

		return "delete.success";
	}

	public String modEmp(Employee employee) {

		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			EmployeeDAO userMapper = sqlSession.getMapper(EmployeeDAO.class);
			// userMapper.modEmp(employee);
			int id = employee.getE_id().intValue();

			//System.out.println("SDADQWDWDWQQSWDSADADAWDADWDASXD" + employee.e_id);

			sqlSession.update("modEmp1", employee);
			sqlSession.delete("deleteEmps", id);
			sqlSession.insert("modEmps", employee);

			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return "modify.success";

	}

	public Employee findEmp(Long id) {

		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {
			EmployeeDAO userMapper = sqlSession.getMapper(EmployeeDAO.class);
			// userMapper.findEmp(id);s

			Employee emp = sqlSession.selectOne("findEmp", id.intValue());

			sqlSession.commit();

			// System.out.println(emp);
			return emp;

		} finally {
			sqlSession.close();
		}

	}

	public List<Employee> barchart() {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {

			List<Employee> emp = sqlSession.selectList("barchart");
			//System.out.println(emp);
			return emp;
		} finally {
			sqlSession.close();
		}
	}

	public List<Employee> linechart() {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {

			List<Employee> emp = sqlSession.selectList("linechart");
			//System.out.println(emp);
			return emp;
		} finally {
			sqlSession.close();
		}
	}

	public List<Employee> piechart() {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {

			List<Employee> emp = sqlSession.selectList("piechart");
			//System.out.println(emp);
			return emp;
		} finally {
			sqlSession.close();
		}
	}

	public List<Employee> mixchart() {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {

			List<Employee> emp = sqlSession.selectList("mixchart");
			//System.out.println(emp);
		
			return emp;
		} finally {
			sqlSession.close();
		}
	}

	public List<Employee> mixchart1() {
		// TODO Auto-generated method stub
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		try {

			List<Employee> emp = sqlSession.selectList("mixchart1");
			//System.out.println(emp);
		
			return emp;
		} finally {
			sqlSession.close();
		}
	}

}
