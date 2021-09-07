<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.springbook.biz.board.BoardVO" %>
<%@ page import = "com.springbook.biz.board.impl.BoardDAO" %>
<%@ page import = "java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%
//BoardVO vo = new BoardVO();
//BoardDAO boardDAO = new BoardDAO();
//List<BoardVO> boardList = boardDAO.getBoardList(vo);
//List<BoardVO> boardList = (List)session.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <center>
        <h1>글목록</h1>
        <h3>
                      테스트님 환영합니다...<a href = "logout.do">Log-out</a>
        </h3>
        
        <!-- 검색 시작 -->
        <form action = "getBoardList.do" method = "post">
            <table border = "1" cellpadding = "0" cellspacing = "0" width = "700">
                <tr>
                    <td align = "right"><select name = "searchCondition">
                        <option value = "TITLE">제목
                        <option value = "CONTENT">내용
                    </select><input name = "searchKeyword" type = "text" /><input type = "submit" value = "검색" /></td>
            </table>
        </form>
        
         <table border = "1" cellpadding = "0" cellspacing = "0" width = "700">
             <tr>
                 <th bgcolor = "orange" width = "100">번호</th>
                 <th bgcolor = "orange" width = "100">제목</th>
                 <th bgcolor = "orange" width = "100">작성자</th>
                 <th bgcolor = "orange" width = "100">등록일</th>
                 <th bgcolor = "orange" width = "100">조회수</th>
             </tr>
             <c:forEach var = "board" items = "${boardList}"  >
             <tr>
                 <td>${board.seq}</td>
                 <td><a href = "getBoard.do?seq=${board.seq}">
                     ${board.title}
                 </a></td>
                 <td>${board.writer}</td>
                 <td>${board.regDate}</td>
                 <td>${board.cnt}</td>            
             </tr>
             </c:forEach>
         </table>
         <a href = "insertBoard.jsp">새글 등록</a>
    </center>
</body>
</html>