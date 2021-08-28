package com.jamocha.controllers;

import java.util.ArrayList;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jamocha.services.Service;

import java.util.function.Function;
@Controller
public class HighChartController {

	@Autowired
	Service service;

//-----------------------------------------------------------------BARCHART------------------------------------------------------------------------------------------------------	
	@RequestMapping("/barchart")
	public String display(Model m) {
		return "barchart";
	}

//-------------------------------------------------------------------CHART--------------------------------------------------------------------------------------------------------	
	@RequestMapping("/charts")
	public String chart(Model m) {
		m.addAttribute("chart", "chart");
		return "charts";
	}
//------------------------------------------------------------------LINECHART-----------------------------------------------------------------------------------------------------	

	@RequestMapping("/linechart")
	public String linechart(Model m) {
		return "linecharts";
	}

//-------------------------------------------------------------------PIECHART----------------------------------------------------------------------------------------------------

	@RequestMapping("/piechart")
	public String piechart(Model m) {
		return "piechart";
	}
//-------------------------------------------------------------------=MIXCHART=------------------------------------------------------------------------------------------------	

	@RequestMapping("/mixchart")
	public String mixchart(Model m) {
		// =====================================================

		List<Employee> employees = service.mixchart();
		Map<String, Integer> data = new HashMap<String, Integer>();
		for (Employee i : employees) {
			data.put(i.getDept(), i.getDept_count());
		}
		// =========================================================
		List<Employee> emp_cd = service.mixchart1();
		Map<String, HashMap<String, Integer>> map = new HashMap();
		for (Employee e : emp_cd) {
			HashMap<String, Integer> c = new HashMap<String, Integer>();
			boolean flag = true;
			if (map.containsKey(e.getCity())) {
				for (Employee i : emp_cd) {
					c.put(i.getDept(), i.getDc_count());

					if (i.getDc_count().equals(null)) {
						c.put(i.getDept(), 0);
					}
				}
				flag = false;
				map.put(e.getCity(), c);
			}
			if (e.getDc_count().equals("")) {
				c.put(e.getDept(), 0);
			}
			c.put(e.getDept(), e.getDc_count());
			if (flag) {
				// c.put(e.getDept(), e.getDc_count());
				map.put(e.getCity(), c);
			}
		}
		m.addAttribute("map", map);
		m.addAttribute("dept", data);
		return "mixchart";
	}
//-----------------------------------------------------BARCHART_DATA----------------------------------------------------------------------------------------------	

	@RequestMapping("/barchart_data")
	@ResponseBody
	public Map<String, Integer> barchart_data(Model m) {
		List<Employee> employees = service.barchart();
		int IT = 0;
		int CS = 0;
		int EC = 0;
		Map<String, Integer> data = new HashMap<String, Integer>();

		for (Employee e : employees) {
			if (e.getDept().equals("IT")) {
				IT += e.getSalary();
			}

			if (e.getDept().equals("CS")) {
				CS += e.getSalary();
			}
			if (e.getDept().equals("EC")) {
				EC += e.getSalary();
			}
		}
		data.put("IT", IT);
		data.put("CS", CS);
		data.put("EC", EC);
		return data;
	}

//-------------------------------------------------------LINECHART_DATA----------------------------------------------------------------------------------------------	

	@RequestMapping("/linechart_data")
	@ResponseBody
	public Map linechart_data(Model m) {
		List<Employee> employees = service.linechart();
		
		 Map ageGroup2= employees.stream().collect(Collectors.groupingBy(e->e.age/10*10,Collectors.averagingInt(e->e.salary)));
		
			return ageGroup2;
	}

//-------------------------------------------------------PIECHART_DATA----------------------------------------------------------------------------------------------	

	@RequestMapping("/piechart_data")
	@ResponseBody
	public List piechart_data(Model m) {
		List<Employee> employees = service.piechart();
		Map<String, Integer> data = new HashMap<String, Integer>();
		// System.out.println(employees);
		for (Employee i : employees) {
			data.put(i.getCity(), i.getCity_count());
		}

		List al = new ArrayList();

		for (Employee i : employees) {
			List al1 = new ArrayList();
			al1.add(i.getCity());
			al1.add(i.getCity_count());
			al.add(al1);
		}
		return al;
	}

//---------------------------------------------------------MIXCHART_DATA---------------------------------------------------------------------------------------------------

	@RequestMapping("/mixchart_data")
	@ResponseBody
	public Map mixchart_data(Model m) {
		// =====================================================

		List<Employee> employees = service.mixchart();
		Map<String, Integer> data = new HashMap<String, Integer>();
		for (Employee i : employees) {
			data.put(i.getDept(), i.getDept_count());
		}
		// =====================================================
		List<Employee> emp_cd = service.mixchart1();
		Map<String, HashMap<String, Integer>> map = new HashMap();
		for (Employee e : emp_cd) {
			HashMap<String, Integer> c = new HashMap<String, Integer>();
			boolean flag = true;
			if (map.containsKey(e.getCity())) {
				for (Employee i : emp_cd) {
					c.put(i.getDept(), i.getDc_count());

					if (i.getDc_count().equals(null)) {
						c.put(i.getDept(), 0);
					}
				}
				flag = false;
				map.put(e.getCity(), c);
			}
			if (e.getDc_count().equals("")) {
				c.put(e.getDept(), 0);
			}
			c.put(e.getDept(), e.getDc_count());
			if (flag) {
				// c.put(e.getDept(), e.getDc_count());
				map.put(e.getCity(), c);
			}
		}
		m.addAttribute("map", map);
		m.addAttribute("dept", data);
		Map map1 = new HashMap();
		map1.put("map",map);
		map1.put("data", data);
		
		System.out.println(map1);

		return map1;
	}

}
