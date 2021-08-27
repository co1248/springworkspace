package com.springbook.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.user.UserVO;


@Repository("userDAO")
public class UserDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//회원정보조회
	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		System.out.println("getUser() 기능처리");
        String USER_GET = "select * from users where id = ? and password = ?";    
        try{ 
        	conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(USER_GET); 
            stmt.setString(1, vo.getId()); 
            stmt.setString(2, vo.getPassword()); 
            rs = stmt.executeQuery();
            
            if(rs.next()) {
            	user =  new UserVO();
            	user.setId(rs.getString("id"));
            	user.setPassword(rs.getString("password"));
            	user.setName(rs.getString("name"));
            	user.setRole(rs.getString("role"));
            }
        }catch(Exception e){ 
        	e.printStackTrace();
        }finally{ 
        	JDBCUtil.close(rs, stmt, conn);
        }
        return user;
	}
	
//	public void insertUser(UserVO vo) {
//		System.out.println("inserdUser() 기능처리");
//
//        try{ 
//        	conn = JDBCUtil.getConnection();
//            String sql = "insert into users values(?, ?, ?, ?)";         
//            stmt = conn.prepareStatement(sql); 
//            stmt.setString(1, vo.getId()); 
//            stmt.setString(2, vo.getPassword()); 
//            stmt.setString(3, vo.getName());
//            stmt.setString(4, vo.getRole()); 
//            stmt.executeUpdate(); 
//        }catch(Exception e){ 
//        	e.printStackTrace();
//        }finally{ 
//        	JDBCUtil.close(stmt, conn);
//        } 
//	}
}
