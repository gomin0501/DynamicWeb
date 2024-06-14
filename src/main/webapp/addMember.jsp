<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="form" method="post" action="memberProcess.jsp">
		<h2>회원 가입 등록 화면</h2>
	<table border="1">
	    <tr>
	      <th>아이디</th>
	      <td ><input type="text" name="id" id="id"></td>
	    </tr>
	    <tr>
	      <th>성 명</th>
	      <td ><input type="text" name="name" id="name"></td>
	    </tr>
	    <tr>
	      <th>비밀번호</th>
	      <td ><input type="password" name="ps" class="ps" id="ps"></td>
	    </tr>
	    <tr>
	      <th>비밀번호 확인</th>
	      <td ><input type="password" name="psCheck" class="ps" id="pscheck"></td>
	    </tr>
	    <tr>
	      <th>성 별</th>
	      <td ><input type="radio" name="gender" value="남성" checked>남성
	      <input type="radio" name="gender" value="여성">여성</td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td ><input type="text" name="emailId" placeholder="이메일" id="email">
	      @
	      	<select name="email" class="drop">
	      		<option value="naver.com">naver.com</option>
	      		<option value="daum.net">daum.net</option>
	      		<option value="nate.com">nate.com</option>
	      		<option value="hotmail.com">hotmail.com</option>
	      		<option value="gmail.com">gmail.com</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th>연락처</th>
	      <td>
	      	<select name="ph1" class="drop" id="ph1">
	      		<option value="010">010</option>
	      		<option value="011">011</option>
	      		<option value="051">051</option>
	      		<option value="055">055</option>
	      	</select>
	      	-
	      	<input type="text" name="ph2" class="number" id="ph2">
	      	-
	      	<input type="text" name="ph3" class="number" id="ph3">
	      </td>
	    </tr>
	    <tr>
	    	<th>주소</th>
	    	<td><input id="address" type="text" name="address"></td>
	    </tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="form.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>