<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/qna/postQnA.css">
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
	<h1>Q&A 등록</h1>
	
		<div class="input_wrap">
			제목: <input type="text" id = "qnaTitle" name="qnaTitle">
		</div>
		<div class="input_wrap">
			내용: <textarea id="qnaContent" rows="3" name="qnaContent"></textarea>
		</div>
		
		<button class="btn">등록</button>	
	<script>
	let qnaT = document.getElementById("qnaTitle");
	let qnaC = document.getElementById("qnaContent");
	
	$(".btn").on("click",function(){
		const data = {
		         id : '${member.id}',
		         prodNum : '${prodNum}',
		         qnaContent : qnaC.value,
		         qnaTitle : qnaT.value
		   }
		$.ajax({
         url: '/qna/postQnA',
         type: 'POST',
         data: data,
         success: function(result){        	 
        		 alert(result);
        		 opener.location.reload();
        		 self.close();        	
         },error : function(request, status,
                 error) {
             alert("code:" + request.status
                   + "\n" + "message:"
                   + request.responseText
                   + "\n" + "error:"
                   + error);
          }
      })
	})
	
	</script>
</body>
</html>