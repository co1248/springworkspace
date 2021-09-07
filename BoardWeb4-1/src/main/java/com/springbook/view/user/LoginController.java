package com.springbook.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class LoginController {
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String liginView(UserVO vo) {
		System.out.println("로그인 처리GET");
		vo.setId("test");
		vo.setPassword("test123");
		return "redirect:login.jsp";
	}

	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String ligin(UserVO vo , UserDAO userDAO, HttpSession session /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("로그인 처리POST");
		UserVO user = userDAO.getUser(vo);
		if(user != null) {
			session.setAttribute("userName", user.getName());
			return "redirect:getBoardList.do";
		} else {
			return "redirect:login.jsp";
		}
	}
}