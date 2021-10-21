package com.spring.mau.map.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.map.MapService;
import com.spring.mau.map.MapVO;

@Service("mapService")
public class MapServiceImpl implements MapService {
	@Autowired
	private MapDAO mapDao;
	@Override
	public void insertMap(MapVO vo) {
		// TODO Auto-generated method stub
		mapDao.insertMap(vo);
	}
	public void insertGuideMap(MapVO vo) {
		// TODO Auto-generated method stub
		mapDao.insertGuideMap(vo);
	}
	@Override
	public List<MapVO> getMapList(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getMapList(vo);
	}
	@Override
	public List<MapVO> getguideMapList(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getguideMapList(vo);
	}
	@Override
	public List<MapVO> getguiderMapList(MapVO vo) {
		// TODO Auto-generated method stub
		return mapDao.getguiderMapList(vo);
	}


}
