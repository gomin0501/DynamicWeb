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
	String cid=request.getParameter("id");
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
	
	
	String sql="update customer0305 set author=?,goods=?,phone=?,email=?,areacode=? where custid=?";
	
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,name);
	pstmt.setString(2,goods);
	pstmt.setString(3,phone);
	pstmt.setString(4,email);
	pstmt.setString(5,area);
	pstmt.setString(6,cid);//번호는 물음표 순서
	
	pstmt.executeUpdate();//실행
	
%>
<script>
	alert("수정이 완료되었습니다");
	//customerSelect로 화면이 넘어가기
	location.href="customerSelect.jsp";
</script>
</body>
</html>