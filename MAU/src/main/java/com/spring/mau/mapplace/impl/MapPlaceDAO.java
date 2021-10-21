package com.spring.mau.mapplace.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.mapplace.MapPlaceVO;

@Repository
public class MapPlaceDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMapPlace(MapPlaceVO vo) {
		System.out.println("MapPlaceDAO==>insertMapPlace 실행");
		mybatis.insert("MapPlaceDAO.insertMapPlace", vo);
	}
}
