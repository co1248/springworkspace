package com.springbook.biz.board;

import java.util.List;

public interface BoardService {
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList();
	BoardVO getBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
}
