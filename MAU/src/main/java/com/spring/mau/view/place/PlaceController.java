package com.spring.mau.view.place;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;

@Controller
@SessionAttributes("place")
public class PlaceController {
	@Autowired
	private PlaceService placeService;
	
	@RequestMapping(value="/guideMap/{mapSeq}", method = RequestMethod.POST)
	public void insertPlace (@PathVariable("mapSeq") int mapSeq, PlaceVO vo,HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("장소등록");
	      int placeId = Integer.parseInt(request.getParameter("placeId"));
	      String placeSouthWest = request.getParameter("placeSouthWest");
	      String placeNorthEast = request.getParameter("placeNorthEast");
	      String placeName = request.getParameter("placeName");
	      String placeAddr = request.getParameter("placeAddr");
		vo.setPlaceId(placeId);
		vo.setPlaceSouthWest(placeSouthWest);
		vo.setPlaceNorthEast(placeNorthEast);
		vo.setPlaceName(placeName);
		vo.setPlaceAddr(placeAddr);
		placeService.insertPlace(vo);
	}
	
}
