<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet"  href="../resources/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
    <link rel="stylesheet"  href="../resources/css/admin.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
	
	<style>
		.move:hover {
			color : #8FA691;
		}
	</style>
</head>
<body>

 <%@include file="./idCheck.jsp" %>
 <div class="container">
        <%@include file="./adminSideBar.jsp" %>
            <div class="mainArea">
            
                <!-- BEGIN NAV -->
                <nav class="navTop row">
                    <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
                    <div class="account fr">
                        <div class="name has-submenu"><c:out value="${sessionMember.idNo}"/><span class="fa fa-angle-down"></span></div>
                        <ul class="accountLinks submenu">
                            <li><a href="/">View website</a></li>
                            <li><a href="/member/logout">Log out<span class="fa fa-sign-out fr"></span></a></li>
                        </ul>
                    </div>
                </nav>
                <!-- END NAV -->
                
                <!-- CONTAINER  -->
		        <div class="mainContent">  
		
				  <!-- DETAIL FORM -->
		            <div class="formHeader row">
		                <h2 class="text-1 fl">Q&A 리스트</h2><br><br>
		            </div>
		            <div class="table" style="background: white;">
		                <div class="row bg-1">
		                    <div class="cell cell-50 text-center text-fff">번호</div>
		                    <div class="cell cell-100p text-center text-fff">제목</div>
		                    <div class="cell cell-200 text-fff">회원 ID</div>
		                    <div class="cell cell-200 text-center text-fff">회원 계정</div>
		                    <div class="cell cell-200 text-center text-fff">작성 날짜</div>
		                </div>
		                
		            	<!--   BEGIN LOOP -->
		                <ul>
		                	<c:forEach items="${qna}" var="q">
				               <li class="row cellRow">
				               	  <div class="cell cell-50 text-center"><c:out value="${q.rn}" /></div>
				                  <div class="cell cell-100p text-center">
				                  	<a class='move' href='<c:out value="${q.postingNo}"/>'>
                                    	<c:out value="${q.title }"/>
                                    </a>
                                  </div>
				                  <div class="cell cell-200"><c:out value="${q.idNo }" /></div>
				                  <div class="cell cell-200 text-center"><c:out value="${q.emailAccount }" /></div>
				                  <div class="cell cell-200 text-center"><fmt:formatDate pattern="yyyy/MM/dd" value="${q.regDate}" /></div>
				               </li>
				            </c:forEach>
		                </ul>
			            <!--   END LOOP -->
			        </div>
			        
			        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                    <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                    
			        <div id="pagination" class='page_num'>
	                    <ul class="pagination list-inline text-right">
	                        <c:if test="${pageMaker.prev}">
	                            <li class="paginate_button previous">
	                                <a href="${pageMaker.startPage -1}">&laquo;</a>
	                            </li>
	                        </c:if>
	
	                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	                            <li class='paginate_button ${pageMaker.cri.pageNum == num ? " is-active" : "" } '>
	                                <a href="${num}">${num}</a>
	                            </li>
	                        </c:forEach>
	
	                        <c:if test="${pageMaker.next}">
	                            <li class="paginate_button next">
	                                <a href="${pageMaker.endPage +1 }">&raquo;</a>
	                            </li>
	                        </c:if>
	                    </ul> 
	                </div>
                	<!-- end pagination -->
                	
                	<form id='qnaForm' action="/admin/QnaList" method='get'>
                    	<input type='hidden' name='pageNum' id="pageNum" value='${pageMaker.cri.pageNum}'>
                     	<input type='hidden' name='amount' id="amount" value='${pageMaker.cri.amount}'>
      		 	 	</form>   
                	
	    		</div>
	    	<!-- END CONTAINER  -->
        </div>
	</div>
	

	<script src="../resources/js/admin.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
	    
	    // 페이지 이동 
	    var qnaForm = $("#qnaForm");
	    $(".paginate_button a").on("click", function(e) {
	    	e.preventDefault();
	         
	    	qnaForm.find("input[name='pageNum']").val($(this).attr("href"));
	    	qnaForm.submit();
	    });
	
	
	});
	
	var qnaForm = $("#qnaForm");
	$(".move").on("click",function(e){
	    
	
	    e.preventDefault();
	    qnaForm.append("<input type='hidden' name='postingNo' value = '" + $(this).attr("href") + "'>");
	    qnaForm.attr("action", "/mypage/myQna/get");
	    qnaForm.submit();
	
	 });
	
	</script>
</body>
</html>