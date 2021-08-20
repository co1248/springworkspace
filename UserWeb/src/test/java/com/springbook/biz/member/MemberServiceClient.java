package com.springbook.biz.member;

import java.util.Scanner;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MemberServiceClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		MemberService memberService = (MemberService)factory.getBean("memberService");
		MemberVO vo = new MemberVO();
		Scanner sc = new Scanner(System.in);
		System.out.println("아이디를 입력하세요.");
		vo.setId(sc.nextLine());
		System.out.println("비밀번호를 입력하세요.");
        vo.setPassword(sc.nextLine());
		System.out.println("이름을 입력하세요.");
		vo.setName(sc.nextLine());
		System.out.println("역활을 입력하세요.");
		vo.setRole(sc.nextLine());
		memberService.insertUser(vo);
		
		factory.close();
	}

}
