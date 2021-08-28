package com.jamocha.utils;

import org.displaytag.decorator.TableDecorator;

import com.jamocha.controllers.Employee;

public class CustomTableDecorator extends TableDecorator

{
	public CustomTableDecorator() {	
		super();
		}
	public String getFname()	
	{
	Employee emp= (Employee) getCurrentRowObject();
	return "<div id='d'><a  href='#"+ emp.getE_id()+ " '>" +emp.getFname()+ "</a></div>" ;
	}
	public String getActions()
	{
		Employee emp= (Employee) getCurrentRowObject();
		return "<div style='padding: 5px' class='pl-1'> <a href=\"findEmp?id="+emp.getE_id()+"\" title=\"Modify\" class='m-1'>"
				+ "<i class=\"fa fa-pencil-square-o fa-1x\" aria-hidden=\"true\">"
				+ "</i>"
				+ "</a>"
				+ "<a href='#"+emp.getE_id()+"' id='delemp' title='Delete' class='m-1' >"
				+ "<i class='fa fa-trash-o fa-1x' data-toggle='modal' data-target='#modal"+emp.getE_id()+"' aria-hidden='true'>"
				+ "</i>"
				+ "</a> </div>"		
		;
	}
}
