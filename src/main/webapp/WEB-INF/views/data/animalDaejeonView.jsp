<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link href="/resources/dist/css/lightbox.css" rel="stylesheet">
<script src="/resources/dist/js/lightbox.min.js"></script>
<style type="text/css">
	.media img{width:140px; height:140px;}
	#media-template{display:none;}
</style>
<script type="text/javascript">
	function template(animalSeq, age, filePath, hairColor, foundPlace, species, memo, rescueDate) {
		let $div = $('#list');

		let $element = $("#media-template").clone().removeAttr('id');
		$element.attr('data-animalSeq', animalSeq);
		$element.addClass('animal-list');
		
		let img = "";
		if(filePath != "") {
			img = "http://www.daejeon.go.kr/" + filePath;
			$element.find(".media-left > a").attr({"href":img, "title":species});
			$element.find(".media-left > a > img").attr("src", img);
		} else {
			img = "/resources/image/image_2.png";
			$element.find(".media-left > a > img").attr("src", img);
		}


		$element.find(".media-heading").html(species + " - " + age);
		$element.find(".item-place").html(foundPlace);
		$element.find(".item-color").html(hairColor);
		$element.find(".item-memo").html(memo);

		$div.append($element);
	}

	$(function() {
		$(".contentLayout .page-header h1").html("대전 - 유기동물 공고");
		
		$("#searchCondition, #searchCondition3").on("change", function(){
			data();
		})
		
		function data(){
			$(".animal-list").detach();	//detach() : 선택한 요소를 DOM 트리에서 삭제.
			$.ajax({
				url : "/data/animalDaejeonList",
				type : "get",
				data : $("#f_search").serialize(),
				dataType : "xml",
				error : function(xhr, textStatus, errorThrown) {
					alert(textStatus + "/" + xhr.status + "/" + errorThrown);
				},
				success : function(data) {
					$(data).find('items').each(function(index) {
						let animalSeq = $(this).find("animalSeq").text();
						let age = $(this).find("age").text();
						let filePath = $(this).find("filePath").text();
						let hairColor = $(this).find("hairColor").text();
						let foundPlace = $(this).find("foundPlace").text();
						let species = $(this).find("species").text();
						let memo = $(this).find("memo").text();
						let rescueDate = $(this).find("rescueDate").text();

						template(animalSeq, age, filePath, hairColor, foundPlace, species, memo, rescueDate);
// 						console.log(animalSeq, age, filePath, hairColor, foundPlace, species, memo, rescueDate);
					});
							
				}
			})
		}
	})
</script>
<style>
#item-template {
	display: none;
}
</style>
</head>
<body>
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row" id="list"> -->
	<!-- 				<div id="item-template" class="col-sm-6 col-md-4 item"> -->
	<!-- 					<div class="thumbnail"> -->
	<!-- 					<span class="item-light"><a href="#" data-lightbox="roadtrip"><img class="img"/></a></span> -->
	<!-- 					<div class="caption"> -->
	<!-- 						<h3 class="item-age"></h3> -->
	<!-- 						<p class="item-noticeDate"></p> -->
	<!-- 						발견일<p class="item-rescueDate"></p> -->
	<!-- 						<p class="item-btn"><a class="btn btn-primary detailBtn" role="button">상세정보</a></p> -->
	<!-- 					</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->

	<div class="contentContainer container">
		<div class="well">
			<form class="form-inline" id="f_search">
				<span class="label label-success">유기동물구분</span>
				<div class="form-group tex-bottom">
					<select id="searchCondition" name="searchCondition"
						class="form-control">
						<option value="1" selected>개</option>
						<option value="2">고양이</option>
					</select>
				</div>
				<span class="label label-success">입양상태</span>
				<div class="form-group tex-bottom">
					<select id="searchCondition3" name="searchCondition3"
						class="form-control">
						<option value="1" selected>공고중</option>
						<option value="2">입양가능</option>
						<option value="3">입양예정</option>
						<option value="4">입양완료</option>
						<option value="7">주인반환</option>
					</select>
				</div>
			</form>
		</div>
		<div id="list">
			<div class="media" id="media-template">
				<div class="media-left">
					<a href="#" data-lightbox="roadtrip"> <img
						class="media-object img-rounded" />
					</a>
				</div>
				<div class="media-body">
					<h4 class="media-heading"></h4>
					<table class="table table-hover">
						<tbody class="media-content">
							<tr class="item">
								<td class="item-title">발견된 장소</td>
								<td class="item-place"></td>
							</tr>
							<tr class="item">
								<td class="item-title">색상</td>
								<td class="item-color"></td>
							</tr>
							<tr class="item">
								<td class="item-title">메모</td>
								<td class="item-memo"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>