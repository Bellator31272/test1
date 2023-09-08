<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript">
$(function() {
	$(".contentLayout .page-header h1").html("게시판 자세히");
	let b_num = ${detail.b_num};
	replyList(b_num);
	
// 	$("#replyInsertBtn").click(function(){
	$(document).on("click", "#replyInsertBtn", function(){
		let insertUrl = "/replies/replyInsert";
		if(confirm("등록?")){
		/* JSON.stringify() : JavaScript 값이나 객체를 JSON 문자열로 반환 */
		let value = JSON.stringify({
			b_num : b_num,
			r_name:$("#r_name").val(),
			r_pwd:$("#r_pwd").val(),
			r_content:$("#r_content").val()
		});
		
		$.ajax({
			url : insertUrl,
			type : "post",	//전송 시 method 방식
			headers : { "Content-Type":"application/json" },
			dataType : "text",
			data : value,
			error : function(xhr, textStatus, errorThrown){
				alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			},
			beforeSend : function(){
				if(!checkForm("#r_name", "작성자를")) return false;	//checkForm() 함수는 placeholder 속성을 이용하여
				else if(!checkForm("#r_pwd", "비밀번호를")) return false;
				else if(!checkForm("#r_content", "내용을")) return false;
			},
			success : function(result){
				if(result == "SUCCESS"){
// 					alert("등록 완료");
					dataReset();
					replyList(b_num);
				}
			}
		});
		}
	});
	
	$(document).on("click", "#replyUpdateBtn", function(){
		let r_num = $(this).attr("data-rnum");
		if(confirm("등록?")){
		/* JSON.stringify() : JavaScript 값이나 객체를 JSON 문자열로 반환 */
		
		$.ajax({
			url : '/replies/'+r_num,
			type : "put",	//전송 시 method 방식
			headers : { 
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"put"
			},
			data : JSON.stringify({
				r_pwd:$("#r_pwd").val(),
				r_content:$("#r_content").val()
			}),
			dataType : "text",
			error : function(xhr, textStatus, errorThrown){
				alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
			},
			beforeSend : function(){
				if(!checkForm("#r_content", "내용을")) return false;
			},
			success : function(result){
				if(result == "SUCCESS"){
// 					alert("등록 완료");
					dataReset();
					replyList(b_num);
				}
			}
		});
		}
	});

	function replyList(b_num){
		$(".reply").detach();
		let url = "/replies/all/"+b_num;
		$.getJSON(url, function(data) {
			$(data).each(function(index) {
				let r_num = this.r_num;
				let r_name = this.r_name;
				let r_content = this.r_content;
				let r_date = this.r_date;
				r_content = r_content.replace(/(\r\n|\r|\n)/g, "<br />");
				
				template(r_num, r_name, r_content, r_date);
// 				console.log(r_num, r_name, r_content, r_date);
			});
		}).fail(function() {
			alert("댓글 목록을 불러오는데 실패하였습니다.");
		});
	}
	
	function template(r_num, r_name, r_content, r_date) {
		let $div = $("#reviewList");
		
		let $element = $("#item-template").clone().removeAttr('id');
		$element.attr("data-num", r_num);
		$element.addClass("reply");
		$element.find('.panel-heading > .panel-title > .name').html(r_name);
		$element.find('.panel-heading > .panel-title > .date').html(" / " + r_date);
		$element.find('.panel-body').html(r_content);
		
		$div.append($element);
	}
	
	$(document).on("click", "button[data-btn='upBtn']", function(){
		let panel = $(this).parents("div.panel");
		let r_num = panel.attr("data-num");
		updateForm(r_num, panel);
	});
	function updateForm(r_num, panel){
		$("#replyForm .resetBtn").detach();
	
		$("#r_name").val(panel.find(".panel-title .name").html());
		$("#r_name").prop("readonly", true);
		
		let content = panel.find(".panel-body").html();
		content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'); 
		$("#r_content").val(content);
		
		$("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
		$("#replyForm button[type='button']").attr("data-rnum", r_num);
		$("#replyForm button[type='button']").html("수정");
		
		let resetButton = $("<button type='button' class='btn btn-success resetBtn'>");
		resetButton.html("취소");
		$("#replyForm .sendBtn").after(resetButton);
	}
	
	$(document).on("click", ".resetBtn", function(){
		dataReset();
	})
	function dataReset(){
		$("#replyForm").each(function(){
			this.reset();
		})
		$("#r_name").prop("readonly", false);
		$("#replyForm button[type='button']").removeAttr("data-rnum");
		$("#replyForm button[type='button']").attr("id", "replyInsertBtn");
		$("#replyForm button[type='button'].sendBtn").html("저장");
		$("#replyForm button[type='button'].resetBtn").detach();
	}
	
	
})
</script>
<style>
	#item-template { display: none;}
</style>
<title></title>
	</head>
	<body id="replyContainer">
<%-- 댓글 입력 화면 --%>			
			<form id="replyForm" name="replyForm">
				<div class="panel panel-default">
					<table class="table">
						<tbody>
							<tr>
								<td class="col-md-1">작성자</td>
								<td class="col-md-3 text-left">
									<input type="text" maxlength="5" class="form-control" id="r_name" name="r_name" />
								</td>
								<td class="col-md-1">비밀	번호</td>
								<td class="col-md-3 text-left">
									<input type="password" maxlength="18" class="form-control" id="r_pwd" name="r_pwd" />
								</td>
								<td class="col-md-4 btnArea">
									<button type="button" id="replyInsertBtn" class="btn btn-success gap sendBtn">저장</button>
								</td>
							</tr>
							<tr>
								<td class="col-md-1">댓글내용</td>
								<td colspan="4" class="col-md-11 text-left">
									<textarea class="form-control" rows="3" id="r_content" name="r_content"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		<h4>댓글</h4>
<%-- 리스트 영역 --%>
			<div id="reviewList">
				<div id="item-template" class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="name"></span>
							<span class="date"></span>
							<button type="button" data-btn="upBtn" class="btn btn-default gap">수정하기</button>
							<button type="button" data-btn="delBtn" class="btn btn-default gap">삭제하기</button>
						</h3>
					</div>
					<div class="panel-body"></div>
				</div>	
			</div>
	</body>
</html>