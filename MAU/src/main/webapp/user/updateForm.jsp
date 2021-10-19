<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" align="center">
	<h1>정보 수정</h1>
	<form action="${pageContext.request.contextPath}/update" method="post" name="frm">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userId" value="${userInfo.userId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="userSeqId" value="${userInfo.userSeqId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="userNickName" value="${userInfo.userNickName}" readonly="readonly"></td>
			</tr>
			
			<tr>
				<th>내 소개</th>
				<td><textarea rows="15" cols="100" name="userInform">${userInfo.userInform}</textarea> </td>
			</tr>
			
			<tr>
				<th>아이콘</th>
				<td><input type="text" name="userIcon" size="40" placeholder="입력칸에 우클릭으로 이모지를 선택하세요" value="${userInfo.userIcon}"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="확인">
		<input type="reset" value="취소" onclick="location.href='${pageContext.request.contextPath}/index'">
	</form>
</div>
</body>
</html>