<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
$(function(){
	$("#pwdChk").css("visibility", "hidden");
	let btnChk = 0;
	
	$("#boardListBtn").click(function(){
		location.href="/board/boardList";
	})
	
	$("#insertBtn").click(function(){
		location.href="/board/writeForm";
	});
	
	
	$("#updateBtn").click(function(){
		$("#pwdChk").css("visibility", "visible");
		$("#msg").text("비밀번호 입력하세요").css("color", "#000099");
		$("#b_pwd").focus();
		btnChk = 1;
	})
	$("#deleteBtn").click(function(){
		$("#pwdChk").css("visibility", "visible");
		$("#msg").text("비밀번호 입력하세요").css("color", "#000099");
		$("#b_pwd").focus();
		btnChk = 2;
	})
	
	$("#pwdchkBtn").click(function(){
		if(!formCheck("#b_pwd", "#msg", "비밀번호")) {return;}
		else{
			$.ajax({
				url : "/board/pwdConfirm",
				type : "post",
				data : $("#f_pwd").serialize(),
				dataType : "text",
				error : function(){
					alert('시스템 오류');
				},
				success : function(result){ 
					if(result!=1){
						$("#msg").html("비밀번호 불일치").css("color", "#ff0000");
						$("#b_pwd").focus();
					} else{
						$("#msg").text("");
						if(btnChk==1) {	//수정버튼 1
							$("#f_pwd").attr("action", "/board/updateForm");
							$("#f_pwd").attr("method", "post");
							$("#f_pwd").submit();
						} else if(btnChk==2) {
							if(confirm("삭제확인")){
								$("#f_pwd").attr("action", "/board/boardDelete");
								$("#f_pwd").submit();
							}
						}
					}
				}
			});
		}
	})
	
	/* 비밀번호 입력 양식 enter 제거*/
	$("#b_pwd").bind("keydown", function(e){
		if(e.keyCode === 13) { e.preventDefault();}
	})
})
</script>

<title>글 내용</title>
	</head>
	<body>
		<div class="container contentContainer">
			
			<div id="borderPwdBut" class="row text-center"><!-- 비밀번호 확인 버튼 -->
				<div id="pwdChk" class="authArea col-md-8 text-left">
					<form name="f_pwd" id="f_pwd" class="form-inline">
						<input type="hidden" name="b_num" id="b_num" value="${detail.b_num }" />
						<label for="b_pwd" id="l_pwd">비밀번호 : </label>
						<input type="password" name="b_pwd" id="b_pwd" class="form-control" />
						
						<button type="button" id="pwdchkBtn" class="btn btn-default">확인</button>
						<span id="msg"></span>
					</form>
				</div>
				<div class="btnArea col-md4 text-right">
					<button type="button" id="updateBtn" name="updateBtn" class="btn">수정</button>
					<button type="button" id="deleteBtn" name="deleteBtn" class="btn">삭제</button>
					<button type="button" id="insertBtn" name="insertBtn" class="btn">글쓰기</button>
					<button type="button" id="boardListBtn" name="boardListBtn" class="btn">목록</button>
				</div>
			</div>
			
			
			<div class="contentTit page-header"><h3 class="text-center">${detail.b_title }</h3></div>
			
			<div class="contentTB text-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="col-md-3">작성자</td>
							<td class="col-md-3 text-left">
								${detail.b_name }  (조회수 :${detail.readcnt })
							</td>
							<td class="col-md-3">작성일</td>
							<td class="col-md-3 text-left">
								${detail.b_date}
							</td>
						</tr>
						<tr class="table-tr-height">
							<td class="col-md-4">글내용</td>
							<td colspan="3" class="col-md-8 text-left">
								${detail.b_content }
							</td>
						</tr>
					</tbody>
				</table>
				
				
			</div>
		</div>
	</body>
</html>