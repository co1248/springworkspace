package com.springbook.biz.member.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbook.biz.member.MemberService;
import com.springbook.biz.member.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void insertUser(MemberVO vo) {
		// TODO Auto-generated method stub
		memberDAO.insertUser(vo);
	}
}
