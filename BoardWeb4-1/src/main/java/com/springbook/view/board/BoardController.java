package com.springbook.view.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(BoardVO vo , BoardDAO boardDAO /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 등록 처리");
		boardDAO.insertBoard(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo , BoardDAO boardDAO /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 수정 처리");
		System.out.println("작성자 이름 :" + vo.getWriter());
		boardDAO.updateBoard(vo);
		return "redirect:getBoardList.do";
	}
//	@RequestMapping("/updateBoard.do")
//	public String updateBoard(@ModelAttribute("board")BoardVO vo , BoardDAO boardDAO /*command object*/) {
//		// TODO Auto-generated method stub
//		System.out.println("글 수정 처리");
//		System.out.println("번호 :" + vo.getSeq());
//		System.out.println("제목 :" + vo.getTitle());
//		System.out.println("작성자 :" + vo.getWriter());
//		System.out.println("내용 :" + vo.getContent());
//		System.out.println("등록일 :" + vo.getRegDate());
//		System.out.println("조회수 :" + vo.getCnt());
//		boardDAO.updateBoard(vo);
//		return "redirect:getBoardList.do";
//	}
	
//	@RequestMapping("/getBoardList.do")
//	public ModelAndView getBoardList(BoardVO vo , BoardDAO boardDAO, ModelAndView mav /*command object*/) {
//		// TODO Auto-generated method stub
//		System.out.println("글 목록 보기");
//		List<BoardVO> boardList = boardDAO.getBoardList(vo);
//		mav.addObject("boardList", boardList);
//		mav.setViewName("getBoardList.jsp");
//		return mav;
//	}
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CoNTENT");
		return conditionMap;
	}
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo , BoardDAO boardDAO, Model model /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 목록 보기");
		model.addAttribute("boardList", boardDAO.getBoardList(vo));
		return "getBoardList.jsp";
	}
//	@RequestMapping("/getBoardList.do")
//	public String getBoardList(@RequestParam(value="searchCondition",defaultValue="TITLE",required=false)String condition, @RequestParam(value="searchKeyword",defaultValue="",required=false)String keyword, BoardDAO boardDAO, Model model) {
//		// TODO Auto-generated method stub
//		System.out.println("검색 조건 : " + condition);
//		System.out.println("검색 단어 : " + keyword);
//		//model.addAttribute("boardList", boardDAO.getBoardList(vo));
//		return "getBoardList.jsp";
//	}
	
//	@RequestMapping("/getBoard.do")
//	public ModelAndView getBoard(BoardVO vo , BoardDAO boardDAO, ModelAndView mav /*command object*/) {
//		// TODO Auto-generated method stub
//		System.out.println("글 상세 보기");
//		BoardVO board = boardDAO.getBoard(vo);
//		mav.addObject("board", board);
//		mav.setViewName("getBoard.jsp");
//		return mav;
//	}
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo , BoardDAO boardDAO, Model model /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 상세 보기");
		model.addAttribute("board", boardDAO.getBoard(vo)); //이 보드가 세션어트리튜트에 저장됨
		return "getBoard.jsp";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo , BoardDAO boardDAO /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 삭제 처리");
		boardDAO.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}
}