package com.spring.mau.view.index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping("/index")
	public ModelAndView home(Model mode) {
		// TODO Auto-generated method stub
		System.out.println("메인으로");
		return new ModelAndView("index.jsp");
	}
}
