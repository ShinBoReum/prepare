<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  ȸ������ DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >ȸ������</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">����������ȸ</a></li>
	                         <c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">ȸ��������ȸ</a></li>
	                         </c:if>
	                         
	                         <li class="divider"></li>
	                         
	                     </ul>
	                 </li>
	                 
	              <!-- �ǸŻ�ǰ���� DrowDown  -->
	               <c:if test="${sessionScope.user.role == 'admin'}">
		              <li class="dropdown">
		                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                         <span >�ǸŻ�ǰ����</span>
		                         <span class="caret"></span>
		                     </a>
		                     <ul class="dropdown-menu">
		                         <li><a href="#">�ǸŻ�ǰ���</a></li>
		                         <li><a href="#">�ǸŻ�ǰ����</a></li>
		                         <li class="divider"></li>
		                         
		                     </ul>
		                </li>
	                 </c:if>
	                 
	              <!-- ���Ű��� DrowDown -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >��ǰ����</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">�� ǰ �� ��</a></li>
	                         <li><a href="#">�� �� �� ��</a></li>
	                         
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">�����̷���ȸ</a></li>
	                         </c:if>
	                         
	                         <li><a href="history()">�ֱٺ���ǰ</a></li>
	                         <li class="divider"></li>
	                        
	                     </ul>
	                 </li>
	                 
	                 
	             </ul>
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<li>
	             	<c:if test="${empty sessionScope.user}">
	             	<a href="/user/login">�α���</a>
	                </c:if>
	                <c:if test="${!empty sessionScope.user}">
	                <a href="#">�α׾ƿ�</a>
	                </c:if>
	                </li>
	             
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	</div>
</div>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('�α׾ƿ�')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
			
		 	$( "a:contains('�ǸŻ�ǰ���')" ).on("click" , function() {
				
		 		 self.location = "/product/addProductView" 
			}); 
		 	
		 	$( "a:contains('�ǸŻ�ǰ����')" ).on("click" , function() {
				
		 		 self.location = "/product/listProduct"
		 		
			});
		 	
		 	$( "a:contains('�� ǰ �� ��')" ).on("click" , function() {
				
		 		self.location = "/product/listProduct"
		 		
			});
		 	
			$( "a:contains('�� �� �� ��')" ).on("click" , function() {
				
		 		self.location = "/brand/compareCar"
		 		
			});
		 	
		 	
		 	$( "a:contains('�����̷���ȸ')" ).on("click" , function() {
				
				
		 		self.location ="/purchase/listPurchase" 
		 	
			});
		 	
		 	$( "a:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {
				
				
		 		history();
		 		 
			});
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		if(${empty sessionScope.user}){
	 			if (confirm("�α����� �̿밡�� �մϴ�.\n�α��� �Ͻðڽ��ϱ�?") == true){    //Ȯ��
					 
					 self.location="/user/login"

				     //document.removefrm.submit();

				 }else{   //���

				     return;

				 }
	 			
	 		}else{
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
	 		}
	 	});
		
	</script>  