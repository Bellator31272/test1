<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/board/boardList";
		});
		$("#cancelBtn").click(function(){
			if(confirm("취소?")){ history.back(1); }
			
		});
		
		$("#updateBtn").click(function() {
			if(!chkData("#b_title", "제목을")) return;
			else if(!chkData("#b_content", "내용을")) return;
			else{
				$("#updateForm").attr({
					method:"post",
					action:"/board/boardUpdate"
				});
				$("#updateForm").submit();
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
				<form class="form-horizontal" id="updateForm">
					<input type="hidden" name="b_num" id="b_num" value="${detail.b_num }" />
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td>
								<td class="text-left col-md-3">
									${detail.b_num }
								</td>
								<td class="col-md-3">작성일</td>
								<td class="text-left col-md-3">
									${detail.b_date }
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td class="text-left" colspan="3">
									${detail.b_name }
								</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left" colspan="3">
									<input type="text" class="form-control" id="b_title" name="b_title" value="${detail.b_title }">
								</td>
							</tr>
							<tr>
								<td>글내용</td>
								<td class="text-left" colspan="3">
									<textarea rows="8" class="form-control" style="resize: none" name="b_content" id="b_content">${detail.b_content }</textarea>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td class="text-left" colspan="3">
									<input type="password" class="form-control" id="b_pwd" name="b_pwd" placeholder="변경할 비밀번호를 입력">
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="contentBtn text-right">
						<button type="button" id="updateBtn" name="updateBtn" class="btn btn-success">저장</button>
						<button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-success">취소</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>