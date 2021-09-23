package com.springbook.biz.user.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.springbook.biz.user.UserVO;


@Repository
public class UserDAOSpring {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String USER_GET = "select * from users where id = ? and password = ?";

	public UserVO getUser(UserVO vo) {
		UserVO user = null;
		System.out.println("getUser() 기능처리");
        Object[] args = { vo.getId() , vo.getPassword()};
        return jdbcTemplate.queryForObject(USER_GET, args, new UserRowMapper());
	}
}
