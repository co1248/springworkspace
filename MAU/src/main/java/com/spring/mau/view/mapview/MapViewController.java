package com.spring.mau.view.mapview;

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
@SessionAttributes("mapView")
public class MapViewController {
	@Autowired
	private MapViewService mapViewService;
	@RequestMapping("/guiderMap/{mapSeq}")
	public ModelAndView getGuiderMap (@PathVariable("mapSeq") int mapSeq,MapViewVO vo, Model model ) {
		// TODO Auto-generated method stub
		System.out.println("개인지도 상세 보기(가이더지도)");
		vo.setMapSeq(mapSeq);
		List<MapViewVO> placeList = mapViewService.getMap(vo);
		model.addAttribute("placeList", placeList);
		return new ModelAndView("../guider/guiderMap.jsp");
	}
	@RequestMapping("/guideMap/{mapSeq}")
	public ModelAndView getGuideMap (@PathVariable("mapSeq") int mapSeq,MapViewVO vo, Model model ) {
		// TODO Auto-generated method stub
		System.out.println("테마지도 상세 보기(가이드지도)");
		vo.setMapSeq(mapSeq);
		List<MapViewVO> placeList = mapViewService.getMap(vo);
		model.addAttribute("placeList", placeList);
		return new ModelAndView("../guide/guideMap.jsp");
	}
	@RequestMapping("guiding/guider/{userSeqId}")
	public ModelAndView getGuiderPlace (@PathVariable("userSeqId") int userSeqId,MapViewVO vo, Model model ) {
		// TODO Auto-generated method stub
		System.out.println("유저장소(지도형태로) 상세 보기(가이더장소)");
		vo.setUserSeqId(userSeqId);
		List<MapViewVO> placeList = mapViewService.getGuiderPlace(vo);
		model.addAttribute("placeList", placeList);
		return new ModelAndView("../guiderPlace.jsp");
	}
	
}
