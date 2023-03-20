<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WhizLab</title>
<style type="text/css">
	#login img{
	  margin: 10px 0;
	  width: 250px;
	}

	#login .center {
	  text-align: center;
	}

	#login .login {
	  max-width: 300px;
		margin: 35px auto;
	}

	#login .login-form{
	  padding:0px 25px;
	}

	.login-buttons{
	    width:10%;
	    margin: auto;

	}
	#body{
	    background-color: white;
	}
	#login{
	    margin: 6rem 0;
	}
	.login-box{
	    background-color:lightgray;
	    padding:10px;
	}
</style>
<link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/sweetalert/sweetalert.min.js"></script>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
</head>
<body id="body">
<div id="login" class="login-content">
       <div class="center">
          <img src="${pageContext.request.contextPath}/image/whizlab_BK.png" alt="logo">
             <div class="login-box">
				<form action="${pageContext.request.contextPath}/jsLoginCheck" method="POST" id="LoginForm" class="margin-bottom-0">

					<div class="form-group m-b-20">
						<input type="text" id="customerWebID" name="customerWebID" class="form-control form-control-lg inverse-mode" placeholder="Id" required="">
					</div>
					<div class="form-group m-b-20">
						<input type="password" id="customerWebPW" name="customerWebPW" class="form-control form-control-lg inverse-mode" placeholder="Password" required="">
					</div>
					<div class="login-buttons">
						<button type="submit" class="btn  btn-block btn-lg color">Sign me in</button>
					</div>
				</form>
			 </div>
	   </div>

</div>

</body>
</html>