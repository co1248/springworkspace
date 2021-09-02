package com.springbook.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.board.impl.BoardDAO;
import com.springbook.biz.user.UserVO;
import com.springbook.biz.user.impl.UserDAO;

import oracle.net.aso.e;

//@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping handlerMapping;
	private ViewResolver viewResolver;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		handlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./");
		viewResolver.setSuffix(".jsp");
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/"));
		
		System.out.println(path);
		
		Controller ctrl = handlerMapping.getController(path);
		String viewName = ctrl.handleRequest(request, response);
		
		String view = null;
		if(!viewName.contains(".do")) {
			view = viewResolver.getView(viewName);
		} else {
			view = viewName;
		}
		
		response.sendRedirect(view);
		
		
//		if(path.equals("/login.do")) {
//			System.out.println("濡쒓렇�씤泥섎━");
//			
//			String id = request.getParameter("id");
//			String password = request.getParameter("password");
//			
//			UserVO vo = new UserVO();
//			vo.setId(id);
//			vo.setPassword(password);
//			UserDAO userDAO = new UserDAO();
//			UserVO user = userDAO.getUser(vo);
//			
//			if(user != null) {
//				response.sendRedirect("getBoardList.do");
//			} else {
//				response.sendRedirect("login.jsp");
//			}
//			
//		} else if(path.equals("/getBoardList.do")) {
//			System.out.println("湲� 紐⑸줉 寃��깋 泥섎━");
//			
//			BoardVO vo = new BoardVO();
//			BoardDAO boardDAO = new BoardDAO();
//			List<BoardVO> boardList = boardDAO.getBoardList(vo);
//			
//			HttpSession session = request.getSession();
//			session.setAttribute("boardList", boardList);
//			response.sendRedirect("getBoardList.jsp");
//			
//		}  else if(path.equals("/getBoard.do")) {
//			System.out.println("湲� �긽�꽭 議고쉶 泥섎━");
//			String seq = request.getParameter("seq");
//			
//			BoardVO vo = new BoardVO();
//			vo.setSeq(Integer.parseInt(seq));
//			BoardDAO boardDAO = new BoardDAO();
//			BoardVO board = boardDAO.getBoard(vo);
//			
//			HttpSession session = request.getSession();
//			session.setAttribute("board", board);
//			response.sendRedirect("getBoard.jsp");
//		}  else if(path.equals("/insertBoard.do")) {
//			System.out.println("湲� �벑濡� 泥섎━");
//			
//			String title = request.getParameter("title");
//			String writer = request.getParameter("writer");
//			String content = request.getParameter("content");
//			BoardVO vo = new BoardVO();
//			vo.setTitle(title);
//			vo.setWriter(writer);
//			vo.setContent(content);
//			BoardDAO boardDAO = new BoardDAO();
//			boardDAO.insertBoard(vo);
//			response.sendRedirect("getBoardList.do");
//		}  else if(path.equals("/updateBoard.do")) {
//			System.out.println("湲� �닔�젙 泥섎━");
//			
//			String seq = request.getParameter("seq");
//		    String title = request.getParameter("title");
//			String content = request.getParameter("content");
//			BoardVO vo = new BoardVO();
//			vo.setTitle(title);
//			vo.setContent(content);
//			vo.setSeq(Integer.parseInt(seq));
//			BoardDAO boardDAO = new BoardDAO();
//			boardDAO.updateBoard(vo);
//			response.sendRedirect("getBoardList.do");
//		}  else if(path.equals("/deleteBoard.do")) {
//			System.out.println("湲� �궘�젣 泥섎━");
//			
//			String seq = request.getParameter("seq");
//			BoardVO vo = new BoardVO();
//			vo.setSeq(Integer.parseInt(seq));
//			BoardDAO boardDAO = new BoardDAO();
//			boardDAO.deleteBoard(vo);
//			response.sendRedirect("getBoardList.do");
//		}  else if(path.equals("/logout.do")) {
//			System.out.println("濡쒓렇�븘�썐 泥섎━");
//			HttpSession session = request.getSession();
//		    session.invalidate();
//		    response.sendRedirect("login.jsp");
//		}
	}
}