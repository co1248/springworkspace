package com.spring.mau.view.user;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.user.UserService;
import com.spring.mau.user.UserVO;

@Controller
public class MyPageController {
	@Autowired
	private UserService userService;

	@Autowired
	private MapService mapService;
	@RequestMapping("/mypage")
	public ModelAndView myPage(UserVO userVo,Model model,HttpSession session,MapVO mapVo){
		// TODO Auto-generated method stub
				System.out.println("mypage호출");
				UserVO user = null;
				Integer user_seq = (Integer)session.getAttribute("userSeqId");
				if(user_seq!=null) {
					userVo.setUserSeqId(user_seq);
					user = userService.mypageGetUser(userVo);
					model.addAttribute("user", user);
					mapVo.setUserSeqId(user.getUserSeqId());
					model.addAttribute("user", user);
					List<MapVO> allmap = mapService.getMapList(mapVo); //지도모든타입리스트 가져오기
					model.addAttribute("allmap", allmap);
					List<MapVO> guideMap = mapService.getguideMapList(mapVo); //가이드지도리스트 가져오기
					model.addAttribute("guideMap", guideMap);
					List<MapVO> guiderMap = mapService.getguiderMapList(mapVo); //가이더지도리스트 가져오기
					model.addAttribute("guiderMap", guiderMap);
					return new ModelAndView("myPage/myPage.jsp");
				}else {
					return new ModelAndView("index");
				}
	}
	
	@RequestMapping("/createGuiderMapForm")
	public ModelAndView createGuiderMapForm(Model model,HttpSession session) {
		System.out.println("가이더지도등록하러가자");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user==null) {
			return new ModelAndView("index");
			}else {
				return new ModelAndView("myPage/insertMapForm.jsp");
			}
	}
	@RequestMapping("/createGuideMapForm")
	public ModelAndView createGuideMapForm(Model model,HttpSession session) {
		System.out.println("가이드지도등록하러가자");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user==null) {
			return new ModelAndView("index");
			}else {
				return new ModelAndView("myPage/insertGuideMapForm.jsp");
			}
	}
	
}