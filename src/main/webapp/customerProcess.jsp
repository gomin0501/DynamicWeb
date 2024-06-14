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
	//form데이터 가져오기
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String []val=request.getParameterValues("goods");
	String goods="";
	if(val !=null){
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)){
				goods+=val[i];
			}else{
				goods+=val[i]+",";
			}
		}
	}
	String phone=request.getParameter("ph1")+"-"+request.getParameter("ph2")+"-"+request.getParameter("ph3");
	String email=request.getParameter("emailId")+"@"+request.getParameter("emailAdd");
	String area=request.getParameter("areaname");
	
	//sql문(database table)에 값 넣기
	String sql="insert into customer0305 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);//번호는 물음표 순서
	pstmt.setString(2,name);
	pstmt.setString(3,goods);
	pstmt.setString(4,phone);
	pstmt.setString(5,email);
	pstmt.setString(6,area);
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("등록이 완료되었습니다");
	//customerSelect로 화면이 넘어가기
	location.href="customerSelect.jsp";
</script>
</body>
</html>