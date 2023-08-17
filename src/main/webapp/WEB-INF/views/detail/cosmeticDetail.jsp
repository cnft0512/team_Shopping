<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/detail/cosmeticDetail.css">
<link rel="stylesheet" href="/resources/css/qna/main.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>

	<!-- header -->
	<%@include file="../include/userHeader.jsp"%>

	<!-- 메인 화면 부분 -->
	<div class="content_area">

		<div class="column-container">
			<!-- 왼쪽 -->
			<div class="div_left">
				<c:if test="${prodDetail.img1 != null}">
					<img class="prodImg" src="/resources/prod_image/${prodDetail.img1}"
						style="width: 45%;">
				</c:if>
				<c:if test="${prodDetail.img2 != null}">
					<img class="prodImg" src="/resources/prod_image/${prodDetail.img2}"
						style="width: 45%;">
				</c:if>
				<c:if test="${prodDetail.img3 != null}">
					<img class="prodImg" src="/resources/prod_image/${prodDetail.img3}"
						style="width: 45%;">
				</c:if>
			</div>

			<!-- 오른쪽 -->
			<div class="div_right">
				<!-- 정보 -->
				<div>
					${prodDetail.cateName }<br> ${prodDetail.prodName }<br>
					${prodDetail.price }<br>
					<br>
					<div class="info">${prodDetail.prodInfo }</div>
				</div>
				<!-- 버튼 -->
				<div class="button">
					<div class="button_quantity">
						<label>주문수량</label> <input type="text" class="quantity_input"
							value="1"> <span>
							<button class="plus_btn">+</button>
							<button class="minus_btn">-</button>
						</span>
					</div>
					<div class="button_set">
						<a class="btn_cart">장바구니</a>
					</div>
				</div>
			</div>
		</div>
		<!-- column-container end -->


		<div>
			<h1 style="text-align: center;">Q & A</h1>
			<div class="table_wrap" style="width: 70%; margin-left: 15%;">
				<c:if test="${member.id != 'admin'}">
					<div class="enroll" style="float: right; border: 1px solid black;" onclick='postQnADiv()'>게시판 등록</div>
				</c:if>
				<br>
				<br>
				<table class="qna_table">
					<thead>
						<tr>
							<th class="qnaNum_width">글 번호</th>
							<th class="qnaStatus_width">답변 상태</th>
							<th class="qnaTitle_width">글 제목</th>
							<th class="prodNum_width">상품 번호</th>
							<th class="id_width">작성자</th>
							<th class="qnaPostDate_width">작성일</th>
						</tr>
					</thead>

					<c:forEach items="${qnaList}" var="qlist" varStatus="vs">
						<tr>
							<td class="qnaNum"><c:out value="${qlist.qnaNum}" /></td>
							<td class="qnaStatus"><c:out value="${qlist.qnaStatus}" /></td>
							<td class="qnaTitle" style="text-decoration: underline;"><c:out value="${qlist.qnaTitle}" /></td>
							<td class="qnaTitle_update"><input id="qnaTitle_updateTb" value='<c:out value="${qlist.qnaTitle}" />'></td>
							<td class="prodNum"><c:out value="${qlist.prodNum}" /></td>
							<td class="id"><c:out value="${qlist.id}" /></td>
							<td class="qnaPostDate"><fmt:formatDate value="${qlist.qnaPostDate}" pattern="yyyy/MM/dd" /></td>
						</tr>

						<td colspan="6" class="qnaTd">
							<div id="question_div">
								<div id="question_area" style="float: left; margin-left: 35%;">${qlist.qnaContent}</div>
								<div id="button_area" style="float: right;">
									<button id="user_delete">삭제</button>
									<button id="user_update">수정</button>
									<c:if test="${member.id eq 'admin'}"><button id="admin_answer">(관리자) 답글</button></c:if>
									&nbsp;<br><br>
								</div><br>
							</div>

							<div id="question_update_div">
								<div id="question_area" style="float: left; margin-left: 35%;">
									<textarea style="width: 300px; height: 100%;" id="qnaContentTf">${qlist.qnaContent}</textarea>
								</div>
								<div id="button_area" style="float: right;">
									<button id="user_cancel">취소</button>
									<button id="user_complete">완료</button>
									&nbsp;<br><br>
								</div><br>
							</div>

							<hr id="answer_split">
							
							<div id="answer_div">
								<div id="answer_area" style="float: left; margin-left: 35%;">
									${qlist.anqContent} <br> 작성자 : 관리자 //
									답변 날짜 : <fmt:formatDate value="${qlist.anqPostDate}" pattern="yyyy/MM/dd" />
								</div>
								&nbsp;<br>
								<div id="button_area" style="float: right;">
									
									<button id="admin_update">(관리자) 수정</button>
									<button id="admin_delete">(관리자) 삭제</button>
								</div>
							</div>

							<div id="answer_update_div">
								<div id="answer_area" style="float: left; margin-left: 35%;">
									<textarea style="width: 300px; height: 100%;" id="anqContentTf">${qlist.anqContent}</textarea>
									<br>작성자 : 관리자 // 답변 날짜 : <fmt:formatDate value="${qlist.anqPostDate}" pattern="yyyy/MM/dd" />
								</div>
								&nbsp;<br>
								<div id="button_area" style="float: right;">
									<button id="admin_cancel">(관리자) 취소</button>
									<button id="admin_complete">(관리자) 완료</button>
								</div>
							</div><br>
							<hr>
						</td>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@include file="../include/userFooter.jsp"%>

	<script>
   var prodNum = ${prodNum};
   // 수량 버튼 조작
   let quantity = $(".quantity_input").val();
   $(".plus_btn").on("click", function(){
      $(".quantity_input").val(++quantity);
      alert(prodNum);
   });
   $(".minus_btn").on("click", function(){
      if(quantity > 1){
         $(".quantity_input").val(--quantity);   
      }
   });
   
   // 서버로 전송할 데이터
   const form = {
         id : '${member.id}',
         prodNum : '${prodDetail.prodNum}',
         cartCount : ''
   }
   
   // 장바구니 추가 버튼
   $(".btn_cart").on("click", function(e){
      form.cartCount = $(".quantity_input").val();
      $.ajax({
         url: '/cart/add',
         type: 'POST',
         data: form,
         success: function(result){
            cartAlert(result);
         }
      })
   });
   
   function cartAlert(result){
      if(result == '0'){
         alert("장바구니에 추가를 하지 못하였습니다.");
      }else if(result == '1'){
         alert("장바구니에 추가되었습니다.");
      }else if(result == '2'){
         alert("장바구니가 이미 추가되어져 있습니다.");
      }else if(result == '5'){
         alert("로그인이 필요합니다.");
      }
   }
   
   function postQnADiv(){
	   window.open('/qna/postQnA?prodNum=${prodNum}', '_blank', 'width=400px, height=400px');
   }
   
   <!-- Q & A ------------------------------------ -->
   	var qnaTitle = document.querySelectorAll(".qnaTitle");
	var qnaTitle_update = document.querySelectorAll(".qnaTitle_update");
	var qnaTitle_updateTb = document.querySelectorAll("#qnaTitle_updateTb");
	var qnaNumber = document.querySelectorAll(".qnaNum");
	var qnaTd = document.querySelectorAll(".qnaTd");
	var qnaStatus = document.querySelectorAll(".qnaStatus");
	var split_bar = document.querySelectorAll("#answer_split");
	var question_div = document.querySelectorAll("#question_div");
	var question_update_div = document.querySelectorAll("#question_update_div");
	var answer_div = document.querySelectorAll("#answer_div");	
	var answer_update_div = document.querySelectorAll("#answer_update_div");	
	var qnaContentTf = document.querySelectorAll("#qnaContentTf");
	var anqContentTf = document.querySelectorAll("#anqContentTf");	
	var user_update_btn = document.querySelectorAll("#user_update");	
	var user_delete_btn = document.querySelectorAll("#user_delete");
	var user_cancel_btn = document.querySelectorAll("#user_cancel");
	var user_complete_btn = document.querySelectorAll("#user_complete");
	var admin_answer_btn = document.querySelectorAll("#admin_answer");
	var admin_complete_btn = document.querySelectorAll("#admin_complete");
	var admin_cancel_btn = document.querySelectorAll("#admin_cancel");
	var admin_update_btn = document.querySelectorAll("#admin_update");
	var admin_delete_btn = document.querySelectorAll("#admin_delete");
	
	let qnaForm=$("#qnaForm");
	
		$(document).ready(function() {
			$(".qnaTd").hide();
			
			for (let i = 0; i < qnaTitle.length; i++) {
				$(qnaTitle_update[i]).css("display", "none");
				$(question_update_div[i]).css("display", "none");
				$(answer_update_div).css("display", "none");
				if(qnaStatus[i].innerText === '답변완료'){					
					$(answer_div[i]).css("display", "block");
					$(split_bar[i]).css("display", "block");
					$(admin_answer_btn[i]).css("display", "none");
				}else {
					$(answer_div[i]).css("display", "none");
					$(split_bar[i]).css("display", "none");	
				}
				
			}
			
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

		
		
		for (let i = 0; i < qnaTitle.length; i++) {
			qnaTitle[i].addEventListener("click", function() {
				$(qnaTd[i]).slideToggle();
			});			
			user_update_btn[i].addEventListener("click", function() {
				$(qnaTitle_update[i]).css("display", "block");
				$(qnaTitle[i]).css("display", "none");
				$(question_div[i]).css("display", "none");
				$(question_update_div[i]).css("display", "block");				
			});
			user_cancel_btn[i].addEventListener("click", function() {
				$(qnaTitle_update[i]).css("display", "none");
				$(qnaTitle[i]).css("display", "block");
				$(question_div[i]).css("display", "block");
				$(question_update_div[i]).css("display", "none");
				
			});	
			user_complete_btn[i].addEventListener("click", function() {
				const data = {
						qnaNum : qnaNumber[i].innerText,
						qnaTitle : qnaTitle_updateTb[i].value,
						qnaContent : qnaContentTf[i].value
				}
				$.ajax({
			         url: '/qna/updateQ',
			         type: 'POST',
			         data: data,
			         success: function(result){
			        		location.reload();
			         },
			         error : function(request, status,
			                 error) {
			             alert("code:" + request.status
			                   + "\n" + "message:"
			                   + request.responseText
			                   + "\n" + "error:"
			                   + error);
			          }
			      })
			});	
			user_delete_btn[i].addEventListener("click", function() {
				//console.log(qnaNum[i].innerText);
				const data = {
						qnaNum: qnaNumber[i].innerText
				}
				$.ajax({
			         url: '/qna/deleteQ',
			         type: 'POST',
			         data: data,
			         success: function(result){
			        		 location.reload();
			         },error : function(request, status,
			                 error) {
			             alert("code:" + request.status
			                   + "\n" + "message:"
			                   + request.responseText
			                   + "\n" + "error:"
			                   + error);
			          }
			      })
			});	
			
			admin_answer_btn[i].addEventListener("click", function() {
				$(answer_div[i]).css("display", "none");		
				$(answer_update_div[i]).css("display", "block");					
				$(split_bar[i]).css("display", "block");	
							
				
			});
			
			admin_update_btn[i].addEventListener("click", function() {
				$(answer_div[i]).css("display", "none");		
				$(answer_update_div[i]).css("display", "block");					
				$(split_bar[i]).css("display", "block");				
			});
			
			admin_complete_btn[i].addEventListener("click", function() {
			
				const data = {
						qnaNum : qnaNumber[i].innerText,
						qnaStatus : '답변완료',
						anqContent : anqContentTf[i].value
				}
				$.ajax({
			         url: '/qna/updateA',
			         type: 'POST',
			         data: data,
			         success: function(result){
			        		 location.reload();
			         },error : function(request, status,
			                 error) {
			             alert("code:" + request.status
			                   + "\n" + "message:"
			                   + request.responseText
			                   + "\n" + "error:"
			                   + error);
			          }
			      })
			});	
			admin_cancel_btn[i].addEventListener("click", function() {				
				$(answer_div[i]).css("display", "block");
				$(answer_update_div[i]).css("display", "none");				
			});
			admin_delete_btn[i].addEventListener("click", function() {
				const data = {
						qnaNum : qnaNumber[i].innerText,
						qnaStatus : '미등록',
						anqContent : anqContentTf[i].value
				}
				$.ajax({
			         url: '/qna/updateA',
			         type: 'POST',
			         data: data,
			         success: function(result){
			        		 location.reload();
			         },error : function(request, status,
			                 error) {
			             alert("code:" + request.status
			                   + "\n" + "message:"
			                   + request.responseText
			                   + "\n" + "error:"
			                   + error);
			          }
			      })
			});	
			
		}
		
		<!-- -------------------------------------------- -->
	
		
   
   </script>
</body>
</html>