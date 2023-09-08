<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
		$(function(){
			$(".contentLayout .page-header h1").html("충남관광 - 상세정보");
			let mng_no = ${param.mng_no};
			console.log(mng_no);
			$.ajax({
// 				url : "/data/chungnamDetail",
				url : "/data/chungnamDetail/"+mng_no,
				type : "get",
// 				data : "mng_no=" + mng_no,
				dataType : "xml",
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + "(http-" + xhr.status + "/" + errorThrown + ")");
				},
				success : function(data){
					let local_nm = $(data).find("local_nm").text();
					let type = $(data).find("type").text();
					let nm = $(data).find("nm").text();
					let nm_sub = $(data).find("nm_sub").text();
					
					let addr = $(data).find("addr").text();
					let lat = $(data).find("lat").text();
					let lng = $(data).find("lng").text();
					let tel = $(data).find("tel").text();
					
					let desc = $(data).find("desc").text();
					let view_img = [];
					view_img.push($(data).find("view_img1").text());
					view_img.push($(data).find("view_img2").text());
					view_img.push($(data).find("view_img3").text());
					
					template(local_nm, type, nm, nm_sub, addr, tel, desc, view_img);
					console.log(addr)
				}
			});
			
			function template(local_nm, type, nm, nm_sub, addr, tel, desc, view_img) {
				let $div = $('#detailData');
				
				let $element = $("#item-template").clone().removeAttr('id');
				
				$element.find(".item-title").html(nm);
				$element.find(".item-content").html(desc);
				$element.find(".item-type").html(type);
				$element.find(".item-namesub").html(nm_sub);
				$element.find(".item-addr").html(addr);
				$element.find(".item-tel").html(tel);
				
				for(let i = 0; i < view_img.length; i++){
					let img = $("<img />");
					img.attr("src", view_img[i]);
					img.addClass("img-rounded");
					$element.find(".item-img").append(img);
				}	
					
				$div.append($element);
			}
			
			$("#chungnamListBtn").click(function(){
				location.href="/data/chungnamView";
			})
		});
</script>
	
	<style>
		#item-template { display: none;} 
	</style>
	
	</head>
	<body>
		<div class="contentContainer container">
			<div id="detailData">
				<div class="panel panel-default" id="item-template">
					<div class="panel-heading item-title"></div>
					<div class="panel-body">
						<p class="item-content"></p>
					</div>
				<!-- 테이블 -->
				<table class="table">
					<tbody class="detaile-content">
						<tr class="item">
							<td class="detail-title col-md-2">분류</td>
							<td class="item-type col-md-10"></td>
						</tr>
						<tr class="item">
							<td class="detail-title">간략한 설명</td>
							<td class="item-namesub"></td>
						</tr>
						<tr class="item">
							<td class="detail-title">주소</td>
							<td class="item-addr"></td>
						</tr>
						<tr class="item">
							<td class="detail-title">전화번호</td>
							<td class="item-tel"></td>
						</tr>
						<tr class="item">
							<td class="detail-title">이미지</td>
							<td class="item-img"></td>
						</tr>
					</tbody>
				</table>	
				</div>
			</div>
			
			<div class="text-right">
				<button type="button" class="btn btn-info" id="chungnamListBtn">목록</button>
			</div>
		</div>
	</body>
</html>