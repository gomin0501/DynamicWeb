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
	String dung=request.getParameter("dunggub");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from hobong0307 where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,dung);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String sal=rs.getString("salary");
	
%>
	<form name="form" method="post" action="hobongUpdateProcess.jsp">
		<h2>호봉 수정</h2>
	<table border="1">
	    <tr>
	      <th>직급</th>
	      <td >
	      	<select name="dunggub">
	      		<option value="1" <%if(dung.equals("1")){ %>selected<% } %>>1급</option>
	      		<option value="2" <%if(dung.equals("2")){ %>selected<% } %>>2급</option>
	      		<option value="3" <%if(dung.equals("3")){ %>selected<% } %>>3급</option>
	      		<option value="4" <%if(dung.equals("4")){ %>selected<% } %>>4급</option>
	      		<option value="5" <%if(dung.equals("5")){ %>selected<% } %>>5급</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	      <th>급여</th>
	      <td ><input type="text" name="salary" value="<%=sal %>"></td>
	    </tr>
	    
	    <tr id="button">
	    	<td colspan="2">
	    	<button><a href="hobongSelect.jsp">목록</a></button>
	    	<button class="check" onclick="check()">수정</button>
	    	</td>	    	
	    </tr>
	    <% } %>
	</table>
	</form>
<script src="hobongForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>