<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<title>상품조회</title>

	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
	<script type="text/javascript">

		$(function() {
             $( "#back" ).on("click" , function() {
                    self.location = "/";
             });

			 $( "#add" ).on("click" , function() {
					self.location = "/purchase/addPurchase?prod_no=${pro.prodNo}";
			 });
		});
		
	</script>


</head>

<body bgcolor="#ffffff" text="#000000">

 <jsp:include page="/layout/toolbar.jsp" />

<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품 번호</strong></div>
			<div class="col-xs-8 col-md-4">${pro.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${pro.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 " ><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">
			<td class="ct_write01">
				<c:forEach var= "ima" items="${image}">
					<img src = "../images/uploadFiles/${ima}" width="150" height="150"/>
				</c:forEach>
			</td>
		</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${pro.prodDetail}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${pro.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${pro.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일</strong></div>
			<div class="col-xs-8 col-md-4">${pro.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<c:if test = "${sessionScope.user.userId ne 'admin'}" >
	  				<button type="button" class="btn btn-primary" id="add">구매</button>
	  			</c:if>
				<button type="button" class="btn btn-danger" id="back" onclick="history.back()">이전</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>

</body>
</html>