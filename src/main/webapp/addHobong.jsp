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
	<form name="form" method="post" action="hobongProcess.jsp">
		<h2>인사관리 호봉 등록 화면</h2>
	<table border="1">
	    <tr>
	      <th>직급</th>
	      <td >
	      	<select name="dunggub">
	      		<option value="1">1급</option>
	      		<option value="2">2급</option>
	      		<option value="3">3급</option>
	      		<option value="4">4급</option>
	      		<option value="5">5급</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th>급여</th>
	      <td ><input type="text" name="salary"></td>
	    </tr>
	    
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="hobongForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>