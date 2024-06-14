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
<%
	//로그인 후 글쓰기가능하게
	//heder에서 string checkName을 정의했기때문에 string 생략가능
	checkName=(String)session.getAttribute("s_Name");
	System.out.println("name:"+checkName);
	if(checkName==null){
		%>
		<script>
			alert("먼저 로그인 하세요");
			location.href="home.jsp";
		</script>
		<%
	}
%> 
<section>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=Integer.parseInt(request.getParameter("num"));
	String psw=request.getParameter("password");
	%>
<form name="boardForm" method="post" action="boardUpdateProcess.jsp?num=<%=num%>">
	<table class="write1">
<%	
	try{
		String sql="select title,name,memo from board2024 where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String title=rs.getString(1);
			String name=rs.getString(2);
			String memo=rs.getString(3);
			
			if(!name.equals(checkName)){
				%>
				
				<script>
				alert("수정할 수 없습니다");
				location.href="board.jsp";
				</script>
		<%	} %>

		<tr>
			<td colspan="2" class="write2">수 정</td>
		</tr>
		<tr>
			<td class="index">제목</td>
			<td><input type="text" name="title" value="<%=title %>"></td>
		</tr>
		<tr>
			<td class="index">이름</td>          <!-- 로그인한 사용자 이름 넣기 -->
			<td><input type="text"  name="name" value="<%=name %>"></td>
		</tr>		
		<tr>
			<td class="index">비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td class="index">내용</td>
			<td><textarea rows="20" cols="50" name="memo"><%=memo %></textarea></td>
		</tr>
		<%
	}
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
		
		%>
	</table>
	<div class="add">
	<button class="addB" onclick="check()">수정</button>
	 <button class="addB" type="reset">취소</button>
	 </div>
</form>
<script src="insertBoardForm.js"> </script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>