<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	//무한스크롤
	var loading = false;
	var scrollPage = 1;
	
	$(window).scroll(function() {
	   if ($(window).scrollTop() +5 >= $(document).height() - $(window).height()) {
	   		if(!loading){
	   			scrollPage++;
	   			infinity();
	   		}
	   }
	});
	
	function infinity() {
		loading = true;
			$.ajax({
                type     : 'POST',
                url      : '/user/json/listUser',
                data     : JSON.stringify({
                	page : scrollPage  
                }), // 다음 페이지 번호와 페이지 사이즈를 가지고 갑니다.
                dataType : 'json',
                contentType: "application/json",
                success : function(data) {
                	var displayValue = "";
                	data.forEach(function (el , index) {
                		displayValue += "<tr class='ct_list_pop'>"
                		+	"<td style='text-align: center; vertical-align: middle;' width='150' height='150'><img src='/images/pro.jpg' width='150' height='150'/></td>"
                		+  "<td style='text-align: center; vertical-align: middle;'  title='Click : 회원정보 확인'>" + el.userId + "</td>"
                		+  "<td style='text-align: center; vertical-align: middle;'>" + el.userName + "</td>"
                		+  "<td style='text-align: center; vertical-align: middle;'>" + el.email + "</td>"
                		+  "<td style='text-align: center; vertical-align: middle;'><i class='glyphicon glyphicon-ok' id='" + el.userId + "'></i><input type='hidden' value='" + el.userId + "'> " 
                		+  "</td></tr>";	
                	})	
                	
                	$( "#addlist" ).append(displayValue);

                	$(  "td:nth-child(5) > i" ).on("click" , function() {

    					var userId = $(this).next().val();
    				
    					$.ajax( 
    							{
    								url : "/user/json/getUser/"+userId ,
    								method : "GET" ,
    								dataType : "json" ,
    								headers : {
    									"Accept" : "application/json",
    									"Content-Type" : "application/json"
    								},
    								success : function(JSONData , status) {

    									var displayValue = "<h6>"
    																+"아이디 : "+JSONData.userId+"<br/>"
    																+"이  름 : "+JSONData.userName+"<br/>"
    																+"이메일 : "+JSONData.email+"<br/>"
    																+"ROLE : "+JSONData.role+"<br/>"
    																+"등록일 : "+JSONData.regDateString+"<br/>"
    																+"</h6>";
    									$("h6").remove();
    									$( "#"+userId+"" ).html(displayValue);
    								}
    						});
    					
                    });

                    $( "td:nth-child(2)" ).on("click" , function() {
                         self.location ="/user/getUser?userId="+$(this).text().trim();
                    });

                    $( "td:nth-child(2)" ).css("color" , "red");

                    $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
                    $("h7").css("color" , "red");

                    $(".ct_list_pop:nth-child(4n+7)" ).css("background-color" , "whitesmoke");

                    loading = false;
                }
						
				
            });
	}
	

		function fncGetUserList(page) {
			$("#page").val(page)
			$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
		}
		
		//auto complete
		 $(function() {
			 $('#searchKeyword').autocomplete(
						{
							source : function(request, response) { //source: 입력시 보일 목록
								
								var con = $("#searchCondition").val();
							     $.ajax({
							           url : "/user/json/autocomplete"   
							         , type : "POST"
							         , dataType: "JSON"
							         , data : {value: request.term, con}	// 검색 키워드
							         , success : function(data){ 	// 성공
							             response(
							                 $.map(data.autoList, function(item) {
							                	 if(con == 0){
								                	 return {
								                    	     label : item.USER_ID  	// 목록에 표시되는 값
								                           , value : item.USER_ID   		// 선택 시 input창에 표시되는 값
								                     };
							                     } else if (con == 1){
								                    	 return {
								                    	     label : item.USER_NAME  	// 목록에 표시되는 값
								                           , value : item.USER_NAME   		// 선택 시 input창에 표시되는 값
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
						      
							 }
					});
		 })

		 $(function() {
		
			$( "td:nth-child(2)" ).on("click" , function() {
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
						
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	

		 $(function() {
			 
			 $("#btn_search").on("click" , function() {
					fncGetUserList('${resultPage.page}');
				});
			 
			 
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					var userId = $(this).next().val();
				
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"아이디 : "+JSONData.userId+"<br/>"
																+"이  름 : "+JSONData.userName+"<br/>"
																+"이메일 : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"등록일 : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
					
			});
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>회원목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  회원수 ${resultPage.totalCount }
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>회원ID</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>회원명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
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
            <th style="text-align: center; vertical-align: middle;">No</th>
            <th style="text-align: center; vertical-align: middle;">회원 ID</th>
            <th style="text-align: center; vertical-align: middle;">회원명</th>
            <th style="text-align: center; vertical-align: middle;">이메일</th>
            <th style="text-align: center; vertical-align: middle;">간략정보</th>
          </tr>
        </thead>
       
		<tbody id="addlist">
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop">
			  <td style="text-align: center; vertical-align: middle;" width="150" height="150"><img src="/images/pro.jpg" width="150" height="150"/></td>
			  <td style="text-align: center; vertical-align: middle;"  title="Click : 회원정보 확인">${user.userId}</td>
			  <td style="text-align: center; vertical-align: middle;">${user.userName}</td>
			  <td style="text-align: center; vertical-align: middle;">${user.email}</td>
			  <td style="text-align: center; vertical-align: middle;">
			  	<i class="glyphicon glyphicon-ok" id= "${user.userId}"></i>
			  	<input type="hidden" value="${user.userId}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

	
</body>

</html>