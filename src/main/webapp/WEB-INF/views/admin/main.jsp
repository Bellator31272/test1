<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.min.css" />		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/signin.css" />		
				
		<title>관리자 페이지</title>
		
		<link rel="shortcut icon" href="/resources/image/icon.png"  />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<style type="text/css">
			body {
				background-color: #ffffff;
				margin-top: 0px;
				padding-top: 0px;
			}
		</style>
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.--> 
		<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/js/jquery-3.7.0.min.js"></script>
		<script type="text/javascript" src="/resources/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				let errorMsg = "${errorMsg}";
				if(errorMsg !="") {
					alert(errorMsg);
					errorMsg="";
				}
				$("#loginBtn").click(function(){
					if(!chkData("#a_id", "아이디")) {return;}
					else if(!chkData ("#a_pwd", "비밀번호 ")) {return;}
					else {
						$("#loginForm").attr({
							method:"post",
							action:"/admin/login"
						})
						$("#loginForm").submit();
					}
				})
				$("#logOutBtn").click(function(){
					location.href="/admin/logout"
				})
			})
		</script>
	</head>
	<body>
<!-- 	<nav class="navbar navbar-default navbar-fixed-top"> -->
<%--     	<tiles:insertAttribute name="header" /> --%>
<!--     </nav> -->
	 <div class="container">
	<c:if test="${empty adminLogin }">
      <form class="form-signin" id="loginForm">
        <h2 class="form-signin-heading">관리자 로그인</h2>
        <label for="a_id" class="sr-only">id</label>
        <input type="text" id="a_id" name="a_id" class="form-control" placeholder="id" autofocus>
        <label for="a_pwd" class="sr-only">Password</label>
        <input type="password" id="a_pwd" name="a_pwd" class="form-control" placeholder="Password">
        <button class="btn btn-lg btn-primary btn-block" type="button" id="loginBtn">로그인</button>
      </form>
	</c:if>
	<c:if test="${not empty adminLogin }">
		<h3>${adminLogin.a_name } 로그인</h3>
		<button type="button" id="logOutBtn">로그아웃</button>
	</c:if>
    </div>
	</body>
</html>