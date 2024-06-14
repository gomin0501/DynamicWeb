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
      height: 12%;
      background-color: rgb(43, 130, 237);
      text-align: center;
      font-size: 1.5em;
    }
    header h1{
    	padding:2%;
    	color:white;
    }
    nav{
      height: 5%;
      background-color: rgb(149, 147, 147);
      text-align:center;
    }
    nav ul{
    	padding: 0.5% 0 1% 0;
    }
    nav li{
      list-style-type: none;
      color:white;
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
    footer{
    	height: 5%;
    	background-color:gray;
    	text-align:center;
    	text-transform: uppercase;
    	padding:0.5% 0 0.5% 0;
    	color:white;
    }
/* form css */
form h2{
	text-align:center;
	padding: 1% 0;
}
table{
	margin: 0 auto;
	width:60%;
	border:2px solid black;
	
}
th{
	background-color:rgb(224, 221, 221);
	text-align:center;
	padding:1% 0;
	border-bottom:none;
	width:20%;
}
#sudang th,#sudang td,#salary th,#salary td{
	padding:0.5%;
	width:10%;
}

td{
	border:0.5px solid black;
	box-sizing:border-box;
}

#info{
	width:70%;
	text-align:center;
}
#info td{
	padding:1%;

}

td a{
	text-decoration:none;
}

input, select, button{
		height:100%;
		font-size:14px;
		border:0.5px solid rgb(224, 221, 221);
		padding:1%;
	}
.text{
	width:70%;
}
.radio{
	margin:0 1%;
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
#button{
	text-align:center;
}
button,.b{
	width:20%;
	background-color:rgb(173, 170, 170);
	border:1px solid black;
	padding:0.5% 0;
}
button:hover{
	cursor:pointer;
}
caption{
	text-align:left;
}
#sal,.sudang{
	text-align:right;
	font-weight:bold;
}
#ud,.button,.info{
	text-align:center;
}
#sudang{
	width:80%;
}
  </style>
</head>
<body>
<header>
    <h1>인사관리 시스템ver 1.0</h1>
</header>
</body>
</html>