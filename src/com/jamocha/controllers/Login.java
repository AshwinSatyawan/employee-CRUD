package com.jamocha.controllers;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
public class Login {
	
	@Id@GeneratedValue
	Long sl;
	
	
	@NotEmpty@Size(min = 5, max = 15,message = "ID should be minimum 5 letters") 
	private String l_id;
	
	
	@NotEmpty @Size(min = 6, max = 15,message = "password should be minimum 6 letters")
	private String password;
	
	
	
	public Login() {
		// TODO Auto-generated constructor stub
		//System.out.println("Login bean created");
		//System.out.println(id+password);
	}



	public Long getSl() {
		return sl;
	}



	public void setSl(Long sl) {
		this.sl = sl;
	}



	public String getL_id() {
		return l_id;
	}



	public void setL_id(String l_id) {
		this.l_id = l_id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((l_id == null) ? 0 : l_id.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		return result;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Login other = (Login) obj;
		if (l_id == null) {
			if (other.l_id != null)
				return false;
		} else if (!l_id.equals(other.l_id))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "Login [l_id=" + l_id + ", password=" + password + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
