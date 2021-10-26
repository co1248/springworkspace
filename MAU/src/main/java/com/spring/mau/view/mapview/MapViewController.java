package com.spring.mau.view.mapview;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;
import com.spring.mau.mapfavorite.MapFavoriteService;
import com.spring.mau.mapfavorite.MapFavoriteVO;
import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;
import com.spring.mau.user.UserVO;

@Controller
@SessionAttributes("mapView")
public class MapViewController {
	@Autowired
	private MapViewService mapViewService;
	@Autowired
	private MapService mapService;
	
	@Autowired
	private MapFavoriteService mapFavoriteService;
	@RequestMapping("/guiderMap/{mapSeq}")
	public ModelAndView getGuiderMap (@PathVariable("mapSeq") int mapSeq,HttpSession session, MapFavoriteVO favorite,MapViewVO vo, Model model ) {
		// TODO Auto-generated method stub
		System.out.println("개인지도 상세 보기(가이더지도)");
		vo.setMapSeq(mapSeq);
		MapFavoriteVO chk=null;
		List<MapViewVO> placeList = mapViewService.getMap(vo);
		favorite.setMapSeq(mapSeq);
		MapVO mapFavorite = mapFavoriteService.getFavoriteUserSeqId(favorite);
		
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user!=null) {
			favorite.setUserSeqId(user.getUserSeqId());
			chk =mapFavoriteService.getMapFavorite(favorite);
			model.addAttribute("placeList", placeList);
			model.addAttribute("chk",chk);
			model.addAttribute("mapFavorite",mapFavorite);
			model.addAttribute("placeList", placeList);
			return new ModelAndView("../guider/guiderMap.jsp");
		}else {
			model.addAttribute("mapFavorite",mapFavorite);
			model.addAttribute("placeList", placeList);
			return new ModelAndView("../guider/guiderMap.jsp");
		}
		
	}
	@RequestMapping("/guideMap/{mapSeq}")
	public ModelAndView getGuideMap (@PathVariable("mapSeq") int mapSeq,HttpSession session,MapViewVO vo,MapVO vo2, MapFavoriteVO favorite, Model model ) {
		// TODO Auto-generated method stub
		System.out.println("테마지도 상세 보기(가이드지도)");
		vo.setMapSeq(mapSeq);
		MapFavoriteVO chk=null;
		List<MapViewVO> placeList = mapViewService.getMap(vo);
		MapVO placegetMap = mapService.getMap(vo2);
		model.addAttribute("placegetMap", placegetMap);
		favorite.setMapSeq(mapSeq);
		MapVO mapFavorite = mapFavoriteService.getFavoriteUserSeqId(favorite);
		
		UserVO user = (UserVO)session.getAttribute("loginUser");
		if(user!=null) {
			favorite.setUserSeqId(user.getUserSeqId());
		chk =mapFavoriteService.getMapFavorite(favorite);
		model.addAttribute("placeList", placeList);
		model.addAttribute("chk",chk);
		model.addAttribute("mapFavorite",mapFavorite);
		model.addAttribute("placeList", placeList);
		}else {
			model.addAttribute("chk",chk);
			model.addAttribute("mapFavorite",mapFavorite);
			model.addAttribute("placeList", placeList);
		}
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
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public ModelAndView search(HttpServletRequest request,MapViewVO vo,MapVO vo2, Model model,HttpSession session) {
		// TODO Auto-generated method stub
		System.out.println("검색");
		String search = request.getParameter("search");
		vo2.setSearch(search);
		System.out.println(search);
		String a = "전체";
		List<MapVO> searchMap = mapService.searchMap(vo2);
		for(MapVO vo3 : searchMap) {
			vo3.setSearch(search);
			vo3.setSearchKategory(a);
			int cnt = mapService.getPlaceCnt(vo3).getPlaceCnt();
			vo3.setPlaceCnt(cnt);
		}
		
		session.setAttribute("search", search);
		session.setAttribute("kategory", a);
		session.setAttribute("searchList", searchMap);
		model.addAttribute("searchMap", searchMap);
		return new ModelAndView("/index/searchAll.jsp");
	}
	
	@RequestMapping(value={"/searchCategory/{searchkeyword}/{search}"},method=RequestMethod.GET)
	public ModelAndView searchCategory(@PathVariable("searchkeyword")String searchkeyword,@PathVariable("search")String search,HttpServletRequest request,MapViewVO vo,MapVO vo2, Model model,HttpSession session) {
		// TODO Auto-generated method stub
		System.out.println("검색");
		System.out.println(search);
		System.out.println(searchkeyword);
		if(searchkeyword.equals("전체")) {
			searchkeyword = "";
		}
		vo2.setSearch(search);
		vo2.setSearchKategory(searchkeyword);
		List<MapVO> searchMap2 = mapService.searchMapCategory(vo2);
		
		for(MapVO vo3 : searchMap2) {
			vo3.setSearch(search);
			int cnt = mapService.getPlaceCnt(vo3).getPlaceCnt();
			vo3.setPlaceCnt(cnt);
			if(searchkeyword.equals("")) {
				searchkeyword = "전체";
				vo3.setSearchKategory(searchkeyword);
			}
		}
		session.setAttribute("searchList", searchMap2);
		session.setAttribute("kategory", searchkeyword);
		model.addAttribute("searchMap", searchMap2);
		return new ModelAndView("/index/searchKategory.jsp");
	}
	
}
