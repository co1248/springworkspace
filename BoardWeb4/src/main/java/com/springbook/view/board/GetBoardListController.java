package com.springbook.view.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class GetBoardListController {

	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList(BoardVO vo , BoardDAO boardDAO, ModelAndView mav /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 목록 검색 처리");
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		mav.addObject("boardList", boardList);
		mav.setViewName("getBoardList.jsp");
		return mav;
	}
}