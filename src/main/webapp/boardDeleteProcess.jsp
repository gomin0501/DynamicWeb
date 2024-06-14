<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int num=Integer.parseInt(request.getParameter("num")); 
	String psw=request.getParameter("password"); //폼에서 가져온 비밀번호
	
try{
	String sql="select password from board2024 where num=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,num);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String ps=rs.getString(1); //데이터베이스에서 가져온 비밀번호
		if(psw.equals(ps)){
		sql="delete board2024 where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
	
		pstmt.executeUpdate();
		%>
		<script>
			alert("게시글 삭제 성공");
			location.href="board.jsp";
		</script>
		<%
		}else{
			%>
		<script>
			alert("잘못된 비밀번호 입니다.");
			history.back(-1);
		</script>
		<%
		}
	}
}catch(Exception e){
	System.out.println("연결 오류");
	e.printStackTrace();
}
%>

</body>
</html>