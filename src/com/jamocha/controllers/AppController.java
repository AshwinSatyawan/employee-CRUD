package com.jamocha.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jamocha.services.Service;
import com.jamocha.utils.CustomValidator;
import com.jamocha.utils.MycustomNumberEditor;

//------------------------------------------------------------------LOGIN------------------------------------------------------------------------------------------------
@Controller
@SessionAttributes("login")
public class AppController {
	private static final Logger logger = Logger.getLogger(AppController.class);

	@Autowired
	CustomValidator customvalidator;

	@InitBinder("Employee")
	protected void initBinder1(WebDataBinder binder) {
		binder.addValidators(customvalidator);
	}

	@InitBinder
	public void registerCustomerBinder(WebDataBinder binder) {

		binder.registerCustomEditor(int.class, new MycustomNumberEditor(Integer.class));
		logger.debug("this will appear as a log in mylogfile.log!");
	}

//------------------------------------------------------------------HOME-------------------------------------------------------------------------------------------------
	@Autowired
	Service service;

	@RequestMapping({ "/", "/home" })
	public String showHome(Model m, HttpSession session) {
		m.addAttribute("login", new Login());
		session.setAttribute("islogin", new Login());

		return "home";
	}

//------------------------------------------------------------------VIEW-----------------------------------------------------------------------------------------------
	@RequestMapping("/viewEmp")
	public String viewEmp(@ModelAttribute("login") @Valid Login login, BindingResult result, Model model,
			HttpSession session) {

		String msg = service.login(login);

		if (msg.equals("login.success")) {
			session.setAttribute("islogin", login);
			// System.out.println(session.getAttribute("islogin"));
			List<Employee> employees = service.viewEmp();
			// System.out.println(employees);
			model.addAttribute("emp_res", employees);

			return "viewEmp";
		}

		else {
			model.addAttribute("error", "loginfailed");
			return "home";
		}
	}

//-----------------------------------------------------------------pre_ADD-------------------------------------------------------------------------------------------------
	@RequestMapping("/openAddEmp")
	public String openaddEmp(Model model, Employee employee) {

		model.addAttribute("employee", new Employee());

		return "manageEmp";

	}

//------------------------------------------------------------------ADD-------------------------------------------------------------------------------------------------------------
	@RequestMapping("/addEmp")
	public String addEmp(@ModelAttribute("employee") @Valid Employee employee, BindingResult result, Model model,
			Login login, HttpSession session) {

		try {
			// customvalidator.validate(employee, result);
			String status = service.addEmp(employee);

			if (status.equals("save.success")) {
				model.addAttribute("success", "Employee Record Saved Succesfully............!");

				List<Employee> employees = service.viewEmp();
				// System.out.println("in cntrl-> "+employees);
				model.addAttribute("emp_res", employees);
				return "viewEmp";
			}

			else {
				return "nologin";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			return "error";
		}

	}

//-----------------------------------------------------------------DELETE-----------------------------------------------------------------------------------------------
	@RequestMapping("/delEmp")
	public String delEmp(Long id, Model model) {

		try {
			String status = service.delEmp(id);
			List<Employee> employees = service.viewEmp();
			model.addAttribute("emp_res", employees);

			if (status.equals("delete.success")) {
				model.addAttribute("delSuccess", "Employee Record Deleted Succesfully............!");
			}

			return "viewEmp";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			return "error";
		}

	}

//---------------------------------------------------------------MODIFY------------------------------------------------------------------------------------------------------
	@RequestMapping("/modEmp")
	public String modEmp(@ModelAttribute("employee") @Valid Employee employee, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "manageEmp";
		} else {

			String status = service.modEmp(employee);
			// System.out.println("id->"+id);
			List<Employee> employees = service.viewEmp();
			// System.out.println("in cntrl-> "+employees);
			model.addAttribute("emp_res", employees);

			if (status.equals("modify.success")) {
				model.addAttribute("modSuccess", "Employee Record Modified Succesfully............!");
			}

			model.addAttribute("state", employee.getState());
			model.addAttribute("city", employee.getCity());

			return "viewEmp";
		}

	}

//-----------------------------------------------------------------FIND---------------------------------------------------------------------------------------------------------
	@RequestMapping("/findEmp")
	public String findEmp(Long id, Model model) {

		try {
			if (!id.equals(null)) {
				Employee e = service.findEmp(id);

				if (!e.equals(null)) {
					model.addAttribute("employee", e);
					model.addAttribute("flag", "modify");
					return "manageEmp";
				}

				else {
					return "error";
				}
			} else {
				return "error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "error";
		}

	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// session.setAttribute("login",null);
		session.invalidate();

		return "home";

	}

//-----------------------------------------------------------------DISPLAY-------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/dispEmp")
	public String dispEmp(Long id, Model model) {

		System.out.println(id);

		Employee e = service.findEmp(id);
		model.addAttribute("empl", e);

		return "dispEmp";
	}

}
