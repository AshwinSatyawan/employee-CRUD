package com.jamocha.utils;

import javax.servlet.jsp.PageContext;

import org.displaytag.decorator.DisplaytagColumnDecorator;
import org.displaytag.exception.DecoratorException;
import org.displaytag.properties.MediaTypeEnum;

public class CustomDecorator implements DisplaytagColumnDecorator {

	public Object decorate(Object columnValue, PageContext pageContext, MediaTypeEnum media) throws DecoratorException {
		// TODO Auto-generated method stub

		try {
			Object colVal = columnValue;
			if (null != columnValue) {
			//	System.out.println(colVal);

				String str = colVal.toString(), str2 = "";

				for (int i = 0; i < str.length(); i++) {
					if (!(str.charAt(i) == '[' || str.charAt(i) == ']')) {
						str2 += str.charAt(i);
					}
				}

				// System.out.println(str2);

				return  str2;

				// colVal.toString().chars();
			}
			return colVal;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			return columnValue;
		}

	}

}
