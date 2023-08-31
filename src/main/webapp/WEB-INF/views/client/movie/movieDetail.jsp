<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/resources/image/icon.png">

    <title>영화 상세 페이지</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/dist/css/sticky-footer-navbar.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="dist/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/dist/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/js/jquery-3.7.0.min.js"></script>
    <script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
    
    <style type="text/css">
    	img{
     		height: 100%;
     		width : 100%;
    	}
    </style>
    
	</head>
	<body>
		<div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <img src="http://image.tmdb.org/t/p/w500${movie.backdrop_path }" alt="${movie.title}" class="img-fluid">
            </div>
            <div class="col-md-6">
                <h2>${movie.title}</h2>
                <p><strong>개봉일:</strong> ${movie.release_date}</p>
                <p><strong>줄거리:</strong> ${movie.overview}</p>
                <p><strong>평점:</strong> ${movie.vote_average} / 10</p>
                <ul>
				    <c:forEach items="${movie.genres}" var="genre">
				        <li>${genre.name}</li>
				    </c:forEach>
				</ul>
                
                <!-- Add more details here -->
            </div>
        </div>
    </div>
	</body>
</html>