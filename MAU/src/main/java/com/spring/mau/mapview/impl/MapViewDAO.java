package com.spring.mau.mapview.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mau.mapview.MapViewVO;

@Repository
public class MapViewDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MapViewVO> getMap(MapViewVO vo) {
		System.out.println("MapViewDAO==>getMap 실행");
		return mybatis.selectList("MapViewDAO.getMapView",vo);
	}
	public List<MapViewVO> getMapSeq(MapViewVO vo) {
		System.out.println("MapViewDAO==>getMapSeq 실행");
		return mybatis.selectList("MapViewDAO.getMapSeq",vo);
	}

}