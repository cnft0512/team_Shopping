<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/notice/main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/userHeader.jsp"%>
	<!-- 사이드 바 -->
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>
	<!-- 메인 화면 부분 -->
	<div class="content_area">
		<h3><a href="/notice/main">공지사항</a></h3><br>
		<div class="table_wrap">
			<c:if test="${member.adminCk == 1}">
				<a href="/notice/postNotice" class="top_btn">게시판 등록</a>
			</c:if>
			<table class="notice_table">
				<thead>
					<tr>
						<th class="bno_width">번호</th>
						<th class="title_width">제목</th>
						<th class="writer_width">작성자</th>
						<th class="regdate_width">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.noticeNum}" /></td>
							<td><a class="move" href='<c:out value="${list.noticeNum}" />'>
								<c:out value="${list.noticeTitle}" /></a>
							</td>
							<td><c:out value="관리자" /></td>
							<td><fmt:formatDate value="${list.postDate}" pattern="yyyy/MM/dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br><br><br>
			<div class="search_wrap">
				<div class="search_area">
					<select name="type">
						<option value=""
							<c:out value = "${pageMaker.cri.type == null?'selected':''}"/>>--</option>
						<option value="T"
							<c:out value = "${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"
							<c:out value = "${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="TC"
							<c:out value = "${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
							+ 내용</option>
					</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
					<button>Search</button>
				</div>
			</div>
			<br><br><br>
			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul class="pageInfo">
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li><a href="${pageMaker.startPage -1}">이전</a></li>
						</c:if>
						<!-- 각 번호 페이지 버튼 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageMaker_btn"
								${pageMaker.cri.pageNum==num?"active":""}><a href="${num}">${num}</a></li>
						</c:forEach>
						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.next}">
							<li><a href="${pageMaker.endPage +1}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</div>
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
			</form>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="../include/userFooter.jsp"%>

	<script>
		$(document).ready(function() {
			let result = '<c:out value="${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === ' ') { //객체와 주소값까지 비교
					return; //return false = X -> true/false 개념이 아님
				}
				if (result === '등록 완료') {
					alert("등록이 완료되었습니다!!");
				}
				if (result === '수정 성공') {
					alert("수정이 완료되었습니다!!");
				}
				if (result === '삭제 성공') {
					alert("삭제가 완료되었습니다!!");
				}
			}
		});

		let mForm = $("#moveForm");

		$(".move").on("click", function(e) {
			e.preventDefault();
			mForm.prepend("<input type='hidden' name='noticeNum' value='" + $(this).attr("href") + "'>");
			mForm.attr("action", "/notice/showNotice");
			mForm.submit();
		});

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			mForm.find("input[name='pageNum']").val($(this).attr("href"));
			mForm.attr("action", "/notice/main");
			mForm.submit();
		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요");
				return false;
			}
			if (!keyword) {
				alert("검색할 단어를 입력하세요");
				return false;
			}
			mForm.find("input[name='type']").val(type);
			mForm.find("input[name='keyword']").val(keyword);
			mForm.find("input[name='pageNum']").val(1);
			mForm.submit();
		});
	</script>
</body>
</html>