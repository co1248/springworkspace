package com.springbook.biz.board;

import java.util.List;
import java.util.Scanner;

import com.springbook.biz.board.impl.BoardDAO;

public class BoardServiceClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BoardDAO boardDAO = new BoardDAO();
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
				boardDAO.insertBoard(vo);
			} else if(select == 2) {
				vo.setSearchCondition("TITLE");
				vo.setSearchKeyword("");
				List<BoardVO> boardList = boardDAO.getBoardList(vo);
				for(BoardVO board :  boardList) {
					System.out.println(">>" + board.toString());
				}
			} else if(select == 3) {
				System.out.print("조회 글번호 입력 : ");
			    vo.setSeq(sc.nextInt());
			    vo = boardDAO.getBoard(vo);
			    System.out.println(vo.toString());
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
				
				boardDAO.updateBoard(vo);
			} else if(select == 5) {
				System.out.print("삭제 글번호 입력 : ");
			    vo.setSeq(sc.nextInt());
			    boardDAO.deleteBoard(vo);
			} else if(select == 6) {
				run = false;
			}
		}
		System.out.println("프로그램 종료"); 
	}
}