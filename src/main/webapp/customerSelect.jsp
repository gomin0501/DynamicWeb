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
<h2>고객 정보 목록</h2>
<table border=1 id="select">
	<tr>
		<th>no</th>
		<th>고객아이디</th>
		<th>고객성명</th>
		<th>관심상품</th>
		<th>전화</th>
		<th>이메일</th>
		<th>거주지코드</th>
		<th>구분</th>
	</tr>
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt=null;
		
		//select할때만 ResultSet필요 : database테이블을 전체로 가져와야하기 때문에
		//set집합에 담기
		//while문에서 지정한 값을 넣어야하기 때문에 초기값을 null로 비워준다
		ResultSet rs=null;
		
		//sql(database)에 넘어간 값 가져오기
		String sql="select * from customer0305";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		//database table에서 하나하나 가져오기
		int no=0;
		while(rs.next()){
			String cid=rs.getString("custid");
			String name=rs.getString("author");
			String goods=rs.getString("goods");
			String phone=rs.getString("phone");
			String email=rs.getString("email");
			String area=rs.getString("areacode");
			no++;
		
	%>
	
	<tr>
		<!-- 위 데이터베이스에서 가져온 값이 자동 입력된다 -->
		<td><%=no %></td>
		<td>
		<a href="customerUpdate.jsp?custid=<%=cid %>"><%=cid %></a>
		</td>
		<td><%=name %></td>
		<td><%=goods %></td>
		<td><%=phone %></td>
		<td><%=email %></td>
		<td><%=area %></td>
		<td>
			<!-- 업데이트 화면으로 넘어가기 -->
			<a href="customerDelete.jsp?custid=<%=cid %>"
			onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a>
							<!-- 쌍따옴표 안에 쌍따옴표가 들어가면 오류가 뜨기 때문에 단따옴표로 confirm문장처리 --> 
		</td>
	</tr>
	<% } %>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>