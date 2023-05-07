<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- ToolBar Start /////////////////////////////////////-->

 <div class="navbar-wrapper ">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/">Model2 MVC Shop</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="#">개인정보조회</a></li>
                <c:if test = "${user.userId eq 'admin'}" >
                	<li><a href="#">회원정보조회</a></li>
                </c:if>
                <li><a href="#">로그아웃</a></li>
                <li><a href="#">지도</a></li>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">상     품<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                  <c:if test = "${user.userId eq 'admin'}" >
	                    <li><a href="#">판매상품등록</a></li>
	                    <li><a href="#">판매상품관리</a></li>
	              </c:if>
	              <c:if test = "${user.role eq 'user'}" >
						<li><a href="#">구매이력조회</a></li>
				  </c:if>	
	                <li role="separator" class="divider"></li>
                    <li><a href="/">메인홈</a></li>
                    <li><a href="#">최근 본 상품</a></li>
                  </ul>
                </li>    
           </div>
           
            
          </div>
        </nav>

      </div>
    </div>

   	
   	<script type="text/javascript">
		
	   	function history(){
			popWin = window.open("/WEB-INF/views/history",
			"popWin",
			"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
   	
	 	$(function() {
		 	$("a:contains('로그아웃')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
			}); 
		 });
	 	
	 	$(function() {
		 	$("a:contains('지도')").on("click" , function() {
				$(self.location).attr("href","http://192.168.0.31:5173");
			});
		 });
		
		 $(function() {
		 	$("a:contains('회원정보조회')").on("click" , function() {
				$(self.location).attr("href","/user/listUser");
			}); 
		 });
		
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
	 	
	 	$( "a:contains('판매상품등록')" ).on("click" , function() {
	 		$(self.location).attr("href","/product/addProductView.jsp;");
		});
	 	
		$( "a:contains('판매상품관리')" ).on("click" , function() {
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
		
		$( "a:contains('구매이력조회')" ).on("click" , function() {
			$(self.location).attr("href","/purchase/listPurchase");
		});
		
		$( "a:contains('메인홈')" ).on("click" , function() {
		    $(self.location).attr("href","WEB-INF/views/index");
		});
		
		$( "a:contains('최근 본 상품')" ).on("click" , function() {
			history();
		});
		
	</script>  