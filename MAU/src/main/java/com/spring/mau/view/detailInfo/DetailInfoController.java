package com.spring.mau.view.detailInfo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;

@Controller
@SessionAttributes("detailInfo")
public class DetailInfoController {
	@Autowired
	private PlaceService placeService;
	@RequestMapping("/detailInfo/{placeSeq}")
	public ModelAndView getGuiderMap (@PathVariable("placeSeq") int placeSeq, Model model, PlaceVO vo) {
		// TODO Auto-generated method stub
		PlaceVO place = placeService.getPlace(vo);
		model.addAttribute("place", place);
		System.out.println("상세 보기");
		return new ModelAndView("../detailInfo/detailview.jsp");
	}
	
}
