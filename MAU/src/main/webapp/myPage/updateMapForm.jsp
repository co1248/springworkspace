<%@page import="com.spring.mau.map.MapVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%MapVO mapInfo = (MapVO)request.getAttribute("mapInfo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<form action="${pageContext.request.contextPath}/mapUpdate/<%=mapInfo.getMapSeq() %>" method="post">
<input name="mapName" value="<%=mapInfo.getMapName()%>">
<input type="submit" value = "수정">
</form>
</div>
</body>
</html>