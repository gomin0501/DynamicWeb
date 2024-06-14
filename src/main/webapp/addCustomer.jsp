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
	<form name="form" method="post" action="customerProcess.jsp">
		<h2>고객 정보 등록 화면</h2>
	<table border="1">
	    <tr>
	      <th>고객 아이디</th>
	      <td ><input type="text" name="id"></td>
	    </tr>
	    <tr>
	      <th>고 객 성 명</th>
	      <td ><input type="text" name="name"></td>
	    </tr>
	    <tr>
	      <th>관심상품</th>
	      <td >
	      	<input type="checkbox" name="goods" value="의류">의류
	      	<input type="checkbox" name="goods" value="식료품">식료품
	      	<input type="checkbox" name="goods" value="컴퓨터">컴퓨터
	      	<input type="checkbox" name="goods" value="공산품">공산품
	      	<input type="checkbox" name="goods" value="관광">관광
	      	<input type="checkbox" name="goods" value="전자제품">전자제품
	      	<input type="checkbox" name="goods" value="건강제품">건강제품
	      	<input type="checkbox" name="goods" value="운동기구">운동기구
	      </td>
	    </tr>
	    <tr>
	      <th>전화</th>
	      <td>
	      	<input type="text" name="ph1" class="number">
	      	-
	      	<input type="text" name="ph2" class="number">
	      	-
	      	<input type="text" name="ph3" class="number">
	      </td>
	    </tr>
	    
	    <tr>
	      <th>이메일</th>
	      <td >
	      <input type="text" name="emailId">
	      @
	      <select name="emailAdd">
	      		<option value="naver.com">naver.com</option>
	      		<option value="daum.net">daum.net</option>
	      		<option value="nate.com">nate.com</option>
	      		<option value="hotmail.com">hotmail.com</option>
	      		<option value="gmail.com">gmail.com</option>
	      		<option value="korea.com">korea.com</option>
	      	</select> 
	      </td>
	    </tr>
	    <tr>
	    	<th>주소</th>
	    	<td>
	    		<select name="areaname">
	    			<option value="101">서울</option>
	    			<option value="102">경기</option>
	    			<option value="103">대전</option>
	    			<option value="104">부산</option>
	    			<option value="105">광주</option>
	    			<option value="106">울산</option>
	    			<option value="107">대구</option>
	    			<option value="108">강원</option>
	    			<option value="109">경상</option>
	    			<option value="110">충청</option>
	    			<option value="111">제주</option>
	    		</select>
	    	</td>
	    </tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="customerForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>