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
<table id="board">
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select count(*) from board2024";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		int cnt=0;
		if(rs.next()){
			cnt=rs.getInt(1);
		}else{
			cnt=0;
		}
		
		
	%>
<caption>총게시물 : <%=cnt %>개</caption>	
	<tr class="index">
		<td>번호</td>
		<td id="title">제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
<%
	sql="select num,title,name,time,hit,indent from board2024 order by ref desc, step asc";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		int num=rs.getInt(1);
		String title=rs.getString(2);
		String name=rs.getString(3);
		String time=rs.getString(4);
		int hit=rs.getInt(5);
		int indent=rs.getInt(6);
	
%>
	<tr>
		<td><%=num %></td>
		<td class="indent">
			<%
				for(int j=0;j<indent;j++){%>
					&nbsp;&nbsp;&nbsp;
			<%	}
				if(indent !=0){%>
				<img src="reply_icon.gif" width="30px">
			<%} %>
			<a href="view.jsp?num=<%=num %>"><%=title %></a>
		</td>
		<td><%=name %></td>
		<td><%=time %></td>
		<td><%=hit %></td>
	</tr>	
	<%	}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}%>
	</table>
	<div class="add">
	<button class="addB">
		<a href="insertBoard.jsp">글쓰기</a>
	</button>
	</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>