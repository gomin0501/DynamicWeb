a<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String id=request.getParameter("id");
		String sql="select a.id,gajok,jikchak,gunsok,gitasudang,b.name from sudang0307 a, info0307 b where a.id=b.id and a.id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String name=rs.getString(6);
			String fam=rs.getString(2);
			String jik=rs.getString(3);
			String gunsok=rs.getString(4);
			String gita=rs.getString(5);
			
	
%>
<section>
<form name="form" method="post" action="sudangUpdateProcess.jsp">
<h2>수당 정보 수정 등록</h2>
<table border=1>
<tr>
	<th>사원번호</th>
	<td><input type="text" name="id" value="<%=id %>"></td>
	<th>이름</th>
	<td><input type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
	<th>가족수당</th>
	<td><input type="text" name="gajok" placeholder="0" value="<%=fam %>"></td>
	<th>직책수당</th>
	<td><input type="text" name="jikchak" placeholder="0" value="<%=jik %>"></td>
</tr>
<tr>
	<th>근속수당</th>
	<td colspan="3">
		<input type="text" name="gunsok" placeholder="0" value="<%=gunsok %>">
	</td>
</tr>
<tr>
	<th>기타수당</th>
	<td colspan=3><input type="text" name="gitasudang" placeholder="0" value="<%=gita %>">
	</td>
</tr>
<tr>
	<td colspan=4 class="button">
	<button onclick="check()">등록</button>
	<button type="reset">취소</button>
	</td>
</tr>
<% }
	}catch(Exception e){
		System.out.println("연결 오류");		
		e.printStackTrace();
}
	%>
</table>
</form>
<script src="sudangUpdateForm.js"></script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>