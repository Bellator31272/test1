<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
	$(function(){
		let word = "<c:out value='${boardVO.keyword}'/>"; 
		if(word!=""){
			$("#keyword").val('<c:out value='${boardVO.keyword}'/>');
			$("#keyword").focus();
			$("#search").val('<c:out value='${boardVO.search}'/>');
			
			if($("#search").val()!='b_content'){
				//:contais() 는 특정 텍스트를 포함한 요소 반환
				if($("#search").val()=='b_title') value = "#list tr td.goDetail";
				else if($("#search").val()=='b_name') value = "#list tr td.name";
				console.log($(value+":contains('"+word+"')").html());
				// $("#list tr td.goDetail:contais('aa')").html()  =>  <span class='required>노력</span>에 대한 명언
				$(value+":contains('"+word+"')").each(function (){
					let regex = new RegExp(word, 'gi');
					$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
				})
			}
		}
		
		$("#insertformBtn").click(function(){
			location.href="/board/writeForm";
		})
		
		$(".goDetail").click(function(){
			let b_num = $(this).parents("tr").attr("data-num");
			console.log("bnum :", b_num);
			$("#b_num").val(b_num);
			$("#detail").attr({
				method : "post",
				action : "/board/boardDetail"
			})
			$("#detail").submit();
		})
		
		$("#searchData").click(function() {
			if(!chkData("#keyword", "검색어를")) return;
			else {
				$("#pageNum").val(1); //페이지 초기화
				goPage(); 
			}
		})
		$("#listBtn").click(function(){
			location.href="/board/boardList";
		})
		$("#keyword").bind("keydown", (e) => {
			if(e.keyCode ==13) {
				e.preventDefault();
			}
		})
		$("#search").change(() => {
			$("#keyword").focus();
		})
		
		$(".paginate_button a").click(function(e) {
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
	})
	
	function goPage(){
		$("#f_search").attr({
			"method":"get",
			"action":"/board/boardList"
		})
			$("#f_search").submit();
	}
</script>
<style>
td{
display:table-cell;
  vertical-align:middle;
}
.file{
	width:130px;
}
.reply_count{
	font-size : 80%;
	color : red;
}

</style>

<title>게시판 리스트</title>

</head>
<body>
	<div class="container">
		<div id="boardSearch" class="text-right"> 
		<form id="f_search" name="f_search" class="form-inline">
			<%-- 페이징 처리를 위한 파라미터 --%>
			<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
			<div class="form-group">
				 <label></label>
				 <select id="search" name="search"  class="form-control">
<!-- 							<option value="all">전체조회</option> -->
							<option value="b_title">제목</option>
							<option value="b_content">내용</option>
							<option value="b_name">작성자</option>
				</select>
				<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control" />
				<button type="button" id="searchData" class="btn btn-primary">검색</button>
				<button type="button" id="listBtn" class="btn btn-primary">초기화</button>
			</div>
		</form>
		</div>
		<br />
<!-- 		<div class="page-header"><h3 class="text-center">게시판 리스트</h3></div> -->
		
		<form id="detail" name="detail">
			<input type="hidden" id="b_num" name="b_num" />
		</form>

		<div id="boardList" class="table-height">
			<table summary="게시판 리스트" class="table table-striped" >
				<thead>
					<tr>
						<th data-value="b_num" class="order text-center col-md-1" >글번호</th>
						<th class="text-center col-md-4">글제목</th>
						<th class="text-center col-md-2">작성자</th>
						<th data-value="b_date" class="order col-md-1">작성일</th>
						<th class="text-center col-md-1">조회수</th>
						<th class="text-center col-md-1"></th>
					</tr>
				</thead>
				<tbody id="list" class="table-striped" >
					<c:choose>
						<c:when test="${not empty boardList}"  >
							<c:forEach var="board" items="${boardList}" varStatus="status"> 
								<tr class="text-center" data-num="${board.b_num}">
 									<td>${board.b_num}</td>
									<td class="goDetail text-left"> ${board.b_title}
										<c:if test="${board.r_cnt != 0 }"> <span class="reply_count">[${board.r_cnt }]</span></c:if>
									</td>
									<td class="name">${board.b_name}</td>
									<td class="text-left"> ${board.b_date}</td>
									<td class="text-center">${board.readcnt}</td>
									<td>
										<c:if test="${not empty board.b_file }">
											<img src="/uploadStorage/board/${board.b_file }" class="file"/>
										</c:if>
										<c:if test="${empty board.b_file }">
											<img src="/resources/image/imagenotfound.png" class="file" />
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="5" class="tac text-center">등록된 게시글이 없음</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- ================ 리스트 종료 ================ --%>
		<%-- ================ 페이징 출력 ================ --%>
		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 바로가기 10개 존재 여부 확인 -->
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">Previous</a>
					</li>
				</c:if>
				
				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
						<a href="${num}">${num }</a>
					</li>
				</c:forEach>
				
				<!-- 다음 바로가기 10개 존재 여부 확인 -->
				<c:if test="${pageMaker.next }">
					<li class="paginate_button next">
						<a href="${pageMaker.endPage+1 }">Next</a>
					</li>
				</c:if>
			</ul>	
		</div>

		<%-- ================ 글쓰기 버튼 ================ --%>
		<div class="contentBtn text-right">
			<input type="button" value="글쓰기" id="insertformBtn" class="btn btn-success" />
		</div>
	</div>
</body>
</html>