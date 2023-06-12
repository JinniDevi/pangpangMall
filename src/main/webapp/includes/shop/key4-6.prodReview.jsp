<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="<%=request.getContextPath() %>/js/jquery-3.6.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js" type="text/javascript"></script> <!-- 위치 중요 -->
<script src="<%=request.getContextPath() %>/js/prodreview.js" type="text/javascript"></script>

<style type="text/css">
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-rating label {
	-webkit-text-fill-color: transparent;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 2.3px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: gold;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: #fff58c;
}


</style>

<script type="text/javascript">

currentPage = 1;

$(function(){
<%-- 	const cPath ="<%=request.getContextPath()%>"; --%>
	
	// 상품 페이지 리스트
	listProdReviewServer(1, <%=request.getParameter("productNo")%>);
	
	//페이지 번호 클릭 이벤트
	   $(document).on('click','.pagination a.pnum',function () {
	      //alert($(this).text().trim())
	      
	      currentPage = $(this).text().trim();
	      listPageServer(currentPage)
	   })
	   
	   //이전버튼 클릭 이벤트
	   $(document).on('click','a.prev', function () {
	      //alert(parseInt( $('a.pnum').first().text().trim())-1)
	      currentPage = parseInt( $('a.pnum').first().text().trim())-1;
	      listPageServer(currentPage)
	   })
	   
	   //다음버튼 클릭 이벤트
	   $(document).on('click','a.next', function () {
	      //alert(parseInt( $('a.pnum').last().text().trim())+1)
	      currentPage = parseInt( $('a.pnum').last().text().trim())+1;
	      listPageServer(currentPage)
	   })	
	   
})


</script>

<div class="box" style="width: 100%; margin-top: 100px; margin-bottom: 100px;">
</div>

