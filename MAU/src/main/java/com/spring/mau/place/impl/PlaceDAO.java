package com.spring.mau.place.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.place.PlaceVO;

@Repository
public class PlaceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPlace(PlaceVO vo) {
		System.out.println("PlaceDAO==>insertPlace 실행");
		mybatis.insert("PlaceDAO.insertPlace", vo);
		mybatis.commit();
	}
}
