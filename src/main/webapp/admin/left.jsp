<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link href="/css/reset.min.css" rel="stylesheet" type="text/css">
	<link href="/css/style.css" rel="stylesheet" type="text/css">
	<title>Untitled Document</title>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		$(function() {
			 
			//==> 검색 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			$("li:contains('- 등록')").on("click", function() {
				//var meetingNo = $(this).data("param");
				console.log("여기왔습니까??");
				self.location="/user/insertview";
			});
				
		});	
		
	</script>
</head>
<body>
<div class="box_left">
	<div class="left_top"></div>
	<div class="left_cont">
		<ul class="left_menu">
			<li><img alt="icon" src="/image/left_icon.gif"> 기본정보
				<ul>
					<li>- 등록</li>
				</ul>
			</li>
			<li><img alt="icon" src="/image/left_icon.gif"> 직원명부</li>
			<li><img alt="icon" src="/image/left_icon.gif"> 퇴직자현황</li>
			<li><img alt="icon" src="/image/left_icon.gif"> 예비인력정보</li>
			<li><img alt="icon" src="/image/left_icon.gif"> 거래처정보
				<ul>
					<li>- 등록</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="left_bottom"></div>
	<div class="left_search">
		<label class="left_label"><img alt="icon" src="/image/left_icon.gif"> 경력검색</label>
		<input name="textfield" type="text" class="left_flat" size="9" maxlength="14"> 
		<a href="#"><img alt="search" src="/image/search.gif"></a>
	</div>
</div>
</body>
</html>
