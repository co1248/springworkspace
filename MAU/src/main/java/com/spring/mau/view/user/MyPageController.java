package com.spring.mau.view.user;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;

@Controller
public class MyPageController {
	@Autowired
	private UserService userService;
	@Autowired
	private MapViewService mapViewService;
	@RequestMapping("/mypage")
	public ModelAndView logout(UserVO userVo,Model model,HttpSession session,MapViewVO mapViewVo){
		// TODO Auto-generated method stub
				System.out.println("mypage호출");
				UserVO user = null;
				Integer user_seq = (Integer)session.getAttribute("userSeqId");
				if(user_seq!=null) {
					userVo.setUserSeqId(user_seq);
					user = userService.mypageGetUser(userVo);
					model.addAttribute("user", user);
					mapViewVo.setUserSeqId(user.getUserSeqId());
					List<MapViewVO> mapseq = mapViewService.getMapSeq(mapViewVo);
					model.addAttribute("user", user);
					model.addAttribute("mapSeq", mapseq);
					return new ModelAndView("myPage/myPage.jsp");
				}else {
					return new ModelAndView("index");
				}
				
	}
}