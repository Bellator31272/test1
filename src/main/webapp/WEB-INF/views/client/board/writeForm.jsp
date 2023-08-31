<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/board/boardList";
		});
		
		$("#cancelBtn").click(function(){
			$("#writeForm").each(function(){
				this.reset();
			});
		})
		
		$("#writeBtn").click(function() {
			if(!chkData("#b_name", "작성자를")) return;
			else if(!chkData("#b_title", "제목을")) return;
			else if(!chkData("#b_content", "내용을")) return;
			else if(!chkData("#b_pwd", "비밀번호를")) return;
			else{
				$("#writeForm").attr({
					"method":"post",
					"action":"/board/boardInsert"
				});
				$("#writeForm").submit();
			}
		})
		
	})
</script>

<title>글 작성</title>
	</head>
	<body>
		<div class="container">
<!-- 			<div class="contentTit page-header"><h3 class="text-center">게시판 입력화면</h3></div> -->
			
			<div class="text-center">
				<form class="form-horizontal" id="writeForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<input type="text" class="form-control" id="b_name" name="b_name">
								</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left">
									<input type="text" class="form-control" id="b_title" name="b_title">
								</td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="b_content" id="b_content" rows="8"></textarea>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td class="text-left">
									<input type="password" class="form-control" id="b_pwd" name="b_pwd">
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="contentBtn text-right">
						<button type="button" id="writeBtn" name="writeBtn" class="btn btn-success">저장</button>
						<button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-success">취소</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>