package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.JDBCUtil;

@Repository("boardDAO")
public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//글등록
	public void inserdBoard(BoardVO vo) {
		System.out.println("inserdBoard() 기능처리");

        try{ 
        	conn = JDBCUtil.getConnection();
            String sql = "insert into board1(seq, title, writer, content) values((select nvl(max(seq), 0) + 1 from board1), ?, ?, ?)"; //NVL(max(seq), 0) --max(seq)이 null 이면 "0"         
            stmt = conn.prepareStatement(sql); 
            stmt.setString(1, vo.getTitle()); 
            stmt.setString(2, vo.getWriter()); 
            stmt.setString(3, vo.getContent()); 
            stmt.executeUpdate(); 
        }catch(Exception e){ 
        	e.printStackTrace();
        }finally{ 
        	JDBCUtil.close(stmt, conn);
        } 
	}
}
