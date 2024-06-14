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
<%@ include file="dbconn.jsp" %>
<section>
	<!-- 아이디 중복검사 -->
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="";
	String id=request.getParameter("id");
	String name="";
	
	try{
		sql="select id,name from info0307 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			id=rs.getString(1);
			name=rs.getString("name");
		}else if(id==null){
			id="";
		}else{%>
			<script>
				alert("등록이 안 된 사원번호 입니다.");
			</script>
			<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<form name="form" method="post" action="addInfo.jsp">
		<h2>인사관리 사원등록 화면</h2>
	<table border="1">
	    <tr>
	      <th>사원번호</th>
	      <td ><input type="text" name="id" class="text" value="<%=id %>" onchange="changesubmit()"></td>
	    </tr>
	    <tr>
	      <th>성명</th>
	      <td ><input type="text" name="name" class="text" value="<%=name %>"></td>
	    </tr>
	    <tr>
	      <th>소속부서</th>
	      <td>
			<select name="dept" id="select">
				<option value="10">인사부</option>
				<option value="20">기획부</option>
				<option value="30">홍보부</option>
				<option value="40">영업부</option>
				<option value="50">경리부</option>
			</select>	      
	      </td>
	    </tr>
	    <tr>
	      <th>직급</th>
	      <td>
	      	<input class="radio" type="radio" name="position" value="1">1급
	      	<input class="radio" type="radio" name="position" value="2">2급
	      	<input class="radio" type="radio" name="position" value="3">3급
	      	<input class="radio" type="radio" name="position" value="4">4급
	      	<input class="radio" type="radio" name="position" value="5">5급
	      </td>
	    </tr>
	    
	    <tr>
	      <th>직책</th>
	      <td >
	      <input type="text" name="duty" class="text">
	      </td>
	    </tr>
	    <tr>
	    	<th>연락처</th>
	    	<td>
	    		<input type="text" name="phone" class="text">
	    	</td>
	    </tr>
	    <tr>
	    	<th>주소</th>
	    	<td>
	    		<input type="text" name="address" class="text">
	    	</td>
	   	</tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button type="submit" class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	</table>
	</form>
<script src="infoForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>