package com.spring.mau.userplace.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.userplace.UserPlaceVO;

@Repository
public class UserPlaceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertUserPlace(UserPlaceVO vo) {
		System.out.println("UserPlaceDAO==>insertUserPlacee 실행");
		mybatis.insert("UserPlaceDAO.insertUserPlace", vo);
		mybatis.commit();
	}
}
