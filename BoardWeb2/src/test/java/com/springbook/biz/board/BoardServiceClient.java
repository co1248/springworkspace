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
		
//		System.out.println("새로운 글 등록하기.");
//		System.out.println("제 목 : ");
//		vo.setTitle(sc.nextLine());
//		System.out.println("작성자 : ");
//      vo.setWriter(sc.nextLine());
//		System.out.println("내 용 : ");
//		vo.setContent(sc.nextLine());
//		boardService.insertBoard(vo);
		
//		System.out.println("글 수정하기.");
//		System.out.println("번 호 : ");
//		vo.setSeq(sc.nextInt());
//		System.out.println("제 목 : ");
//		sc.nextLine();
//		vo.setTitle(sc.nextLine());
//		System.out.println("내 용 : ");
//		vo.setContent(sc.nextLine());
//		boardService.updateBoard(vo);
		
//		System.out.println("글 삭제하기.");
//		System.out.println("번 호 : ");
//		vo.setSeq(sc.nextInt());
//		boardService.deleteBoard(vo);
		
		System.out.println("조회 글번호 입력");
		System.out.println("번 호 : ");
		vo.setSeq(sc.nextInt());
	    vo = boardService.getBoard(vo);
		System.out.println("--->" + vo.toString());
		
//		List<BoardVO> list = boardService.getBoardList(vo);
//		for(BoardVO vo1 : list) {
//			System.out.println("--->" + vo1.toString());
		factory.close();
//		}
	}
}
