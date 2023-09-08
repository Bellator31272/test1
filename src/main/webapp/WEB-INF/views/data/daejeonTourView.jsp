<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		const template = (index) => {
			let $div = $('#list');
			
			let $element = $("#item-template").clone().removeAttr('id');
			
			$element.find(".tour-name").html(index.tourspotNm);
			$element.find(".tour-phone").html(index.refadNo);
			$element.find(".tour-zipcode").html(index.tourspotZip);
			$element.find(".tour-address").html(index.tourspotAddr);
			$element.find(".tour-time").html(index.mngTime);
			$element.find(".tour-amount").html(index.tourUtlzAmt);
			$element.find(".tour-parking").html(index.pkgFclt);
			$element.find(".tour-facilities").html(index.cnvenFcltGuid);
			$element.find(".tour-content").html(index.tourspotSumm);
				
			$div.append($element);
		}
	
		$(function(){
			$(".contentLayout .page-header h1").html("대전 - 문화관광");
			
			$.getJSON("/data/daejeonTourList", function(data){
				$(data.response.body.items).each(function(index) {
					template({
						"tourspotNm":this.tourspotNm,
						"refadNo":this.refadNo,
						"tourspotZip":this.tourspotZip,
						"tourspotAddr":this.tourspotAddr,
						"mngTime":this.mngTime,
						"tourUtlzAmt":this.tourUtlzAmt,
						"pkgFclt":this.pkgFclt,
						"cnvenFcltGuid":this.cnvenFcltGuid,
						"tourspotSumm":this.tourspotSumm
					})
				})
			}).fail(function(){
				alert("오류");
			})
		})
		</script>
		<style>
 		#item-template { display: none;} 
		</style>
	</head>
	<body>
	<div class="contentContainer container" id="list">
		<div id="item-template">
		<table class="table" >
			<tr>
				<td  colspan="8"><h4 class="tour-name"></h4></td>
			</tr>
			<tr>
				<td class="tour-phone"></td>
				<td class="tour-zipcode"></td>
				<td class="tour-address"></td>
				<td class="tour-time"></td>
				<td class="tour-amount"></td>
				<td class="tour-parking"></td>
				<td class="tour-facilities"></td>
				<td class="tour-content"></td>
			</tr>
		</table>
		</div>
	</div>
	</body>
</html>