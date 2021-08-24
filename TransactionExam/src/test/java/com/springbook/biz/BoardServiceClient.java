package com.springbook.biz;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.springbook.biz.board.BoardService;
import com.springbook.biz.board.BoardVO;

public class BoardServiceClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		
		BoardService boardService = (BoardService)factory.getBean("boardService");
		BoardVO vo = new BoardVO();
		Scanner sc = new Scanner(System.in);
		boolean run = true;
	    int select = 0;
		while(run) {
			System.out.println("1.글추가 2.전체글조회 3.특정글조회 4.글정보수정 5.글삭제 6.프로그램종료");
			System.out.print("메뉴 선택 >>");
			select = sc.nextInt();
			if(select == 1) {
				System.out.println("등록할 글 정보를 입력하세요.");
				System.out.print("글제목 : ");
				sc.nextLine();
				vo.setTitle(sc.nextLine());
				System.out.print("작성자 : ");
				vo.setWriter(sc.nextLine());
				System.out.print("글내용 : ");
				vo.setContent(sc.nextLine());
				boardService.insertBoard(vo);
			} else if(select == 2) {
				List<BoardVO> list = boardService.getBoardList();
				for(BoardVO vo1 : list) {
					System.out.println("--->" + vo1.toString());
				}
			} else if(select == 3) {
				System.out.print("조회 글번호 입력 : ");
			    vo.setSeq(sc.nextInt());
			    vo = boardService.getBoard(vo);
			    System.out.println("--->" + vo.toString());
			} else if(select == 4) {
				System.out.print("수정 글번호 입력 : ");
			    vo.setSeq(sc.nextInt());
			    System.out.print("글제목 : ");
			    sc.nextLine();
			    String title = sc.nextLine();
				vo.setTitle(title);
				System.out.print("글내용 : ");
				String content = sc.nextLine();
				vo.setContent(content);
				
				boardService.updateBoard(vo);
				List<BoardVO> list = boardService.getBoardList();
				for(BoardVO vo1 : list) {
					System.out.println(vo1.toString());
				}
			} else if(select == 5) {
				System.out.print("삭제 글번호 입력 : ");
			    vo.setSeq(sc.nextInt());
				boardService.deleteBoard(vo);
				List<BoardVO> list = boardService.getBoardList();
				for(BoardVO vo1 : list) {
					System.out.println(vo1.toString());
				}
			} else if(select == 6) {
				run = false;
			}
		}
		System.out.println("프로그램 종료"); 
		factory.close();
	}
}
