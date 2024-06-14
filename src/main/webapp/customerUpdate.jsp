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
	String cid=request.getParameter("custid");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from customer0305 where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,cid);
	rs=pstmt.executeQuery();
	if(rs.next()){ //id한건 이므로 if문으로 사용.여러건일땐 while문
		String name=rs.getString("author");
		String goods=rs.getString("goods");
		String phone=rs.getString("phone");
		String email=rs.getString("email");
		String area=rs.getString("areacode");
		String gds[]=goods.split(",");
		String ph[]=phone.split("-");
		String em[]=email.split("@");
	// } 괄호는 밑으로 옮겨준다
%>
	<form name="form" method="post" action="customerUpdateProcess.jsp">
		<h2>고객 정보 수정 화면</h2>
	<table border="1">
	    <tr>
	      <th>고객 아이디</th>
	      <td ><input type="text" name="id" value="<%=cid %>"></td>
	    </tr>
	    <tr>
	      <th>고 객 성 명</th>
	      <td ><input type="text" name="name" value="<%=name %>"></td>
	    </tr>
	    <tr>
	      <th>관심상품</th>
	      <td >
	      	<input type="checkbox" name="goods" value="의류" <%for(int i=0;i<gds.length;i++)if("의류".equals(gds[i])) out.print("checked"); %>>의류
	      	<input type="checkbox" name="goods" value="식료품" <%for(int i=0;i<gds.length;i++)if("식료품".equals(gds[i])) out.print("checked"); %>>식료품
	      	<input type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<gds.length;i++)if("컴퓨터".equals(gds[i])) out.print("checked"); %>>컴퓨터
	      	<input type="checkbox" name="goods" value="공산품" <%for(int i=0;i<gds.length;i++)if("공산품".equals(gds[i])) out.print("checked"); %>>공산품
	      	<input type="checkbox" name="goods" value="관광" <%for(int i=0;i<gds.length;i++)if("관광".equals(gds[i])) out.print("checked"); %>>관광
	      	<input type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<gds.length;i++)if("전자제품".equals(gds[i])) out.print("checked"); %>>전자제품
	      	<input type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<gds.length;i++)if("건강제품".equals(gds[i])) out.print("checked"); %>>건강제품
	      	<input type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<gds.length;i++)if("운동기구".equals(gds[i])) out.print("checked"); %>>운동기구
	      </td>
	    </tr>
	    <tr>
	      <th>전화</th>
	      <td>
	      	<input type="text" name="ph1" class="number" value="<%=ph[0] %>">
	      	-
	      	<input type="text" name="ph2" class="number" value="<%=ph[1] %>">
	      	-
	      	<input type="text" name="ph3" class="number" value="<%=ph[2] %>">
	      </td>
	    </tr>
	    
	    <tr>
	      <th>이메일</th>
	      <td >
	      <input type="text" name="emailId" value="<%=em[0] %>">
	      @
	      <select name="emailAdd">
	      		<option value="naver.com" <%if(em[1].equals("naver.com")){ %>selected<% } %>>naver.com</option>
	      		<option value="daum.net" <%if(em[1].equals("daum.net")){ %>selected<% } %>>daum.net</option>
	      		<option value="nate.com" <%if(em[1].equals("nate.com")){ %>selected<% } %>>nate.com</option>
	      		<option value="hotmail.com" <%if(em[1].equals("hotmail.com")){ %>selected<% } %>>hotmail.com</option>
	      		<option value="gmail.com" <%if(em[1].equals("gmail.com")){ %>selected<% } %>>gmail.com</option>
	      		<option value="korea.com" <%if(em[1].equals("korea.com")){ %>selected<% } %>>korea.com</option>
	      	</select> 
	      </td>
	    </tr>
	    <tr>
	    	<th>주소</th>
	    	<td>
	    		<select name="areaname">
	    			<option value="101" <%if(area.equals("101")){ %>selected<% } %>>서울</option>
	    			<option value="102" <%if(area.equals("102")){ %>selected<% } %>>경기</option>
	    			<option value="103" <%if(area.equals("103")){ %>selected<% } %>>대전</option>
	    			<option value="104" <%if(area.equals("104")){ %>selected<% } %>>부산</option>
	    			<option value="105" <%if(area.equals("105")){ %>selected<% } %>>광주</option>
	    			<option value="106" <%if(area.equals("106")){ %>selected<% } %>>울산</option>
	    			<option value="107" <%if(area.equals("107")){ %>selected<% } %>>대구</option>
	    			<option value="108" <%if(area.equals("108")){ %>selected<% } %>>강원</option>
	    			<option value="109" <%if(area.equals("109")){ %>selected<% } %>>경상</option>
	    			<option value="110" <%if(area.equals("110")){ %>selected<% } %>>충청</option>
	    			<option value="111" <%if(area.equals("111")){ %>selected<% } %>>제주</option>
	    		</select>
	    	</td>
	    </tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">작성</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	    <% } %>
	</table>
	</form>
<script src="customerForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>