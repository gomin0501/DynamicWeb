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
      height: 15%;
      background-color: rgb(210, 207, 207);
      text-align: center;
      font-size: 1.5em;
    }
    header h1{
    	padding:2%;
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
   		height:75%;
    }
    section h2{
    	text-align:center;
    	margin:2%;
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
#memberList{
	width:70%;
}
#memberList td{
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
  </style>
</head>
<body>
<header>
    <h1>쇼핑몰에 오신 것을 환영합니다.</h1>
</header>
</body>
</html>