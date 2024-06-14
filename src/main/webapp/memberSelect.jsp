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
<h2>회원 목록</h2>
<table border=1 id="memberSelect">
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//목록 카운트
		try{
			String sql="select count(*) from member2024";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			int cnt=0;
			if(rs.next()){
				cnt=rs.getInt(1);
			}else{
				cnt=0;
			}
		%>
<caption>총 <%=cnt %>명의 회원이 있습니다.</caption>
	<tr>
		<th>id</th>
		<th>성명</th>
		<th>비밀번호</th>
		<th>성별</th>
		<th>생년월일</th>
		<th>이메일</th>
		<th>연락처</th>
		<th>주소</th>
		<th>관심분야</th>
		<th>구분</th>
	</tr>
	<%
		sql="select * from member2024";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		//database table에서 하나하나 가져오기
		while(rs.next()){
			String id=rs.getString("id");
			String ps=rs.getString("password");
			String name=rs.getString("name");
			String gender=rs.getString("gender");
			String birth=rs.getString("birth");
			String email=rs.getString("email");
			String phone=rs.getString("phone");
			String address=rs.getString("address");
			String interest=rs.getString("interest");
		
	%>
	<tr>
		<!-- 위 데이터베이스에서 가져온 값이 자동 입력된다 -->
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=ps %></td>
		<td><%=gender %></td>
		<td><%=birth %></td>
		<td><%=email %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=interest %></td>
		<td>
			<!-- 업데이트 화면으로 넘어가기 -->
			<a href="memberUpdate.jsp?id=<%=id %>">수정</a>/ 
			<a href="memberDelete.jsp?id=<%=id %>"
			onclick="if(!confirm('정말로 삭제하겠습니까?')) return false;">삭제</a>
							<!-- 쌍따옴표 안에 쌍따옴표가 들어가면 오류가 뜨기 때문에 단따옴표로 confirm문장처리 --> 
		</td>
	</tr>
<% }
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}	%>
</table>
<div class="add">
	<button class="addB">
		<a href="addMember.jsp">작성</a>
	</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>