package com.springbook.biz.member.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.member.MemberVO;

@Repository("memberDAO")
public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//글등록
	public void insertUser(MemberVO vo) {
		System.out.println("inserdUser() 기능처리");

        try{ 
        	conn = JDBCUtil.getConnection();
            String sql = "insert into users values(?, ?, ?, ?)";         
            stmt = conn.prepareStatement(sql); 
            stmt.setString(1, vo.getId()); 
            stmt.setString(2, vo.getPassword()); 
            stmt.setString(3, vo.getName());
            stmt.setString(4, vo.getRole()); 
            stmt.executeUpdate(); 
        }catch(Exception e){ 
        	e.printStackTrace();
        }finally{ 
        	JDBCUtil.close(stmt, conn);
        } 
	}
}
