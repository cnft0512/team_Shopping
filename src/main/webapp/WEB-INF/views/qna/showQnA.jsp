<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/qna/showQnA.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/userHeader.jsp"%>
	<!-- 사이드 바 -->
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>

	<h1>조회 페이지</h1>
	<form class="show_qna">
		<div class="input_wrap">
			<label>글 번호</label><input name="qnaNum"
				value='<c:out value="${pageInfo.qnaNum}"/>' readonly="readonly">
		</div>
		<div class="input_wrap">
			<label>상품 번호</label><input name="prodNum" readonly="readonly"
				value='<c:out value="${pageInfo.prodNum}"/>'>
		</div>
		<div class="input_wrap">
			<label>문의 내용</label><br>
			<textarea rows="3" name="qnaContent" readonly="readonly"><c:out
					value="${pageInfo.qnaContent}" /></textarea>
		</div>
	
		<div class="input_wrap">
			<label>아이디</label><input name="id" readonly="readonly"
				value='<c:out
					value="${pageInfo.id}" />'>
		</div>
	
		<div class="btn_wrap">
			<a class="btn" id="main_btn">목록 페이지</a> <a class="btn" id="update_btn">수정하기</a>
		</div>
	</form>
	
	<form id="infoForm" method="get" action="/qna/updateQnA">
		<input type="hidden" id="qnaNum" name="qnaNum"
			value='<c:out value = "${pageInfo.qnaNum}"/>'> <input
			type="hidden" name="pageNum"
			value='<c:out value = "${cri.pageNum}"/>'> <input
			type="hidden" name="amount" value='<c:out value = "${cri.amount}"/>'>
		<input type="hidden" name="type"
			value='<c:out value = "${cri.amount}"/>'> <input
			type="hidden" name="keyword"
			value='<c:out value = "${cri.keyword}"/>'>
	</form>
	
	<script>
		let form = $("#infoForm");
		$("#main_btn").on("click", function(e) {
			form.find("#qnaNum").remove();
			form.attr("action", "/qna/main");
			form.submit();
		});
		$("#update_btn").on("click", function(e) {
			form.attr("action", "/qna/updateQnA");
			form.submit();
		});
	</script>
</body>
</html>