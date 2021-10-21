package com.spring.mau.map.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.map.MapVO;

@Repository
public class MapDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMap(MapVO vo) {
		System.out.println("가이더맵(개인테마) 생성");
		mybatis.insert("MapDAO.insertMap",vo);
	}
	public void insertGuideMap(MapVO vo) {
		System.out.println("가이드맵(테마) 생성");
		mybatis.insert("MapDAO.insertGuideMap",vo);
	}
	public List<MapVO> getMapList(MapVO vo) {
		System.out.println("모든타입의맵 가져오기");
		return mybatis.selectList("MapDAO.getMapList", vo);
	}
	public List<MapVO> getguideMapList(MapVO vo) {
		System.out.println("가이드맵(테마지도) 가져오기");
		return mybatis.selectList("MapDAO.getguideMapList", vo);
	}
	public List<MapVO> getguiderMapList(MapVO vo) {
		System.out.println("가이더맵(개인테마지도) 가져오기");
		return mybatis.selectList("MapDAO.getguiderMapList", vo);
	}
}
