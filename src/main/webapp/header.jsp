<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
      margin: 0;
      padding: 0;
    }
    body, html{
    	height:100%;
    	width:100%;
    }
    header{
      position:relative;
      height: 15%;
      background-color: rgb(210, 207, 207);
      text-align: left;
      font-size: 1.5em;
    }
    header h1{
    	padding:2%;
    	float:left;
    }
    nav{
      height: 5%;
      background-color: black;
    }
    nav ul{
    	padding: 0.5% 0 1% 0;
    }
    nav li{
      list-style-type: none;
      display: inline;
      padding: 1% ;
    }
    nav li a{
      text-decoration: none;
      color: white;
    }
    section{
   		height:78%;
    }
    
    section h2{
    	text-align:center;
    	margin:2%;
    }
    .logo{height:100%;}
    #logo{
    	width:90%;
    	height:98%;
    	display:block;
    	margin:2px auto;
    }
    footer{
    	height: 5%;
    	background-color:gray;
    	text-align:center;
    	text-transform: uppercase;
    	padding:0.5% 0 0.5% 0;
    }
/* form css */
form h2{
	text-align:center;
	padding: 1% 0;
}
table{
	margin: 0 auto;
	width:80%;
	border:2px solid black;
	
}
th{
	background-color:rgb(224, 221, 221);
	text-align:center;
	padding:1% 0;
	border-bottom:none;
}


td{
	border:0.5px solid black;
	box-sizing:border-box;
}
#memberSelect{
	width:90%;
}
#memberSelect td{
	text-align:center;
	padding:1%;
}
input, select, button{
		height:100%;
		font-size:14px;
		border:0.5px solid rgb(224, 221, 221);
		padding:1%;
	}
.ps{
	width:65%;
	border:1px solid black;
}
.drop, .number{
	width:20%;
}

#address{
	width:80%;
}
#button,.button,#order td{
	text-align:center;
}
button{
	width:20%;
	background-color:black;
	color:white;
	padding:0.5% 0;
}
button:hover{
	cursor:pointer;
}
button a{
	text-decoration:none;
	color:white;
}
.birth{
	width:10%;
}
.add{
	text-align:center;
	margin-top:10px;
}
.addB{
	background-color:rgb(71, 70, 65);
	padding: 0.5%;
	width:auto;
	height:auto;
	text-align:center;
}
caption{
	text-align:left;
	margin-bottom:1%;
}
.right{
	position:absolute;
	width: 32%;
	font-size:12px;
	top:30%;
	right:0;
}
#product{
	text-align:center;
}
#product td{
	padding:1%;
}
#product td a{
	text-decoration:none;
}
#board,.write1{
	margin-top:2%;
}
.write1,.view{
	border:none;
	border-bottom:2px solid rgb(37, 162, 186);
	width:40%;
}

#board{
	border:2px solid rgb(37, 162, 186);
	border-collapse:collapse;
}
#board td, .write1 .index{
	text-align:center;
	padding:1%;
	border-top:2px solid rgb(37, 162, 186);
	border-left:1px solid white;
	border-right:1px solid white;
}
.index{
	background-color:rgb(230, 234, 235);
}
#title{
	width:40%;
}

.write2{
	text-align:center;
	padding:1%;
	border:2px solid rgb(37, 162, 186);
}
.write1 input{
	text-align:left;
}
.view td{
	border:none;
	border-bottom:1px solid rgb(163, 157, 157);
	text-align:center;
}
.view .col2{
	text-align:left;
}
td img{
	width:42px;
	display:inline;
}
#board .indent{
	text-align:left;
}
  </style>
</head>
<body>
<header>
<%
	//loginProcess에서 받아온 session 이름으로 login한 사용자를 체크하기
	String checkName="";
	checkName=(String)session.getAttribute("s_Name");
	System.out.println("name:"+checkName);
	if(checkName==null){
%>  
    <h1>쇼핑몰에 오신 것을 환영합니다.</h1>
    <div class="right">
    	<fieldset id="s1">
    		<form name="frm" method="post" action="LoginProcess.jsp">
    			회원ID : <input type="text" name="id">
    			비밀번호 : <input type="password" name="password">
    			<input type="submit" value="로그인">
    			<a href="addMember.jsp">회원가입</a>
    		</form>
    	</fieldset>
    </div>
    <%}else{
    	//사용안하면 100초 뒤 로그아웃하기
    	session.setMaxInactiveInterval(100);
    	%>
    <h1>쇼핑몰에 오신 것을 환영합니다.</h1>
    <div class="right">
    	<%=checkName %>님 환영합니다.
    	<a href="logout.jsp">logout</a>
    	<a href="addMember.jsp">회원가입</a>
    </div>
    <%} %>
    
</header>
</body>
</html>