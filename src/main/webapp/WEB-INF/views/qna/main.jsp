<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/qna/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- header -->
	<%@include file="../include/userHeader.jsp"%>
	<!-- 사이드 바 -->
	<%@ include file="/WEB-INF/views/include/sideBar.jsp"%>
	<h1 style="text-align: center;">Q & A</h1>
	<div class="table_wrap">
		<div><a href="/qna/postQnA" class="top_btn">게시판 등록</a></div>
		<br><br>
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
			
			<c:forEach items="${qlist}" var="qlist" varStatus="vs">
				<tr>
					<td class="qnaNum"><c:out value="${qlist.qnaNum}" /></td>
					<td class="qnaStatus"><c:out value="${qlist.qnaStatus}" /></td>
					<td class="qnaTitle"><c:out value="${qlist.qnaTitle}" /></td>
					<td class="qnaTitle_update" style="background: green;"><input id="qnaTitle_updateTb" value = '<c:out value="${qlist.qnaTitle}" />'></td>
					<td class="prodNum"><c:out value="${qlist.prodNum}" /></td>
					<td class="id"><c:out value="${qlist.id}" /></td>
					<td class="qnaPostDate"><fmt:formatDate value="${qlist.qnaPostDate}" pattern="yyyy/MM/dd" /></td>
				</tr>

				<td colspan="6" class="qnaTd">
					<div id="question_div">
						<div id="button_area">
							<button id="user_delete" style="float: right;">삭제</button>
							<button id="user_update" style="float: right;">수정</button>
							<button id="admin_answer" style="float: right;">(관리자) 답글</button>
							&nbsp;<br>
							<br>
						</div>
						<div id="question_area" style="float:left">${qlist.qnaContent}</div><br>
					</div>
						
					<div id="question_update_div" style="background: green;">
						<div id="button_area">
							<button id="user_cancel" style="float: right;">취소</button>
							<button id="user_complete" style="float: right;">완료</button>
							&nbsp;<br>
							<br>
						</div>
							<div id="question_area" style="float:left"><textarea style="width:100%; height: 100%;" id="qnaContentTf">${qlist.qnaContent}</textarea></div><br>
					</div>
						
						
						
						
						
						<hr id = "answer_split">
					<div id = "answer_div">
						
						<div id="answer_area" style=" float:left">${qlist.anqContent}, 관리자, <fmt:formatDate
							value="${qlist.anqPostDate}" pattern="yyyy/MM/dd" />
						</div>&nbsp;<br>
							<br>
						<div id="button_area">
							<button id="admin_update" style="float: right;">(관리자) 수정</button>	
							<button id="admin_delete" style="float: right;">(관리자) 삭제</button>						
						</div>
					</div>
					
					<div id = "answer_update_div">						
						<div id="answer_area" style=" float:left"><textarea style="width:100%; height: 100%;" id="anqContentTf">${qlist.anqContent}</textarea>, 관리자, <fmt:formatDate
							value="${qlist.anqPostDate}" pattern="yyyy/MM/dd" />
						</div>&nbsp;<br>
							<br>
						<div id="button_area">
							<button id="admin_cancel" style="float: right;">(관리자) 취소</button>
							<button id="admin_complete" style="float: right;">(관리자) 완료</button>						
						</div>
					</div>
					
					
				</td>

			</c:forEach>
		</table>
	
		</div>

	<!-- 
		<details>
			<summary>접기/펼치기</summary>

			접은 내용(ex 소스 코드)
		</details>
		 -->
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
					<li class="pageMaker_btn" ${pageMaker.cri.pageNum==num?"active":""}><a
						href="${num}">${num}</a></li>
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
	<form id = "qnaForm" method="post">
	</form>
	
	
	

	<script>
	var qnaTitle = document.querySelectorAll(".qnaTitle");
	var qnaTitle_update = document.querySelectorAll(".qnaTitle_update");
	var qnaTitle_updateTb = document.querySelectorAll("#qnaTitle_updateTb");
	var qnaNum = document.querySelectorAll(".qnaNum");
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

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/qna/main");
			moveForm.submit();
		});

		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm
									.prepend("<input type='hidden' name='qnaNum' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/qna/showQnA");
							moveForm.submit();
						});

		
		for (let i = 0; i < qnaTitle.length; i++) {
			qnaTitle[i].addEventListener("click", function() {
				$(qnaTd[i]).slideToggle("fast");	
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
				qnaForm.prepend("<input type='hidden' name='qnaNum' value='"
						+ qnaNum[i].innerText + "'>");
				qnaForm.prepend("<input type='hidden' name='qnaTitle' value='"
						+ qnaTitle_updateTb[i].value + "'>");
				qnaForm.prepend("<input type='hidden' name='qnaContent' value='"
						+ qnaContentTf[i].value + "'>");
				qnaForm.attr("action", "/qna/updateQ");
				qnaForm.submit();
			});	
			user_delete_btn[i].addEventListener("click", function() {
				//console.log(qnaNum[i].innerText);
				qnaForm.prepend("<input type='hidden' name='qnaNum' value='"
						+ qnaNum[i].innerText + "'>");
				qnaForm.attr("action", "/qna/deleteQ");
				qnaForm.submit();
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
				qnaForm.prepend("<input type='hidden' name='qnaNum' value='"
						+ qnaNum[i].innerText + "'>");
				qnaForm.prepend("<input type='hidden' name='qnaStatus' value='답변완료'>");
				qnaForm.prepend("<input type='hidden' name='anqContent' value='"
						+ anqContentTf[i].value + "'>");
				qnaForm.attr("action", "/qna/updateA");
				qnaForm.submit();
			});	
			admin_cancel_btn[i].addEventListener("click", function() {				
				$(answer_div[i]).css("display", "block");
				$(answer_update_div[i]).css("display", "none");				
			});	
			
		}
		$("#testbtn").on("click",function(){
			console.log(qnaContentTf[1].value);
		});
		
		
		
	</script>


</body>
</html>