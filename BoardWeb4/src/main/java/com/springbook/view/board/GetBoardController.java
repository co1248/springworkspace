package com.springbook.view.board;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;

@Controller
public class GetBoardController {

	@RequestMapping("/getBoard.do")
	public ModelAndView getBoard(BoardVO vo , BoardDAO boardDAO, ModelAndView mav /*command object*/) {
		// TODO Auto-generated method stub
		System.out.println("글 상세 조회 처리");
		BoardVO board = boardDAO.getBoard(vo);
		mav.addObject("board", board);
		mav.setViewName("getBoard.jsp");
		return mav;
	}
}