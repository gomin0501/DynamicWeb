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
<section>
<h2>거주지 정보 목록</h2>
<table border=1 id="select">
<%@ include file="dbconn.jsp" %>
<%
	//database에서 데이터 가져오기
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select count(*) from area0305";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	int no=0;
	int cnt=0;
	if(rs.next()){
		cnt=rs.getInt(1);
	}else{
		cnt=0;
	}
		%>
	
<caption>총 <%=cnt %>개의 거주지가 있습니다.</caption>
	<tr>
		<th>no</th>
		<th>거주지 코드</th>
		<th>거주지 이름</th>
		<th>구분</th>
	</tr>

<%
	sql="select * from area0305";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		String code=rs.getString("areacode");
		String name=rs.getString("areaname");
		no++;
	%>

	<tr>
		<td><%=no %></td>
		<td><%=code %></td>
		<td><%=name %></td>
		<td>
			<a href="areaUpdate.jsp?areacode=<%=code %>">수정</a>/
			<a href="areaDelete.jsp?areacode=<%=code %>"
			onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a>
		</td>
	</tr>
<% } %>
		
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>