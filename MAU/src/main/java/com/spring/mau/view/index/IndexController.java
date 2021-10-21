package com.spring.mau.view.index;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;

@Controller
public class IndexController {
	
	@Autowired
	private PlaceService placeService;
	@Autowired
	private MapViewService mapViewService;
	
	@RequestMapping("/index")
	public ModelAndView home(Model model,MapViewVO mapViewVO,PlaceVO placeVO) {
		// TODO Auto-generated method stub
		System.out.println("메인으로");
		
		List<MapViewVO> randomList = mapViewService.getRandomMap(mapViewVO);
		
		ArrayList<Integer> mapSeq = new ArrayList<Integer>();
		for(MapViewVO vo : randomList) {
			int a = vo.getMapSeq();
			mapSeq.add(a);
		}
		Collections.shuffle(mapSeq);
//		System.out.println(mapSeq);

		List<MapViewVO> randomMap = new ArrayList<MapViewVO>();
		
		for(int num : mapSeq) {
			mapViewVO = new MapViewVO();
			System.out.println(num);
			mapViewVO.setMapSeq(num);
			mapViewVO = mapViewService.getBySeq(mapViewVO);
			int cnt = mapViewService.getPlaceCnt(mapViewVO).getPlaceCnt();
			mapViewVO.setPlaceCnt(cnt);
			randomMap.add(mapViewVO);
		}
		
//		for(int i=0;i<randomMap.size();i++) {
//			mapViewVO.setMapSeq(randomMap.get(i).getMapSeq());
//			int count = mapViewService.getMapCount(mapViewVO);
//			
//			model.addAllAttributes("placeCnt"+i,count);
//		}
		model.addAttribute("randomMap", randomMap);
		return new ModelAndView("index.jsp");
	}
}
