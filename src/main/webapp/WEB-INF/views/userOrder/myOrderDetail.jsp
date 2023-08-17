<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/userOrder/myOrderDetail.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/include/userHeader.jsp"%>
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>

	<div class="order-details">
		<h2>주문 상세 정보</h2>

		<table>
			<tr>
				<th><strong>주문 번호 No.</strong></th>
				<td>${order.orderNum}</td>
			</tr>
			<tr>
				<th><strong>주문 날짜</strong></th>
				<td><fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<th><strong>주문 금액</strong></th>
				<td>${order.orderPrice}&nbsp;원</td>
			</tr>
		</table>
		<br>
		<table>
			<h4>배송 정보</h4>
			<tr>
				<th><strong>배송자명</strong></th>
				<td>${order.orderRecv}&nbsp;님</td>
			</tr>
			<tr>
				<th><strong>배송 주소</strong></th>
				<td>${order.orderPost}</td>
			</tr>
			<tr>
				<th></th>
				<td>${order.orderAddr1}<br>${order.orderAddr2}</td>
			</tr>
		</table>
		<br>
		<h4>배송 진행 상황</h4>
		<p>${order.orderStatus}</p>
		<div class="order-items">
			<h4>주문 상품</h4>
			<table>
				<thead class="order-item-details">
					<tr>
						<th class="jb-th-1">상품</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="od" items="${detail}">
						<tr>
							<td style="text-align: right;">${od.prodName}</td>
							<td style="text-align: right;">${od.prodPrice}</td>
							<td style="text-align: right;">${od.prodCount}</td>
							<td style="text-align: right;">${od.prodPrice * od.prodCount}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table>
				<tr style="text-align: right;">
					<td colspan="3">총 주문 금액 : </td>
					<td>${order.orderPrice} 원</td>
				</tr>
				<tr style="text-align: right;">
					<td colspan="3">적립 포인트 : </td>
					<td>${order.orderPointIn} p</td>
				</tr>
				<tr style="text-align: right;">
					<td colspan="3">사용 포인트 : </td>
					<td>${order.orderPointOut} p</td>
				</tr>
				<tr style="text-align: right;">
					<td colspan="3">배 송 비 : </td>
					<td>
						<c:if test="${order.orderPrice >= 100000}">0 원</c:if>
						<c:if test="${order.orderPrice < 100000}">3000 원</c:if>
					</td>
				</tr>
			</table>
		</div>
		<br><a class="cancel_order">주문 취소하기</a><br><br>
	</div>

	<%@ include file="/WEB-INF/views/include/userFooter.jsp"%>

	<script>
      $(".cancel_order").on("click", function(){
         if(${order.orderStatus eq '상품준비'}){
            $(".cancel_order").attr("href", "/userOrder/cancelOrder/${orderNum }");
         }else{
            alert("취소가 불가능합니다.");
         }
      });
   </script>
</body>
</html>