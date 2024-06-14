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
<h2>호봉 정보 조회</h2>
<table border=1>
	<tr>
		<th>no</th>
		<th>등급</th>
		<th>급여</th>
		<th>구분</th>
	</tr>
<%@ include file="dbconn.jsp" %>
<%
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
	try{
		String sql="select dunggub,to_char(salary,'999,999,999') from hobong0307";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		int no=0;
		while(rs.next()){
			String dung=rs.getString("dunggub");
			if(dung.equals("1")){dung="1급";}
			else if(dung.equals("2")){dung="2급";}
			else if(dung.equals("3")){dung="3급";}
			else if(dung.equals("4")){dung="4급";}
			else if(dung.equals("5")){dung="5급";}
			String sal=rs.getString(2);
			no++;
		%>
	<tr>
		<td><%=no %></td>
		<td><%=dung %></td>
		<td id="sal"><%=sal %></td>
		<td id="ud">
			<a href="hobongUpdate.jsp?dunggub=<%=rs.getString("dunggub") %>">수정</a>/
			<a href="hobongDelete.jsp?dunggub=<%=rs.getString("dunggub") %>"
			onclick="if(!confirm('삭제할까요?')) return false;">삭제</a>
		</td>
	</tr>
	<%	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>