<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
	<script type="text/javascript">

	
		//auto complete
		$(function(){
			$('#searchKeyword').autocomplete(
			{
				source : function(request, response) { //source: 입력시 보일 목록
					
					var con = $("#searchCondition").val();
				     $.ajax({
				           url : "/product/json/autocomplete"   
				         , type : "POST"
				         , dataType: "JSON"
				         , data : {value: request.term, con}	// 검색 키워드
				         , success : function(data){ 	// 성공
				             response(
				                 $.map(data.autoList, function(item) {
				                	 if(con == 0){
					                	 return {
					                    	     label : item.PROD_NO  	// 목록에 표시되는 값
					                           , value : item.PROD_NO   		// 선택 시 input창에 표시되는 값
					                     };
				                     } else if (con == 1){
					                    	 return {
					                    	     label : item.PROD_NAME  	// 목록에 표시되는 값
					                           , value : item.PROD_NAME   		// 선택 시 input창에 표시되는 값
					                     }; 
				                     } else if (con == 2){
				                    	 return {
				                    	     label : item.PRICE  	// 목록에 표시되는 값
				                           , value : item.PRICE   		// 선택 시 input창에 표시되는 값
				                    	 };
				                     }
				                 })
				             );    //response
				         }
				         ,error : function(){ //실패
				             alert("오류가 발생했습니다.");
				         }
				     });
				}
				,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
						return false;
				}
				,minLength: 1// 최소 글자수
				,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
				,delay: 100	//autocomplete 딜레이 시간(ms)
				,select : function(evt, ui) { 
			      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
						//console.log(ui.item.label);
						//console.log(ui.item.idx);
				 }
			});
		})	
		

	function fncGetProductList(page, type){
		$("#page").val(page);
		$("#type").val(type);
		$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();
	}

	
	$(function() {
		
		$("#btn_search").on("click" , function() {
			 fncGetProductList('${resultPage.page}','${param.menu}');
		});
		
		 	 
		$( ".ct_list_pop td:nth-child(2)" ).on("click" , function() {
			if($(this).find("input").val() != null){
				self.location = "/product/updateProduct?prodNo=" + $(this).find("input").val();
			} else if ($(this).find("input").val() == null){
				
			}
		});
		
				
		$( ".ct_list_pop td:nth-child(2)" ).css("color" , "blue");
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	});	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
  

 <div class="container">
	
		<div class="page-header text-info">
	       <h3>상품 목록</h3>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체 상품 ${resultPage.totalCount } 개
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0" ${param.searchCondition == '0' ? "selected" : ""} >상품번호</option>
						<option value="1" ${param.searchCondition == '1' ? "selected" : ""} >상품명</option>
						<option value="2" ${param.searchCondition == '2' ? "selected" : ""} >상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}" placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="btn_search">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="page" name="page" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr>
            <th style="text-align: center; vertical-align: middle;">상품이미지</th>
            <th style="text-align: center; vertical-align: middle;">상품명</th>
            <th style="text-align: center; vertical-align: middle;">가 격</th>
            <th style="text-align: center; vertical-align: middle;">등록일</th>
            <th style="text-align: center; vertical-align: middle;">현재상태</th>
          </tr>
        </thead>
        

		  <c:forEach var="i" items="${list}">
			<c:set var="num" value="${ num+1 }" />
									
			<tr class="ct_list_pop">
			  <td style="text-align: center; vertical-align: middle;" width="150" height="150"><img src="/images/uploadFiles/${fn:split(i.fileName, '/')[0]}" width="150" height="150"/></td>
			  <c:choose>
				  <c:when test = "${ fn:trim(i.tranCode) eq '' }">
				 	 <td style="text-align: center; vertical-align: middle;" >${i.prodName} <input type="hidden" value="${i.prodNo}" id="prodNo"  /></td>
				 </c:when>
			 	 <c:otherwise>
				 	  <td style="text-align: center; vertical-align: middle;" >${i.prodName} (품절) </td>
				 </c:otherwise>
			 </c:choose>
			  <td style="text-align: center; vertical-align: middle;">${i.price}</td>
			  <td style="text-align: center; vertical-align: middle;">${i.regDate}</td>
			  <td style="text-align: center; vertical-align: middle;">		

					
					<c:if test = "${ sessionScope.user.userId eq 'admin'}" >
						<c:choose>
							<c:when test = "${ fn:trim(i.tranCode) eq '' }">
								판매중
							</c:when>
							<c:when test = "${ fn:trim(i.tranCode) eq '1' and (param.menu == 'manage')}" >
								구매완료 <a href="/purchase/updateTranCodeByProd?prodNo=${i.prodNo}&tranCode=2">배송하기</a>
							</c:when>
							<c:when test = "${ fn:trim(i.tranCode) eq '1' and (param.menu != 'manage')}" >
								구매완료
							</c:when>
							<c:when test = "${ fn:trim(i.tranCode) eq '2' }" >
								배송중
							</c:when>
							<c:otherwise>
							 	배송완료
							 </c:otherwise>
						</c:choose>
					</c:if>
					

					<c:if test = "${sessionScope.user.userId ne 'admin'}" >
						<c:choose>
							<c:when test = "${ fn:trim(i.tranCode) eq '' }">
								판매중
							</c:when>
							<c:otherwise>
							 	재고없음
							 </c:otherwise>
						</c:choose>
					</c:if>
								  
			  </td>
			</tr>
          </c:forEach>
        
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>

<input type="hidden" id="page" name="page" value=""/>
<input type="hidden" id="type" name="type" value=""/>

<jsp:include page="../common/pageNavigator_new.jsp"/>

</body>
</html>