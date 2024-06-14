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
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	//자동 숫자 올리기
	int next_id=0;
	try{
		sql="select max(id) from member2024";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			next_id=rs.getInt(1)+1;
		}else{
			next_id=20200001;
		}
	}catch(Exception e){
		System.out.println("연결 실패");
		e.printStackTrace();		
	}
%>
	    <tr>
	      <th>아이디</th>
	      <td ><input type="text" name="id" value="<%=next_id %>" readonly></td>
	    </tr>
	    <tr>
	      <th>성 명</th>
	      <td ><input type="text" name="name"></td>
	    </tr>
	    <tr>
	      <th>비밀번호</th>
	      <td ><input type="password" name="password" class="ps"></td>
	    </tr>
	    <tr>
	      <th>비밀번호 확인</th>
	      <td ><input type="password" name="psCheck" class="ps"></td>
	    </tr>
	    <tr>
	      <th>성 별</th>
	      <td ><input type="radio" name="gender" value="1" checked>남성
	      <input type="radio" name="gender" value="2">여성</td>
	    </tr>
	    <tr>
	    	<th>생 일</th>
	    	<td>
	    		<input type="text" name="year" placeholder="2020" class="birth">년
	    		<select name="month" class="birth">
	    			<option value="01">1</option>
	    			<option value="02">2</option>
	    			<option value="03">3</option>
	    			<option value="04">4</option>
	    			<option value="05">5</option>
	    			<option value="06">6</option>
	    			<option value="07">7</option>
	    			<option value="08">8</option>
	    			<option value="09">9</option>
	    			<option value="10">10</option>
	    			<option value="11">11</option>
	    			<option value="12">12</option>
	    		</select>월
	    		<input type="text" name="day" placeholder="1" class="birth">일
	    	</td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td ><input type="text" name="emailId" placeholder="이메일">
	      @
	      	<input type="text" name="emailList" id="emailInput">
	      	<select name="email" class="drop" id="emailList">
	      		<option value="type">선택하세요</option>
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
	      	<input type="text" name="ph1" class="number" id="ph1">
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
	    <tr>
	    	<th>관심분야</th>
	    	<td>
	    		<input type="checkbox" name="interest" value="프로그램"> 프로그램
	    		<input type="checkbox" name="interest" value="독서"> 독서
	    		<input type="checkbox" name="interest" value="등산"> 등산
	    		<input type="checkbox" name="interest" value="여행"> 여행
	    		<input type="checkbox" name="interest" value="컴퓨터"> 컴퓨터
	    		<input type="checkbox" name="interest" value="영화"> 영화
	    		<input type="checkbox" name="interest" value="운동"> 운동
	    		<input type="checkbox" name="interest" value="진학"> 진학
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
<script src="memberForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>