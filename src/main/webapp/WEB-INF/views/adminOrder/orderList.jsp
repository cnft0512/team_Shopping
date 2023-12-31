<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adminOrder/orderList.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/adminHeader.jsp"%>
	
		<!-- 메인 화면 부분 -->
		<div class="admin_content_wrap">
			<h2>주문 목록</h2>
			<hr><br>
			<form action="/adminOrder/orderUpdate" method="get" id="orderList_form">
				
				<!-- 목록 영역 -->
				<div class="order_wrap">
					<c:if test="${listCheck!='empty'}">
						<table class="orderList" border="1">
							<thead>
								<tr>
									<th class="th_column_1">주문 번호</th>
									<th class="th_column_2">회원 아이디</th>
									<th class="th_column_3">주문 일자</th>
									<th class="th_column_4">주문 상태</th>
								</tr>
							</thead>
							<c:forEach items="${olist}" var="olist" varStatus="vs" >
								<tr>							
									<td id="num"><c:out value="${olist.orderNum}" /></td>
									<td><a class="move" href='<c:out value="${olist.orderNum}" />'> <c:out value="${olist.id}" /></a></td>
									<td><fmt:formatDate value="${olist.orderDate}" pattern="yyyy/MM/dd" /></td>
									<td>
										<select class="orderStatus" id='<c:out value="${olist.orderNum}" />'>
											<c:if test="${olist.orderStatus eq '배송중'}">
												<option value="배송완료">배송완료</option>
												<option value="상품준비">상품준비</option>
												<option value="배송준비">배송준비</option>
												<option value="배송중" selected="selected">배송중</option>
											</c:if>
											<c:if test="${olist.orderStatus eq '배송준비'}">
												<option value="배송완료">배송완료</option>
												<option value="상품준비">상품준비</option>
												<option value="배송준비" selected="selected">배송준비</option>
												<option value="배송중">배송중</option>
											</c:if>
											<c:if test="${olist.orderStatus eq '상품준비'}">
												<option value="배송완료">배송완료</option>
												<option value="상품준비" selected="selected">상품준비</option>
												<option value="배송준비">배송준비</option>
												<option value="배송중">배송중</option>
											</c:if>
											<c:if test="${olist.orderStatus eq '배송완료'}">
												<option value="배송완료" selected="selected">배송완료</option>
												<option value="상품준비">상품준비</option>
												<option value="배송준비">배송준비</option>
												<option value="배송중">배송중</option>
											</c:if>
										</select>
									</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${listCheck=='empty'}">
						<div class="table_empty">값이 없습니다..</div>
					</c:if>
				</div>
			</form>

			<!-- 검색 영역 --> 
			<div class="search_input">
				<form action="/adminOrder/orderList" method="get" id="searchForm">
					<div class="search_area">
						<select name="type">
							<option value=" " <c:out value="${pageMaker.cri.type==null?'selected':'' }"/>>----------</option>
							<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>주문 번호</option>
							<option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>회원 아이디</option>
						</select>
						<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}" />'>
						<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
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
						<li><a href="${pageMaker.startPage -1}">이전</a></li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageMaker_btn" ${pageMaker.cri.pageNum==num?'active':''}><a href="${num}">${num}</a></li>
					</c:forEach>
					<!-- 다음 버튼 -->
					<c:if test="${pageMaker.next}">
						<li><a href="${pageMaker.endPage +1}">다음</a></li>
					</c:if>
				</ul>
			</div>
		
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
				<input type="hidden" name="type" value="${pageMaker.cri.type }">
			</form>
				
		</div><!-- admin_content_wrap end -->	
		
	<!-- footer -->
	<%@include file="../include/adminFooter.jsp" %>	
	
	<script>
		$(document).ready(function() {
			let result = '<c:out value = "${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === '') {
					return;
				}
				if (result === '조회 성공') {
					alert("조회가 완료되었습니다!!!");
				}
			}
		});
		
		let mform = $("#moveForm");
		let sform = $("#searchForm");
		let olform = $("#orderList_form");

		$(".move").on("click", function(e) {
			e.preventDefault();
			mform.prepend("<input type='hidden' name='orderNum' value='"+ $(this).attr("href") + "'>");
			mform.attr("action", "/adminOrder/orderDetail");
			mform.submit();
		});

		$(".pageMaker a").on("click", function(e) {
			e.preventDefault();
			mform.find("input[name='pageNum']").val($(this).attr("href"));
			mform.attr("action", "/adminOrder/orderList");
			mform.submit();
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
			sform.find("input[name='type']").val(type);
			sform.find("input[name='keyword']").val(keyword);
			sform.find("input[name='pageNum']").val(1);
			sform.submit();
		});
		/*
		$(".update_btn").on("click", function() {		
			olform.prepend("<input type='hidden' name='orderNum' value='"+ $(this).attr('id') + "'>");
			olform.submit();
		});
		*/
		var target = document.querySelectorAll(".orderStatus");
       
        for(var i=0; i < target.length; i++){
            target[i].addEventListener("change",function(){
                var status = this.options[this.selectedIndex].value;
                olform.prepend("<input type='hidden' name='orderNum' value='"+ $(this).attr('id') + "'>");
                olform.prepend("<input type='hidden' name='orderStatus' value='"+ status + "'>");
                olform.attr("method", "post");
                olform.submit();
        	});
        }
		/*
		$(".test").change(function() {
            //var langSelect = document.getElementById("test");  
            //var selectValue = langSelect.options[langSelect.selectedIndex].value;  
            
            // select element에서 선택된 option의 text가 저장된다.  
            //var selectText = langSelect.options[langSelect.selectedIndex].text;
            //var x =  $(this).attr('name');
            var c = $(".test > option:selected").val();
            alert(c);
            olform.prepend("<input type='hidden' name='orderNum' value='"+ $(this).attr('id') + "'>");
            //olform.prepend($('<input/>',{type:'hidden', name:'orderStatus', value: c}));
            olform.prepend("<input type='hidden' name='orderStatus' value='"+ $(this).attr('name') + "'>");
            olform.attr("method", "post");
            olform.submit();
         });
		 */
	</script>

</body>
</html>