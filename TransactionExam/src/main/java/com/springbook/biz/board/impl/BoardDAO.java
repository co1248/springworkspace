package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.JDBCUtil;

@Repository("boardDAO")
public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//글추가
	public void inserdBoard(BoardVO vo) {
		System.out.println("===> JDBC로 inserdBoard() 기능 처리");

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
	//전체글조회
	public List<BoardVO> getBoardList() {
		System.out.println("===> JDBC로getBoardList() 기능 처리");
		List<BoardVO> list = new ArrayList<BoardVO>();
		
        try{ 
        	conn = JDBCUtil.getConnection();
        	stmt = conn.prepareStatement("select * from board1 order by seq desc");         
            rs = stmt.executeQuery();
            
            while(rs.next()) {
            	BoardVO vo =  new BoardVO();
            	vo.setSeq(rs.getInt("seq"));
            	vo.setTitle(rs.getString("title"));
            	vo.setWriter(rs.getString("writer"));
            	vo.setContent(rs.getString("content"));
            	vo.setRegDate(rs.getDate("regdate"));
            	vo.setCnt(rs.getInt("cnt"));
            	list.add(vo);
            }
        }catch(Exception e){ 
        	e.printStackTrace();
        }finally{ 
        	JDBCUtil.close(rs, stmt, conn);
        }
        return list;
	}
	//특정글조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		
        try{ 
        	conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement("select * from board1 where seq = ?");
            stmt.setInt(1, vo.getSeq());
            rs = stmt.executeQuery();
            
            if(rs.next()) {
            	vo =  new BoardVO();
            	vo.setSeq(rs.getInt("seq"));
            	vo.setTitle(rs.getString("title"));
            	vo.setWriter(rs.getString("writer"));
            	vo.setContent(rs.getString("content"));
            	vo.setRegDate(rs.getDate("regdate"));
            	vo.setCnt(rs.getInt("cnt"));
            }
        }catch(Exception e){ 
        	e.printStackTrace();
        }finally{ 
        	JDBCUtil.close(rs, stmt, conn);
        }
        return vo;
	}
	//글정보수정
		public void updateBoard(BoardVO vo) {
			System.out.println("===> JDBC로 updateBoard() 기능 처리");

	        try{ 
	        	conn = JDBCUtil.getConnection();
	            stmt = conn.prepareStatement("update board1 set title = ?, content = ? where seq = ?"); 
	            stmt.setString(1, vo.getTitle()); 
	            stmt.setString(2, vo.getContent()); 
	            stmt.setInt(3, vo.getSeq());
	            stmt.executeUpdate(); 
	        }catch(Exception e){ 
	        	e.printStackTrace();
	        }finally{ 
	        	JDBCUtil.close(stmt, conn);
	        } 
		}
		//글삭제
		public void deleteBoard(BoardVO vo) {
			System.out.println("===> JDBC로 deleteBoard() 기능 처리");

	        try{ 
	        	conn = JDBCUtil.getConnection();
	            stmt = conn.prepareStatement("delete board1 where seq = ?"); 
	            stmt.setInt(1, vo.getSeq());
	            stmt.executeUpdate(); 
	        }catch(Exception e){ 
	        	e.printStackTrace();
	        }finally{ 
	        	JDBCUtil.close(stmt, conn);
	        } 
		}
}
