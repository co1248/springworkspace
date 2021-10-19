package com.spring.mau.place.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.place.PlaceService;
import com.spring.mau.place.PlaceVO;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceDAO placeDAO;
	@Override
	public void insertPlace(PlaceVO vo) {
		// TODO Auto-generated method stub
		placeDAO.insertPlace(vo);
	}

}
