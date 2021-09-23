package com.springbook.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;

@Repository
public class UserDAOMybatis {
	
	@Autowired //의존주입
	private SqlSessionTemplate mybatis;
	
	public UserVO getUser(UserVO vo) {
		System.out.println("===> Mybatis로 getUser() 기능 처리");
		return (UserVO)mybatis.selectOne("UserDAO.getUser", vo);
	}
}
