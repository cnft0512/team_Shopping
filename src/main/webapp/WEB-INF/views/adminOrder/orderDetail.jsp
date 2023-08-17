<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminOrder/orderDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>

	<div class="admin_content_wrap">
		<div class="read_wrap">
			<label>주 문 번 호 : </label>
			<c:out value="${olist.orderNum}"/>
		</div>
		<div class="read_wrap">
			<label>아 이 디 : </label>
			<c:out value="${olist.id}"/>
		</div>
		<div class="read_wrap">
			<label>주 문 금 액 : </label>
			<fmt:formatNumber value="${olist.orderPrice}" pattern="\#,###.##" />
		</div>
		<div class="read_wrap">
			<label>주 문 일 자 : </label>
			<fmt:formatDate value="${olist.orderDate}" pattern="yyyy/MM/dd" />
		</div>
		<div class="read_wrap">
			<label>결 제 수 단 : </label>
			<c:out value="${olist.orderPay}"/>
		</div>
		<div class="read_wrap">
			<label>배 송 상 태 : </label>
			<c:out value="${olist.orderStatus}"/>
		</div>
		<div class="read_wrap">
			<label>상 품 번 호 : </label>
			<c:out value="${olist.orderRecv}"/>
		</div>
		<div class="read_wrap">
			<label>우 편 번 호 : </label>
			<c:out value="${olist.orderPost}"/>
		</div>
		<div class="read_wrap">
			<label>수 령 주 소 : </label>
			<c:out value="${olist.orderAddr1} ${olist.orderAddr2}"/>
		</div>
		<div class="read_wrap">
			<label>배 송 메 시 지 : </label>
			<c:out value="${olist.orderMsg}"/>
		</div>
		<div class="read_wrap">
			<label>적 립 포 인 트 : </label>
			<c:out value="${olist.orderPointIn}"/>
		</div>
		<div class="read_wrap">
			<label>사 용 포 인 트 : </label>
			<c:out value="${olist.orderPointOut}"/>
		</div>
		<br>
		<div id="list_btn">목록으로 돌아가기</div>
		
		<form id="infoForm" method="get" action="/adminOrder/orderList">
			<input type="hidden" id="orderNum" name="orderNum" value='<c:out value = "${olist.orderNum}"/>'>
			<input type="hidden" id="type" name="type" value='<c:out value = "${cri.type}"/>'> 
			<input type="hidden" id="keyword" name="keyword" value='<c:out value = "${cri.keyword}"/>'>
		</form>
	</div>
	
	<!-- footer -->
	<%@include file="../include/adminFooter.jsp" %>
	
	<script>
		let form = $("#infoForm");
		
		$("#list_btn").on("click", function() {
			form.find("#orderNum").remove();
			form.find("#type").remove();
			form.find("#keyword").remove();
			form.attr("action", "/adminOrder/orderList");
			form.submit();
		});		
	</script>	

</body>
</html>