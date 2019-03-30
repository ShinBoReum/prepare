<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
			$( "#sub" ).on("click" , function() {
				console.log("gkgk");
				//self.location="/user/updateProfile";
				$("form").attr("method" , "POST").attr("action" , "/user/updateProfile").submit();
			});
				
		});	
		
	</script>
</head>
<body>
<div style="width:20%; float:left;">
		<jsp:include page="/admin/left.jsp" />
	</div>
	<div style="width:80%; float:right;" >
<div class="box_right">
	<div class="tit f_bold">
		<img alt="icon" src="/image/icon.gif"> 사원 기본 정보 수정
	</div>
	<div class="page_menu f_bold">
		<ul class="li_left">
			<li><a href="#">교육정보</a></li>
			<li>|</li>
			<li><a href="#">자격증. 보유기술정보</a></li>
			<li>|</li>
			<li><a href="#">프로젝트 정보</a></li>
			<li>|</li>
			<li><a href="#">경력정보</a></li>
			<li>|</li>
			<li><a href="#">근무정보</a></li>
		</ul>
	</div>
	
	<div class="page_box">
	<form action="" method="get">
	<input type="hidden" name="user_no" value="${user.user_no }">
		<div class="page_in float_h">
			<div class="picture_pr float_l"><img alt="증명사진" src=""></div>
			<div class="page_mar2 float_l">
				<div class="page_mar1">
					<label class="page4_1">한글이름 : </label>
					<input type="text" name="kor_name" value="${user.kor_name}">
				</div>
				<div class="page_mar1">
					<label class="page4_1">영문이름 : </label>
					<input type="text" name="ENG_NAME" value="${user.ENG_NAME}">
				</div>
				<div class="page_mar1">
					<label class="page4_1">한문이름: </label>
					<input type="text" name="HAN_NAME" value="${user.HAN_NAME}">
				</div>
				<div class="page_mar1">
					<label class="page4_1">주민등록번호 : </label>
					<c:set var="list" value="${fn:split(user.JUMIN_NO,'-')}" />

					<input name="JUMIN_NO" type="text" size="6" maxlength="6" value="${list[0]}"> - <input name="textfield3222" type="text" size="7" maxlength="7" value="${list[1]}">
				</div>
			</div>
		</div>
		<div class="page_in clear_b">
			<div class="page_line page_mar1">
				<label class="page4_1">사진파일명 : </label>
				<input name="SAJIN_NM" type="text" size="40" value="${user.SAJIN_NM }"> <font color="#FF0000"><img src="/image/bt_search.gif" width="49" height="18"></font>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">생년월일 : </label>
				<c:set var="birth" value="${fn:split(user.BIRTH_YMD,'/')}" />
				<input name="BIRTH_YMD" type="text" size="8" value="${birth[0] }"> 년 <input name="textfield3322" type="text" size="5" value="${birth[1] }"> 월 <input name="textfield33222" type="text" size="5" value="${birth[2] }"> 일 ( <input type="radio" name="radiobutton" value="radiobutton"> 양력 <input type="radio" name="radiobutton" value="radiobutton"> 음력 )
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">성별 : </label>
				<c:if test="${user.SEX == '1' }">
				<input type="radio" name="SEX" value="1" checked> 남자 <input type="radio" name="SEX" value="2" > 여자
				</c:if>
				<c:if test="${user.SEX == '2' }">
				<input type="radio" name="SEX" value="1" > 남자 <input type="radio" name="SEX" value="2" checked> 여자
				</c:if>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">결혼유무 : </label>
				<c:if test="${user.SEX == '1' }">
				<input type="radio" name="SEX" value="1" checked> 남자 <input type="radio" name="SEX" value="2" > 여자
				</c:if>
				<c:if test="${user.SEX == '2' }">
				<input type="radio" name="SEX" value="1" > 남자 <input type="radio" name="SEX" value="2" checked> 여자
				</c:if>
				<input type="radio" name="MARRY_YN" value="0"> 미혼 <input type="radio" name="MARRY_YN" value="1"> 기혼
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">년차 : </label>
				<input name="WORK_YEAR" type="text" size="10">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">급여 지급유형 : </label>
				<select name="select">
					<option>월급</option>
				</select>
			</div>
			<div class="page_line page_mar1">
				<label class="HOPE_WORK">희망직무 : </label>
				<select name="select2">
					<option>SI</option>
					<option>SM</option>
				</select>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">입사유형 : </label>
				<select name="JOIN_ST">
					<option value="0">정규직</option>
					<option value="1">계약직</option>
				</select>
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">주소 : </label>
				<input name="ADDR" type="text" size="10"> <input name="textfield333" type="text" size="40">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">연락처 : </label>
				<input name="TEL" type="text" size="10"> - <input name="textfield332422" type="text" size="10"> - <input name="textfield332423" type="text" size="10">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">이메일 : </label>
				<input name="EMAIL" type="text" size="20">
			</div>
			<div class="page_line page_mar1">
				<label class="page4_1">기술등급 : </label>
				<input name="TECH_GRD" type="text" size="20" value="${user.TECH_GRD }">
			</div>
			<div class="page_mar1">
				<label class="page4_1">주량 : </label>
				<input name="ALC_QT" type="text" size="20">
			</div>
		</div>
		</form>
		<div class="btn_all">
			<button type="submit" ><img alt="remove" src="/image/bt_remove.gif" id="sub"></button>
			<button type="reset"><img alt="cancel" src="/image/bt_cancel.gif"></button>
		</div>
	</div>
	</div>
	
</div>
</body>
</html>