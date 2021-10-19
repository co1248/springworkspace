package com.spring.mau.view.detailInfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;

@Controller
@SessionAttributes("detailInfo")
public class DetailInfoController {
//	@Autowired
//	private MapViewService mapViewService;
	@RequestMapping("/detailInfo/{placeSeq}")
	public ModelAndView getGuiderMap (@PathVariable("placeSeq") int placeSeq, Model model, MapViewVO vo) {
		// TODO Auto-generated method stub
		System.out.println("상세 보기");
		return new ModelAndView("../detailInfo/detailview.jsp");
	}
	
}
