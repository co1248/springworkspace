package com.spring.mau.userplace.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mau.userplace.UserPlaceService;
import com.spring.mau.userplace.UserPlaceVO;

@Service("userPlaceService")
public class UserPlaceServiceImpl implements UserPlaceService {

	@Autowired
	private UserPlaceDAO userPlaceDAO;
	@Override
	public void insertUserPlace(UserPlaceVO vo) {
		// TODO Auto-generated method stub
		userPlaceDAO.insertUserPlace(vo);
	}

}