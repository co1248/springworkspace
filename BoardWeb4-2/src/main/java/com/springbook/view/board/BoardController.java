package com.springbook.view.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	
	@Autowired
	private BoardService boardService; //BoardServiceImpl
	
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println("글 등록 처리");
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println("글 수정 처리");
		//System.out.println("작성자 이름 :" + vo.getWriter());
		boardService.updateBoard(vo);
		return "redirect:getBoardList.do";
	}

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CoNTENT");
		return conditionMap;
	}
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		// TODO Auto-generated method stub
		System.out.println("글 목록 보기");
		model.addAttribute("boardList", boardService.getBoardList(vo));
		return "getBoardList.jsp";
	}

	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		// TODO Auto-generated method stub
		System.out.println("글 상세 보기");
		model.addAttribute("board", boardService.getBoard(vo)); //이 보드가 세션어트리튜트에 저장됨
		return "getBoard.jsp";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		System.out.println("글 삭제 처리");
		boardService.deleteBoard(vo);
		return "redirect:getBoardList.do";
	}
}