<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
// 	$(function(){
// 	    	// 드롭다운 메뉴 사용하기 위해서 아래의 소스 추가.
// 	    	$('.dropdown-toggle').dropdown();
// 	});
</script>
	<style type="text/css">
		img {
 			height :100%;
 			margin : "0px";
 			padding : ""0px";
		}
		#logo{
			margin : 0px;
			padding : 0px;
		}
	</style>

<c:set var="clientUri" value='${requestScope["javax.servlet.forward.request_uri"] }' />
<div class="container">
	<div class="navbar-header">
    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
           <span class="sr-only">Toggle navigation</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        	<a id="logo" class="navbar-brand" href="/"><img src="/resources/image/logo.jpg"></a>
    </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li id="home"  ><a href="/">Home</a></li>
            <li  <c:if test="${fn:containsIgnoreCase(clientUri, 'board') }" > class="active" </c:if> ><a href="/board/boardList">게시판</a></li>
            <li id="admin" <c:if test="${fn:containsIgnoreCase(clientUri, '#') }" > class="active" </c:if>><a href="#">#</a></li>
<!--             <li><a href="#contact">Contact</a></li> -->
            <li class="dropdown <c:if test="${fn:containsIgnoreCase(clientUri, 'data') }" > active </c:if>">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">공공데이터 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="dropdown-header">관광명소</li>
                <li><a href="/data/chungnamView">충남</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">대전</li>
                <li><a href="/data/animalDaejeonView">유기동물</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">#</li>
                <li><a href="#">#</a></li>
                <li class="divider"></li>
              </ul>
            </li>
          </ul>
         </div>
</div>
