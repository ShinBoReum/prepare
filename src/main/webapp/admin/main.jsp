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
			$( "#updateProfile" ).on("click" , function() {
				var userno = $('input:checkbox[name="checkbox"]:checked').data("param");

				console.log(userno);
				self.location="/user/updateProfile?userno="+userno;
			});
				
		});	
		
	</script>
</head>
<body>

<div>
	<div style="width:20%; float:left;">
		<jsp:include page="/admin/left.jsp" />
	</div>
	<div style="width:80%; float:right;" >
		<div class="box_right">
	<div class="tit f_bold">
		<img alt="icon" src="/image/icon.gif"> 사원조회
	</div>
	<div class="float_r main_search">
		<select name="select">
			<option selected>::::: 전체 :::::</option>
		</select> 
		<input name="textfield" type="text" class="input"> <a href="#"><img alt="search" src="/image/search.gif"></a>
	</div>
	<div class="main_box clear_b">
	
		<div class="main_tab main_top">
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#" id="updateProfile">수정</a> 
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">인사기록카드</a> 
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">경력정보</a> 
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">근무정보</a>
		</div>
		<!-------------------------  리스트 ------------------------------>
		<table>
			<tr>
				<th width="35px"></th>
				<th width="85px">이름</th>
				<th width="153px">주민번호</th>
				<th width="91px">성별</th>
				<th width="91px">기술등급</th>
				<th width="91px">입사유형</th>
				<th width="94px">근무여부</th>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<c:forEach var="list" items="${list}">
			<tr>
				<td><input type="checkbox" name="checkbox" data-param="${list.user_no}"></td>
				<td>${list.kor_name}</td>
				<td>${list.JUMIN_NO}</td>
				<c:if test="${list.SEX == '1'}">
				<td>남</td>
				</c:if>
				<c:if test="${list.SEX == '2'}">
				<td>여</td>
				</c:if>
				<td>${list.TECH_GRD}</td>
				<td>정규직</td>
				<td>근무</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			</c:forEach>
			<tr>
				<td><input type="checkbox" name="checkbox2" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox3" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox4" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox5" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox6" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox7" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox8" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox9" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
			<tr>
				<td><input type="checkbox" name="checkbox10" value="checkbox"></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr><td colspan="7" class="main_bar"></td></tr>
		</table>
		<div class="main_paging">
			<a href="#"><img alt="prev_more" src="/image/prev.gif"></a>
			<a href="#"><img alt="prev" src="/image/pre.gif"></a>
			&nbsp; 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 &nbsp;
			<a href="#"><img alt="next" src="/image/next.gif"></a>
			<a href="#"><img alt="next_more" src="/image/next_.gif"></a>
		</div>
		<!-------------------------  리스트 ------------------------------>
		<div class="main_tab main_bottom">
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">수정</a> 
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">인사기록카드</a> 
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">경력정보</a> 
			<img alt="all_icon" src="/image/all_icon.gif"> <a href="#">근무정보</a>
		</div>
	</div>
</div>
	</div>
</div>
</body>
</html>
