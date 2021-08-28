package com.jamocha.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.Valid;
import javax.validation.constraints.*;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

@Entity
public class Employee {

	
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}
	@Id @GeneratedValue
	public Long e_id;

	@NotBlank(message = "Name is Mandatory")
	private String fname;

	private String lname;

//@Min(value=18, message="must be equal or greater than 18")  
//@Max(value=45, message="must be equal or less than 45")

	@NotNull(message = "Age is Mandatory")
	@Range(min = 18, max = 99, message = "Age should be between 18 and 99") Integer age;

	@NotNull(message = "salary may not be empty")
	@Range(min = 1) Integer salary;

	@NotBlank(message = "")
	@NotEmpty(message = "Select one Department")
	private String dept;

	@NotBlank(message = "Select atleast one state")
	private String state;

	@NotBlank(message = "Select atleast one City")
	private String city;

	@NotEmpty(message = "At least one Skill is required")
	@Valid
	@ElementCollection(fetch = FetchType.EAGER)
	private List<String> skills = new ArrayList<String>();

	private String address;
	
	private Integer city_count;
	
	private Integer dept_count;
	
	private Integer dc_count;
	
	
	
	
	
	
	

	public Integer getDc_count() {
		return dc_count;
	}

	public void setDc_count(Integer dc_count) {
		this.dc_count = dc_count;
	}

	public Integer getDept_count() {
		return dept_count;
	}

	public void setDept_count(Integer dept_count) {
		this.dept_count = dept_count;
	}

	public Integer getCity_count() {
		return city_count;
	}

	public void setCity_count(Integer city_count) {
		this.city_count = city_count;
	}

	public Long getE_id() {
		return e_id;
	}

	public void setE_id(Long e_id) {
		this.e_id = e_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkills(List<String> skills) {
		this.skills = skills;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Employee [fname=" + fname + ", lname=" + lname + ", age=" + age + ", salary=" + salary + ", dept="
				+ dept + ", state=" + state + ", city=" + city + ", skills=" + skills + ", address=" + address + "]";
	}

}
