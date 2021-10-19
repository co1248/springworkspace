package com.spring.mau.mapplace.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.mapplace.MapPlaceService;
import com.spring.mau.mapplace.MapPlaceVO;

@Service("mapPlaceService")
public class MapPlaceServiceImpl implements MapPlaceService {

	@Autowired
	private MapPlaceDAO mapPlaceDAO;
	@Override
	public void insertMapPlace(MapPlaceVO vo) {
		// TODO Auto-generated method stub
		mapPlaceDAO.insertMapPlace(vo);
	}

}
