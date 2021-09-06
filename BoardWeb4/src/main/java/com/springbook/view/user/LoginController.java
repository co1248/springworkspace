package com.springbook.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

@Controller
public class LoginController {

	@RequestMapping("login.do")
	public String ligin(UserVO vo , UserDAO userDAO /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("로그인 처리");
		if(userDAO.getUser(vo) != null) {
			return "redirect:getBoardList.do";
		} else {
			return "redirect:login.jsp";
		}
	}
}