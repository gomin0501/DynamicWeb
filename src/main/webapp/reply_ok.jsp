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
	//form데이터 가져오기
	int num=Integer.parseInt(request.getParameter("num")); 
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String ps=request.getParameter("password");
	String memo=request.getParameter("memo");
	int ref=0;
	int indent=0;
	int step=0;
	
	try{
		String sql="select count(*) from board2024";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		int cnt=0;
		if(rs.next()){
			cnt=rs.getInt(1)+1;
		}else{
			cnt=0;
		}
		
		
		sql="select num,ref,indent,step from board2024 where num=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			ref=rs.getInt(1);
			indent=rs.getInt(3);
			if(indent>0)
				ref=rs.getInt(2);
			else
				ref=rs.getInt(1);
			step=rs.getInt(4);
		}
		
	sql="update board2024 set step=step+1 where ref=? and step>?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,ref);
	pstmt.setInt(2,step);
	pstmt.executeUpdate();			
			
	sql="insert into board2024(num,name,password,title,memo,ref,indent,step,time) values(?,?,?,?,?,?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,cnt);
	pstmt.setString(2,name);
	pstmt.setString(3,ps);
	pstmt.setString(4,title);
	pstmt.setString(5,memo);
	pstmt.setInt(6,ref);
	pstmt.setInt(7,indent+1);
	pstmt.setInt(8,step+1);
	
	
	pstmt.executeUpdate();//실행
	%>
<script>
	alert("입력한 글을 저장하였습니다.");
	location.href="board.jsp";
</script>
	<%
		
	}catch(Exception e){
		System.out.println("연결 오류");
		e.printStackTrace();
	}
	
	
%>
</body>
</html>