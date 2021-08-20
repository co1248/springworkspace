package com.springbook.biz.board;

import java.util.Scanner;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		
		BoardService boardService = (BoardService)factory.getBean("boardService");
		BoardVO vo = new BoardVO();
		Scanner sc = new Scanner(System.in);
		System.out.println("제목을 입력하세요.");
		vo.setTitle(sc.nextLine());
		System.out.println("작성자를 입력하세요.");
        vo.setWriter(sc.nextLine());
		System.out.println("내용을 입력하세요.");
		vo.setContent(sc.nextLine());
		boardService.insertBoard(vo);
		
		factory.close();
	}
}
