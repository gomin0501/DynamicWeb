<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<!-- action:폼을 memberProcess.jsp로 넘겨준다 -->
	<form name="form" method="post" action="productProcess.jsp">
		<h2>상품 등록 화면</h2>
	<table border="1">
	    <tr>
	      <th>상품코드</th>
	      <td ><input type="text" name="productId"></td>
	    </tr>
	    <tr>
	      <th>상품명</th>
	      <td ><input type="text" name="name"></td>
	    </tr>
	    <tr>
	      <th>가 격</th>
	      <td ><input type="text" name="unitprice"></td>
	    </tr>
	    <tr>
	      <th>상세정보</th>
	      <td ><input type="text" name="description"></td>
	    </tr>
	    <tr>
	      <th>제조사</th>
	      <td ><input type="text" name="manufacturer"></td>
	    </tr>
	    <tr>
	      <th>분류</th>
	      <td >
	      	<select name="category" class="drop">
	      		<option value="10">it 제품</option>
	      		<option value="20">주방제품</option>
	      		<option value="30">전자제품</option>
	      		<option value="40">일반 잡화</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	    <th>재고수</th>
	    <td ><input type="text" name="unitsInstock"></td>
	    </tr>
	    <tr>
	      <th>상 태</th>
	      <td>
	      <input type="radio" name="condition" value="신규 제품" checked>신규 제품
	      <input type="radio" name="condition" value="중고 제품">중고 제품
	      <input type="radio" name="condition" value="재생 제품">재생 제품
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
<script src="addproductForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>