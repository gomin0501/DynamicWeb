<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	String sql="";
	
	String name="";
	String id=request.getParameter("id");
	System.out.print("오류"+id);
	
	try{
		sql="select id,name from info0307 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			id=rs.getString(1);
			name=rs.getString(2);
		}else if(id==null){
			id="";
		}else{
			id="";%>
		<script>
			alert("등록되어 있지 않은 사원번호 입니다.");
		</script>
		<%}
	}catch(Exception e){
		System.out.println("연결 오류");		
		e.printStackTrace();
}
	
%>
<section>
<form name="form" method="post" action="addSudang.jsp">
<h2>수당 정보 등록</h2>
<table border=1>
<tr>
	<th>사원번호</th>
	<td><input type="text" name="id" onchange="changesubmit();" value="<%=id %>"></td>
	<th>이름</th>
	<td><input type="text" name="name" value="<%=name %>"></td>
</tr>
<tr>
	<th>가족수당</th>
	<td><input type="text" name="gajok" placeholder="0"></td>
	<th>직책수당</th>
	<td><input type="text" name="jikchak" placeholder="0"></td>
</tr>
<tr>
	<th>근속수당</th>
	<td colspan="3">
		<input type="text" name="gunsok" placeholder="0">
	</td>
</tr>
<tr>
	<th>기타수당</th>
	<td colspan=3><input type="text" name="gitasudang" placeholder="0">
	</td>
</tr>
<tr>
	<td colspan=4 class="button">
	<button type="submit" onclick="check()">등록</button>
	<button type="reset">취소</button>
	</td>
</tr>
</table>
</form>
<script src="sudangForm.js"></script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>