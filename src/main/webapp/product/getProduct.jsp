<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////

<%@ page import="com.model2.mvc.service.domain.*" %>

<%
	Product vo=(Product)request.getAttribute("vo");
%>/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
<%-- 
<%
	String menu = request.getParameter("menu");
%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ��ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
		
			
			//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
			
			


			 $(function() {
				
				 if(${role=='user'}){
						
					 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
						 
						history.go(-1);
					 });
					 
					
					 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
						 var prodNo= $(this).data("param");
							//Debug..
							//alert(  $( "td.ct_btn01:contains('����')" ).html() );
							//<a href="/purchase/addPurchaseView?prodNo=${product.prodNo}">����</a>
							
							//////���� ���߿� ���ľ��� �����ּ� ����  ///////////////////////////////////////
							self.location = "/purchase/addPurchaseView?prodNo="+prodNo+"&menu=user"
					 });
				}else if(${role=='admin'}){			
					
					 $( "td.ct_btn01:contains('Ȯ��')" ).on("click" , function() {
							//Debug..
							//alert(  $( "td.ct_btn01:contains('����')" ).html() );
							//<a href="/product/listProduct?menu=manage"
									
						    //////���� ���߿� ���ľ���  ������///////////////////////////////////////
							self.location = "/product/listProduct?menu=admin"
					});
					
				}else if(${role=='search'}){
					 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
						 
							history.go(-1);
						 });
						 
						
						 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
							 var prodNo= $(this).data("param");
								//Debug..
								//alert(  $( "td.ct_btn01:contains('����')" ).html() );
								//<a href="/purchase/addPurchaseView?prodNo=${product.prodNo}">����</a>
								
								//////���� ���߿� ���ľ��� �����ּ� ����  ///////////////////////////////////////
								
								self.location = "/user/login?redirecturl=/product/getProduct?prodNo="+prodNo
						 });
				}
			});
			
		</script>



</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodNo}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�귣��<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.brandName.brandNam}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.prodName }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�̹��� 
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><img width="300" src="/uppic/${product.fileName}"></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${ product.manuDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.price }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">${product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
		<c:if test="${ role=='admin'}">
			<tr>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
				<!-- 
					<a href="/product/listProduct?menu=manage">Ȯ��</a>
					 -->
					 Ȯ��
					
				</td>
			</tr>
		</c:if>
		<c:if test="${ role !='admin'}">
			<tr>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" data-param="${product.prodNo}" style="padding-top: 3px;">
				<%-- 
					<a href="/purchase/addPurchaseView?prodNo=${product.prodNo}">����</a>
					 --%>
					����
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- 
					<a href="javascript:history.go(-1)">����</a>
					 -->
					 
					 ����
					
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
			</tr>
		</c:if>
		</table>

		</td>
	</tr>
</table>
</form>

</body>
</html>