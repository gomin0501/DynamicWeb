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
	<form name="form" method="post" action="memberUpdateProcess.jsp">
		<h2>회원 정보 수정 화면</h2>
	<table border="1">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=request.getParameter("id");
	try{
		String sql="select id,password,name,gender,to_char(birth,'yyyy-mm-dd'),email,phone,address,interest from member2024 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		 
		if(rs.next()){
			id=rs.getString(1);
			String password=rs.getString(2);
			String name=rs.getString(3);
			String gender=rs.getString(4);
			String birth=rs.getString(5);
			String email=rs.getString(6);
			String phone=rs.getString(7);
			String address=rs.getString(8);
			String interest=rs.getString(9);
			String em[]=email.split("@");
			String ph[]=phone.split("-");
			String itr[]=interest.split(",");
			String btd[]=birth.split("-");
%>
	    <tr>
	      <th>아이디</th>
	      <td ><input type="text" name="id" value="<%=id %>"></td>
	    </tr>
	    <tr>
	      <th>성 명</th>
	      <td ><input type="text" name="name" value="<%=name %>"></td>
	    </tr>
	    <tr>
	      <th>비밀번호</th>
	      <td ><input type="password" name="password" class="ps" value="<%=password %>"></td>
	    </tr>
	    <tr>
	      <th>비밀번호 확인</th>
	      <td ><input type="password" name="psCheck" class="ps" value="<%=password %>"></td>
	    </tr>
	    <tr>
	      <th>성 별</th>
	      <td ><input type="radio" name="gender" value="1" <%=gender.equals("1") ?  "checked" : "" %>>남성
	      <input type="radio" name="gender" value="2" <%=gender.equals("2") ?  "checked" : "" %>>여성</td>
	    </tr>
	    <tr>
	    	<th>생 일</th>
	    	<td>
	    		<input type="text" name="year" placeholder="2020" class="birth" value="<%=btd[0] %>">년
	    		<select name="month" class="birth">
	    			<option value="01" <%if(btd[1].equals("01")){ %> selected <% } %>>1</option>
	    			<option value="02" <%if(btd[1].equals("02")){ %> selected <% } %>>2</option>
	    			<option value="03" <%if(btd[1].equals("03")){ %> selected <% } %>>3</option>
	    			<option value="04" <%if(btd[1].equals("04")){ %> selected <% } %>>4</option>
	    			<option value="05" <%if(btd[1].equals("05")){ %> selected <% } %>>5</option>
	    			<option value="06" <%if(btd[1].equals("06")){ %> selected <% } %>>6</option>
	    			<option value="07" <%if(btd[1].equals("07")){ %> selected <% } %>>7</option>
	    			<option value="08" <%if(btd[1].equals("08")){ %> selected <% } %>>8</option>
	    			<option value="09" <%if(btd[1].equals("09")){ %> selected <% } %>>9</option>
	    			<option value="10" <%if(btd[1].equals("10")){ %> selected <% } %>>10</option>
	    			<option value="11" <%if(btd[1].equals("11")){ %> selected <% } %>>11</option>
	    			<option value="12" <%if(btd[1].equals("12")){ %> selected <% } %>>12</option>
	    		</select>월
	    		<input type="text" name="day" placeholder="1" class="birth" value="<%=btd[2] %>">일
	    	</td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td ><input type="text" name="emailId" placeholder="이메일" value="<%=em[0] %>">
	      @
	      	<input type="text" name="emailList" id="emailInput" value="<%=em[1] %>">
	      	<select name="email" class="drop" id="emailList">
	      		<option value="type">선택하세요</option>
	      		<option value="naver.com">naver.com</option>
	      		<option value="daum.net" >daum.net</option>
	      		<option value="nate.com">nate.com</option>
	      		<option value="hotmail.com">hotmail.com</option>
	      		<option value="gmail.com">gmail.com</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th>연락처</th>
	      <td>
	      	<input type="text" name="ph1" class="number" id="ph1" value="<%=ph[0] %>">
	      	-
	      	<input type="text" name="ph2" class="number" id="ph2" value="<%=ph[1] %>">
	      	-
	      	<input type="text" name="ph3" class="number" id="ph3" value="<%=ph[2] %>">
	      </td>
	    </tr>
	    <tr>
	    	<th>주소</th>
	    	<td><input id="address" type="text" name="address" value="<%=address %>"></td>
	    </tr>
	    <tr>
	    	<th>관심분야</th>
	    	<td>
	    		<input type="checkbox" name="interest" value="프로그램" <%for(int i=0;i<itr.length;i++)if("프로그램".equals(itr[i])) out.print("checked"); %>> 프로그램
	    		<input type="checkbox" name="interest" value="독서" <%for(int i=0;i<itr.length;i++)if("독서".equals(itr[i])) out.print("checked"); %>> 독서
	    		<input type="checkbox" name="interest" value="등산" <%for(int i=0;i<itr.length;i++)if("등산".equals(itr[i])) out.print("checked"); %>> 등산
	    		<input type="checkbox" name="interest" value="여행" <%for(int i=0;i<itr.length;i++)if("여행".equals(itr[i])) out.print("checked"); %>> 여행
	    		<input type="checkbox" name="interest" value="컴퓨터" <%for(int i=0;i<itr.length;i++)if("컴퓨터".equals(itr[i])) out.print("checked"); %>> 컴퓨터
	    		<input type="checkbox" name="interest" value="영화" <%for(int i=0;i<itr.length;i++)if("영화".equals(itr[i])) out.print("checked"); %>> 영화
	    		<input type="checkbox" name="interest" value="운동" <%for(int i=0;i<itr.length;i++)if("운동".equals(itr[i])) out.print("checked"); %>> 운동
	    		<input type="checkbox" name="interest" value="진학" <%for(int i=0;i<itr.length;i++)if("진학".equals(itr[i])) out.print("checked"); %>> 진학
	    	</td>
	    </tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">수정</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
<%
	}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>
	</table>
	</form>
<script src="memberForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>