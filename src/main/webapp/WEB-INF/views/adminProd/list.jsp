<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List Page</title>
<link rel="stylesheet" href="../resources/css/adminProd/list.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>

	<!-- 메인 화면 부분 -->
	<div class="admin_content_wrap">
		<h2>상품 목록</h2>
		<hr><br>
		<!-- 상품 등록 버튼 -->
		<div>
		<button class="top_btn" onclick="location.href='/adminProd/create'">상품 등록</button>
		</div>
		<!-- 목록 영역 -->
		<div class="list_wrap">
			<c:if test="${listCheck!='empty'}">
				<table class="prodList" border="1">
					<thead>
						<tr>
							<td class="th_column_1">상품 번호</td>
							<td class="th_column_2">카테고리</td>
							<td class="th_column_3">상품명</td>
							<td class="th_column_4">상품 가격</td>
							<td class="th_column_5">재고량</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.prodNum}" /></td>
							<td>
								<c:if test="${list.categoryNum == 1}">퍼퓸 비누</c:if>
								<c:if test="${list.categoryNum == 2}">샤워리바디</c:if>
								<c:if test="${list.categoryNum == 3}">퍼퓸</c:if>
								<c:if test="${list.categoryNum == 4}">퍼퓸 밤</c:if>
								<c:if test="${list.categoryNum == 5}">올팩티브 캔들</c:if>
								<c:if test="${list.categoryNum == 6}">퍼퓸 핸드</c:if>
								<c:if test="${list.categoryNum == 7}">튜브 핸드</c:if>
								<c:if test="${list.categoryNum == 8}">핸드앤바디</c:if>
								<c:if test="${list.categoryNum == 9}">체인 핸드</c:if>
								<c:if test="${list.categoryNum == 10}">손소독제</c:if>
								<c:if test="${list.categoryNum == 11}">향 오브젝트</c:if>
								<c:if test="${list.categoryNum == 12}">샘플 키트</c:if>
								<c:if test="${list.categoryNum == 13}">멀티프래그런스</c:if>
							</td>
							<td><a class="move" href='<c:out value="${list.prodNum}" />'><c:out value="${list.prodName}" /></a></td>
							<td><fmt:formatNumber value="${list.price}" pattern="\#,###.##" /></td>
							<td><c:out value="${list.stock}" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${listCheck=='empty'}">
				<div class="table_empty">값이 없습니다..</div>
			</c:if>
		</div>
		
		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form action="/adminProd/list" method="get" id="searchForm">
				<div class="search_area">
					<select name="type">
						<option value=" " <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>----------</option>
               			<option value="P" <c:out value="${pageMaker.cri.type eq 'P'?'selected':'' }"/>>상품명</option>
              			<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>카테고리번호</option>
               			<option value="PC" <c:out value="${pageMaker.cri.type eq 'PC'?'selected':'' }"/>>상품명+카테고리번호</option>
					</select>
				
					<input type="text" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum}"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
					<button class='btn search_btn'>검 색</button>
				</div>
			</form>
		</div>
		
		<!-- 페이지 이동 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pageMaker">
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.pageStart -1}">이전</a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
               <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                  <li class="pageMaker_btn" ${pageMaker.cri.pageNum==num?"active":"" }>
                  <a href="${num}">${num}</a></li>
               </c:forEach>
				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li><a href="${pageMaker.pageEnd +1}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div><!-- admin_content_wrap end -->
	
	<form id="moveForm" method="get">
    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
	
	<!-- footer -->
	<%@include file="../include/adminFooter.jsp"%>

	<script>
		$(document).ready(function() {
			let result = '<c:out value = "${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === '') {
					return;
				}
				if (result === '등록 성공') {
					alert("등록이 완료되었습니다!!!");
				}
				if (result === '조회 성공') {
					alert("조회가 완료되었습니다!!!");
				}
				if (result === '수정 성공') {
					alert("수정이 완료되었습니다!!!");
				}
				if (result === '삭제 성공') {
					alert("삭제가 완료되었습니다!!!");
				}
			}
		});

		let moveForm = $("#moveForm");

		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();
					moveForm.append("<input type='hidden' name='pno' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/adminProd/read");
					moveForm.submit();
				});

		$(".pageMaker a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/adminProd/list");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}
			if (!keyword) {
				alert("키워드 입력하세요.");
				return false;
			}
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>

</body>
</html>