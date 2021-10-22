package com.spring.mau.view.place;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.mapplace.MapPlaceService;
import com.spring.mau.mapplace.MapPlaceVO;
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;
import com.spring.mau.userplace.UserPlaceService;
import com.spring.mau.userplace.UserPlaceVO;

@Controller
@SessionAttributes("place")
public class PlaceController {
	@Autowired
	private PlaceService placeService;
	@Autowired
	private UserPlaceService userPlaceService;
	@Autowired
	private MapPlaceService mapPlaceService;
	@Autowired
	private MapViewService mapViewService;
	
	@RequestMapping(value="/guideMap/{mapSeq}", method = RequestMethod.POST)
	public void insertPlace (@PathVariable("mapSeq") int mapSeq, PlaceVO vo, UserPlaceVO vo2, MapPlaceVO vo3, HttpServletRequest request, HttpServletResponse response) {
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
		PlaceVO plId = placeService.getPlaceId(vo);
		PlaceVO plSeq;
		if(plId == null) {//새로운 장소등록
			placeService.insertPlace(vo);
			plSeq = placeService.getPlaceSeq(vo);//새로 만들어진 장소의 시퀀스 값(placeSeq) 가져오기
		} else {//이미있는 장소등록은 insertPlace하지 않는다.
			plSeq = placeService.getPlaceId(vo);
		}
		System.out.println("유저-장소등록");
		vo2.setPlaceSeq(plSeq.getPlaceSeq());
		vo2.setMapSeq(mapSeq);
		HttpSession session = request.getSession();
		int userSeqId = (Integer)session.getAttribute("userSeqId");
		vo2.setUserSeqId(userSeqId);
		userPlaceService.insertUserPlace(vo2);
		
		System.out.println("맵-장소등록");
		vo3.setPlaceSeq(plSeq.getPlaceSeq());
		vo3.setMapSeq(mapSeq);
		mapPlaceService.insertMapPlace(vo3);
		try {
			response.sendRedirect(mapSeq + "");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/guideMap/search/{mapSeq}", method = RequestMethod.POST)
	public ModelAndView searchPlace (@PathVariable("mapSeq") int mapSeq, PlaceVO vo,MapViewVO vo2,HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		System.out.println("장소검색");
		String keyword = request.getParameter("keyword");
		request.setAttribute("keyword", keyword);
		
		vo2.setMapSeq(mapSeq);
		MapViewVO map = mapViewService.getBySeq(vo2);
		model.addAttribute("map", map);
		
		return new ModelAndView("/guide/searchplace.jsp");
	}
	
	@RequestMapping("myfavorite")
	public ModelAndView getFavoritePlace (PlaceVO vo,MapViewVO vo2, Model model, HttpSession session, HttpServletRequest request ) {
		// TODO Auto-generated method stub
		System.out.println("장소즐겨찾기(지도형태로) 상세 보기");
		session = request.getSession();
		int userSeqId = (Integer)session.getAttribute("userSeqId");
		System.out.println(userSeqId);
		/*
		 * vo2.setUserSeqId(userSeqId); List<MapViewVO> placeList =
		 * placeService.getfavoritePlaceSeq(vo2); model.addAttribute("placeList",
		 * placeList);
		 */
		return new ModelAndView("../myavorite.jsp");
	}

	
}
