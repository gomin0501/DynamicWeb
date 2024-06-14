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
	String sql="select * from info0307 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
	
%>
	<form name="form" method="post" action="infoUpdateProcess.jsp">
		<h2>인사관리 사원 수정 화면</h2>
	<table border="1">
	    <tr>
	      <th>사원번호</th>
	      <td ><input type="text" name="id" class="text" value="<%=id %>"></td>
	    </tr>
	    <tr>
	      <th>성명</th>
	      <td ><input type="text" name="name" class="text" value="<%=name %>"></td>
	    </tr>
	    <tr>
	      <th>소속부서</th>
	      <td>
			<select name="dept" id="select">
				<option value="10" <%if(dept.equals("10")){ %>selected<% } %>>인사부</option>
				<option value="20" <%if(dept.equals("20")){ %>selected<% } %>>기획부</option>
				<option value="30" <%if(dept.equals("30")){ %>selected<% } %>>홍보부</option>
				<option value="40" <%if(dept.equals("40")){ %>selected<% } %>>영업부</option>
				<option value="50" <%if(dept.equals("50")){ %>selected<% } %>>경리부</option>
			</select>	      
	      </td>
	    </tr>
	    <tr>
	      <th>직급</th>
	      <td>
	      	<input class="radio" type="radio" name="position" value="1" <%=position.equals("1") ? "checked" : "" %>>1급
	      	<input class="radio" type="radio" name="position" value="2" <%=position.equals("2") ? "checked" : "" %>>2급
	      	<input class="radio" type="radio" name="position" value="3" <%=position.equals("3") ? "checked" : "" %>>3급
	      	<input class="radio" type="radio" name="position" value="4" <%=position.equals("4") ? "checked" : "" %>>4급
	      	<input class="radio" type="radio" name="position" value="5" <%=position.equals("5") ? "checked" : "" %>>5급
	      </td>
	    </tr>
	    
	    <tr>
	      <th>직책</th>
	      <td >
	      <input type="text" name="duty" class="text" value="<%=duty %>">
	      </td>
	    </tr>
	    <tr>
	    	<th>연락처</th>
	    	<td>
	    		<input type="text" name="phone" class="text" value="<%=phone %>">
	    	</td>
	    </tr>
	    <tr>
	    	<th>주소</th>
	    	<td>
	    		<input type="text" name="address" class="text" value="<%=address %>">
	    	</td>
	   	</tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">수정</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	  <% } %>
	</table>
	</form>
<script src="infoForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>