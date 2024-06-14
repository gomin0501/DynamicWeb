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
<h2>상품 목록</h2>
<table border=1 id="memberList">
	<tr>
		<th>상품코드</th>
		<th>상품명</th>
		<th>단가</th>
		<th>상세정보</th>
		<th>제조사</th>
		<th>분류</th>
		<th>재고수</th>
		<th>상태</th>
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
		String sql="select * from product0312";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		//database table에서 하나하나 가져오기
		while(rs.next()){
			String pid=rs.getString("productid");
			String name=rs.getString("name");
			String price=rs.getString("unitprice");
			String desc=rs.getString("description");
			String cate=rs.getString("category");
			if(cate.equals("10")){cate="it 제품";}
			else if(cate.equals("20")){cate="주방제품";}
			else if(cate.equals("30")){cate="전자제품";}
			else if(cate.equals("40")){cate="일반 잡화";}
			String manu=rs.getString("manufacturer");
			String instock=rs.getString("unitsinstock");
			String con=rs.getString("condition");
		
	%>
	<tr>
		<!-- 위 데이터베이스에서 가져온 값이 자동 입력된다 -->
			<!-- 업데이트 화면으로 넘어가기 -->
		<td><a href="productUpdate.jsp?productId=<%=pid %>"><%=pid %></a></td>
		<td><%=name %></td>
		<td><%=price %></td>
		<td><%=desc %></td>
		<td><%=manu %></td>
		<td><%=cate %></td>
		<td><%=instock %></td>
		<td><%=con %></td>
		<td>
			<a href="productDelete.jsp?productId=<%=pid %>"
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