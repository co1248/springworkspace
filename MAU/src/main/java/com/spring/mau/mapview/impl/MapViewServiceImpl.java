package com.spring.mau.mapview.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.mapview.MapViewService;
import com.spring.mau.mapview.MapViewVO;

@Service("mapViewService")
public class MapViewServiceImpl implements MapViewService {

	@Autowired
	private MapViewDAO mapViewDAO;
	@Override
	public List<MapViewVO> getMap(MapViewVO vo) {
		// TODO Auto-generated method stub
		return mapViewDAO.getMap(vo);
	}
	@Override
	public List<MapViewVO> getMapSeq(MapViewVO vo) {
		// TODO Auto-generated method stub
		return mapViewDAO.getMapSeq(vo);
	}
	@Override
	public List<MapViewVO> getRandomMap(MapViewVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapViewDAO.getRandomMap(vo);
	}
	@Override
	public List<MapViewVO> getGuiderPlace(MapViewVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapViewDAO.getGuiderPlace(vo);
	}
	@Override
	public MapViewVO getBySeq(MapViewVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapViewDAO.getBySeq(vo);
	}
	@Override
	public MapViewVO getPlaceCnt(MapViewVO vo) {
		// TODO 자동 생성된 메소드 스텁
		return mapViewDAO.getPlaceCnt(vo);
	}


}
