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
	String sql="";
	ResultSet rs=null;
	String rst="";
	String msg="";
	int num=Integer.parseInt(request.getParameter("num"));
	try{
		sql="select name,title,memo,time,hit from board2024 where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String name=rs.getString(1);
			String title=rs.getString(2);
			String memo=rs.getString(3);
			String time=rs.getString(4);
			int hit=rs.getInt(5);
			hit++;
		%>
<section>
<table class="view">
	<h2>내 용</h2>
	<tr>
		<td class="col1">글번호</td>
		<td class="col2"><input type="hidden" name="num" value="<%=num %>"><%=num %></td>
	</tr>
	<tr>
		<td class="col1">조회수</td>
		<td class="col2"><%=hit %></td>
	</tr>
	<tr>
		<td class="col1">이름</td>
		<td class="col2"><%=name %></td>
	</tr>
	<tr>
		<td class="col1">작성일</td>
		<td class="col2"><%=time %></td>
	</tr>
	<tr>
		<td class="col1">제목</td>
		<td class="col2"><%=title %></td>
	</tr>
	<tr height="200">
		<td rowspan="5" colspan="2" class="col2"><%=memo %></td>
	</tr>
	
<%
	sql="update board2024 set hit=? where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,hit);
	pstmt.setInt(2,num);
	pstmt.executeUpdate();
		}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
%>	
</table>
<div class="add">
	<button class="addB">
		<a href="insertBoard.jsp">글쓰기</a>
	</button>
	<button class="addB">
		<a href="reply.jsp?num=<%=num%>">답글</a>
	</button>
	<button class="addB">
		<a href="board.jsp">목록</a>
	</button>
	<button class="addB">
		<a href="boardUpdate.jsp?num=<%=num %>">수정</a>
	</button>
	<button class="addB">
		<a href="boardDelete.jsp?num=<%=num %>">삭제</a>
	</button>
	
	</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>