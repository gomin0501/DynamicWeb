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
<h2>수당 정보 조회</h2>
<table border=1 id="sudang">
	<tr>
		<th>no</th>
		<th>사원번호</th>
		<th>이름</th>
		<th>가족수당</th>
		<th>직책수당</th>
		<th>근속수당</th>
		<th>기타수당</th>
		<th>수당합계</th>
		<th>구 분</th>
	</tr>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select sudang0307.id,name,to_char(gajok,'999,999'),to_char(jikchak,'999,999'),to_char(gunsok,'999,999'),to_char(gitasudang,'999,999'),to_char((gajok+jikchak+gunsok+gitasudang),'999,999,999') from sudang0307,info0307 where sudang0307.id=info0307.id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		int n=0;
		
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String gajok=rs.getString(3);
			String jik=rs.getString(4);
			String gun=rs.getString(5);
			String gita=rs.getString(6);
			String total=rs.getString(7);
			n++;
		%>
	<tr>
		<td class="info"><%=n %></td>
		<td class="info"><%=id %></td>
		<td class="info"><%=name %></td>
		<td class="sudang"><%=gajok %></td>
		<td class="sudang"><%=jik %></td>
		<td class="sudang"><%=gun %></td>
		<td class="sudang"><%=gita %></td>
		<td class="sudang"><%=total %></td>
		<td class="info">
			<a href="sudangUpdate.jsp?id=<%=id %>">수정</a>/
			<a href="sudangDelete.jsp?id=<%=id %>"
			onclick="if(!confirm('삭제할까요?')) return false;">삭제</a>
		</td>
	</tr>	
		
	<%
		}
		
	}catch(Exception e){
		System.out.println("데이터베이스 읽기 오류");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>