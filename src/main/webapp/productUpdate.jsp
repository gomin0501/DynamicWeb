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
<%@ include file="dbconn.jsp" %>
<%
	String pid=request.getParameter("productId");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from product0312 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,pid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String price=rs.getString("unitprice");
		String desc=rs.getString("description");
		String manu=rs.getString("manufacturer");
		String cate=rs.getString("category");
		String instock=rs.getString("unitsinstock");
		String con=rs.getString("condition");
		
%>
	<form name="form" method="post" action="productUpdateProcess.jsp">
		<h2>상품 수정 화면</h2>
	<table border="1">
	    <tr>
	      <th>상품코드</th>
	      <td ><input type="text" name="productId" value="<%=pid %>"></td>
	    </tr>
	    <tr>
	      <th>상품명</th>
	      <td ><input type="text" name="name" value="<%=name %>"></td>
	    </tr>
	    <tr>
	      <th>가 격</th>
	      <td ><input type="text" name="unitprice" value="<%=price %>"></td>
	    </tr>
	    <tr>
	      <th>상세정보</th>
	      <td ><input type="text" name="description" value="<%=desc %>"></td>
	    </tr>
	    <tr>
	      <th>제조사</th>
	      <td ><input type="text" name="manufacturer" value="<%=manu %>"></td>
	    </tr>
	    <tr>
	      <th>분류</th>
	      <td >
	      	<select name="category" class="drop">
	      		<option value="it 제품" <%if(manu.equals("10")){ %>selected<% } %> >it 제품</option>
	      		<option value="주방제품" <%if(manu.equals("20")){ %>selected<% } %>>주방제품</option>
	      		<option value="전자제품" <%if(manu.equals("30")){ %>selected<% } %>>전자제품</option>
	      		<option value="일반 잡화" <%if(manu.equals("40")){ %>selected<% } %>>일반 잡화</option>
	      	</select>
	      </td>
	    </tr>
	    <tr>
	    <th>재고수</th>
	    <td ><input type="text" name="unitsInstock" value="<%=instock %>"></td>
	    </tr>
	    <tr>
	      <th>상 태</th>
	      <td>
	      <input type="radio" name="condition" value="신규 제품" <%=con.equals("신규 제품") ? "checked" : "" %>>신규 제품
	      <input type="radio" name="condition" value="중고 제품" <%=con.equals("중고 제품") ? "checked" : "" %>>중고 제품
	      <input type="radio" name="condition" value="재생 제품" <%=con.equals("재생 제품") ? "checked" : "" %>>재생 제품
	      </td>
	    </tr>
	    <tr id="button">
	    	<td colspan="2">
	    	<button class="check" onclick="check()">등록</button>
	    	<button type="reset">취소</button>
	    	</td>	    	
	    </tr>
	    <% } %>
	</table>
	</form>
<script src="productForm.js"> </script>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>