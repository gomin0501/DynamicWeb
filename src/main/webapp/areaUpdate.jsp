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
	String code=request.getParameter("areacode");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from area0305 where areacode=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,code);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String name=rs.getString("areaname");
%>
	<form name="form" method="post" action="areaUpdateProcess.jsp">
		<h2>거주지 정보 수정 화면</h2>
	<table border="1">
	    <tr>
	      <th>거주지 코드</th>
	      <td ><input type="text" name="code" value="<%=code %>"></td>
	    </tr>
	    <tr>
	      <th>거주지 이름</th>
	      <td ><input type="text" name="name" value="<%=name %>"></td>
	    </tr>
	    
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	    <% } %>
	</table>
	</form>
<script src="areaForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>