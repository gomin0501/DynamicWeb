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
<h2>사원 정보 조회</h2>
<table border=1 id="info">
	<tr>
		<th>no</th>
		<th>사번</th>
		<th>성명</th>
		<th>직급</th>
		<th>직책</th>
		<th>연락처</th>
		<th>소속부서</th>
		<th>주소</th>
		<th>관리</th>
	</tr>
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt=null;
		
		//select할때만 ResultSet필요 : database테이블을 전체로 가져와야하기 때문에
		//set집합에 담기
		//while문에서 지정한 값을 넣어야하기 때문에 초기값을 null로 비워준다
		ResultSet rs=null;
		
		//sql(database)에 넘어간 값 가져오기
		String sql="select * from info0307";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		//database table에서 하나하나 가져오기
		int no=0;
		while(rs.next()){
			String id=rs.getString("id");
			String name=rs.getString("name");
			String dept=rs.getString("dept");
			if(dept.equals("10")){dept="인사부";}
			else if(dept.equals("20")){dept="기획부";}
			else if(dept.equals("30")){dept="홍보부";}
			else if(dept.equals("40")){dept="영업부";}
			else if(dept.equals("50")){dept="경리부";}
			String position=rs.getString("position");
			String duty=rs.getString("duty");
			String phone=rs.getString("phone");
			String address=rs.getString("address");
			no++;
		
	%>
	
	<tr>
		<!-- 위 데이터베이스에서 가져온 값이 자동 입력된다 -->
		<td><%=no %></td>
		<td>
		<a href="infoUpdate.jsp?id=<%=id %>"><%=id %></a>
		</td>
		<td><%=name %></td>
		<td><%=dept %></td>
		<td><%=position %></td>
		<td><%=duty %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td>
			<!-- 업데이트 화면으로 넘어가기 -->
			<a href="infoDelete.jsp?id=<%=id %>"
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