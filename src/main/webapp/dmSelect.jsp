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
	<h2>DM 발송 내역</h2>
	<table border=1 id="dm">
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from dm0305";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		int n=0;
		int cnt=0;
		if(rs.next()){
			cnt=rs.getInt(1);
		}else{
			cnt=0;
		}
	%>
		<caption>총 <%=cnt %>건의 발송내역이 있습니다.</caption>
		<tr>
			<th>no</th>
			<th>DM발송번호</th>
			<th>고객아이디</th>
			<th>고객성명</th>
			<th>발송일자</th>
			<th>DM 내용</th>
			<th>발송부서</th>
			<th>고객등급</th>
			<th>캠페인구분</th>
			<th>거주지코드</th>
			<th>구분</th>
		</tr>
	<%
		try{
		//데이터 조인
		//날짜형식 변경
		sql="select dmno,dm0305.custid,author,to_char(maildate,'yyyy-mm-dd'),contents,dept,grade,campaign,areacode from dm0305,customer0305 where dm0305.custid=customer0305.custid";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			String no=rs.getString(1);
			String id=rs.getString(2);
			String name=rs.getString(3);
			String date=rs.getString(4);
			String cont=rs.getString(5);
			String dept=rs.getString(6);
			String gr=rs.getString(7);
			String camp=rs.getString(8);
			String area=rs.getString(9);
			n++;
	%>
		<tr>
			<td><%=n %></td>
			<td>
				<a href="dmUpdate.jsp?dmno=<%=no %>"><%=no %></a>
			</td>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=date %></td>
			<td><%=cont %></td>
			<td><%=dept %></td>
			<td><%=gr %></td>
			<td><%=camp %></td>
			<td><%=area %></td>
			<td>
				<a href="dmDelete.jsp?dmno=<%=no %>"
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