<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/qna/updateQnA.css">
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
	
	<h3>수정 페이지</h3>
	<form id="updateForm" method="post" action="/qna/updateQnA">
		<div class="input_wrap">
			<label>글 번호</label> <input type="text" name="qnaNum"
				value='<c:out value="${pageInfo.qnaNum}" />' readonly>
		</div>
		<div class="input_wrap">
			<label>상품 번호</label> <input type="text" name="prodNum"
				value='<c:out value="${pageInfo.prodNum}" />' readonly>
		</div>
		<div class="input_wrap">
			<label>문의글 내용</label>
			<textarea rows="3" name="qnaContent"><c:out
					value="${pageInfo.qnaContent}" /></textarea>
		</div>

		<div class="input_wrap">
			<label>아이디</label> <input type="text" name="id"
				value='<c:out value="${pageInfo.id}" />' readonly>
		</div>

		<div class="btn_wrap">
			<a class="btn" id="main_btn">목록 페이지</a> <a class="btn"
				id="submit_btn">수정 완료</a> <a class="btn" id="cancel_btn">수정 취소</a> <a
				class="btn" id="delete_btn">삭 제</a>
		</div>
	</form>
	<form action="/qna/updateQnA" method="get" id="infoForm">
		<input type="hidden" id="qnaNum" name="qnaNum"
			value='<c:out value="${pageInfo.qnaNum}" />'>
		<!-- 
      <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />'>
      <input type="hidden" name="amount" value='<c:out value="${cri.amount}" />'>
      <input type="hidden" name="type" value='<c:out value="${cri.type}" />'>
      <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}" />'>
       -->
	</form>

	<script>
      let form = $("#infoForm");
      let mform = $("#updateForm");
      
      $("#main_btn").on("click", function(e) {
    	 form.find("#qnaNum").remove();    	  
         form.attr("action", "/qna/main");
         form.submit();
      });
      $("#submit_btn").on("click", function(e) {
         mform.submit();
      });
      $("#cancel_btn").on("click", function(e) {
         form.attr("action", "/qna/showQnA");
         form.submit();
      });
      $("#delete_btn").on("click", function(e) {
         form.attr("action", "/qna/deleteQnA");
         form.attr("method", "post"); // post방식으로 바로 날림
         form.submit();
      });
   </script>
</body>
</html>