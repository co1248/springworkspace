package com.springbook.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.Log4jAdvice;
import com.springbook.biz.common.LogAdvice;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;//의존주입을 해줘야한다
	//private LogAdvice log;
	//private Log4jAdvice log;
	
//	public BoardServiceImpl() {
//		log = new LogAdvice();
//		log = new Log4jAdvice();
//	}

	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		//log.printLog();
		//log.printLogging();
		boardDAO.inserdBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList() {
		// TODO Auto-generated method stub
		//log.printLog();
		//log.printLogging();
		return boardDAO.getBoardList();
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		//log.printLog();
		//log.printLogging();
		return boardDAO.getBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		//log.printLog();
		//log.printLogging();
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		//log.printLog();
		//log.printLogging();
		boardDAO.deleteBoard(vo);
	}
}
