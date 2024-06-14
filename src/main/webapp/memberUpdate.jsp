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
<%@ include file="dbconn.jsp" %>
<%
	String id=request.getParameter("id");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from member0312 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	if(rs.next()){ //id한건 이므로 if문으로 사용.여러건일땐 while문
		String name=rs.getString("name");
		String ps=rs.getString("password");
		String gender=rs.getString("gender");
		String email=rs.getString("email");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String ph[]=phone.split("-");
		String em[]=email.split("@");
	// } 괄호는 밑으로 옮겨준다
%>
	<form name="form" method="post" action="memberUpdateProcess.jsp">
		<h2>회원 수정 화면</h2>
	<table border="1">
	    <tr>
	      <th>아이디</th>
	      <td ><input type="text" name="id" id="id" value="<%=id %>"></td>
	    </tr> 
	    <tr>
	      <th>성 명</th>
	      <td ><input type="text" name="name" id="name" value="<%=name %>"></td>
	    </tr>
	    <tr>
	      <th>비밀번호</th>
	      <td ><input type="password" name="ps" class="ps" id="ps" value="<%=ps %>"></td>
	    </tr>
	    <tr>
	      <th>비밀번호 확인</th>
	      <td ><input type="password" name="psCheck" class="ps" id="pscheck" value="<%=ps %>"></td>
	    </tr>
	    <tr>
	      <th>성 별</th>
	      <td >
	      <input type="radio" name="gender" value="남성" <%=gender.equals("남성") ?  "checked" : "" %>>남성
	      <input type="radio" name="gender" value="여성" <%=gender.equals("여성") ?  "checked" : "" %>>여성
	      </td>
	    </tr>
	    <tr>
	      <th>이메일</th>
	      <td ><input type="text" name="emailId" placeholder="이메일" id="email" value="<%=em[0] %>">
	      @
	      	<select name="email" class="drop">
	      													<!-- 자바문법은 항상 퍼센트로 묶어준다. html5랑 구분을 위해서 -->
	      		<option value="naver.com" <%if(em[1].equals("naver.com")){ %>selected<% } %> >naver.com</option>
	      		<option value="daum.net" <%if(em[1].equals("daum.net")){ %>selected<% } %>>daum.net</option>
	      		<option value="nate.com" <%if(em[1].equals("nate.com")){ %>selected<% } %>>nate.com</option>
	      		<option value="hotmail.com" <%if(em[1].equals("hotmail.com")){ %>selected<% } %>>hotmail.com</option>
	      		<option value="gmail.com" <%if(em[1].equals("gmail.com")){ %>selected<% } %>>gmail.com</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th>연락처</th>
	      <td>
	      	<select name="ph1" class="drop" id="ph1">
	      		<option value="010" <%if(ph[0].equals("010")){ %>selected <% } %>>010</option>
	      		<option value="011" <%if(ph[0].equals("011")){ %>selected <% } %>>011</option>
	      		<option value="051" <%if(ph[0].equals("051")){ %>selected <% } %>>051</option>
	      		<option value="055" <%if(ph[0].equals("055")){ %>selected <% } %>>055</option>
	      	</select>
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
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	    <% } %>
	</table>
	</form>
<script src="form.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>