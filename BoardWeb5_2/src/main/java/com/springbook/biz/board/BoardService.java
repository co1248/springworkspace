package com.springbook.biz.board;

import java.util.List;

public interface BoardService {
    //글등록
	void insertBoard(BoardVO vo);
	List<BoardVO> getBoardList(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
	void updateBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
}
