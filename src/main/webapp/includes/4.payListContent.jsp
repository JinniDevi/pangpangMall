<%@page import="kr.or.ddit.vo.PayListVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PayListVO> payList = (List<PayListVO>) request.getAttribute("payList");
DecimalFormat decFormat = new DecimalFormat("###,###");
%>
<script src="<%=request.getContextPath() %>/js/review.js" type="text/javascript"></script>
<html>
<head>
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
$(function(){
	$('#wrModal').on('show.bs.modal', function () {
	      
		
	})
	
	$('.wrsend').on('click', function(){
    	 	var rCont = $(this.form).find('.txt').val().trim();
    		var rRate = $(this.form).find('[name=re_rate]:checked').val();
    		var pId = $(this.form).find('.pId').val().trim();
    		var pNo = $(this.form).find('.pNo').val().trim();
    		
    		console.log("rCont", rCont);
    		console.log("rRate", rRate);
    		console.log("pId", pId);
         //입력한 모든 값을 가져온다 - 
//          formdata = $('#wrform').serialize();
//          formdata = $('#wform').serializeArray();
//          formdata = $('#wform').serializeJSON();
         
         insertReviewWriteServer(rCont, rRate, pId, pNo);
 		
 		$('#wModal').modal('hide');
 		$('.txt').val("");
         
      })
	
	
})



</script>
</head>
</html>

<div class="untree_co-section">
	<div class="container">
		<div class="row mb-5">
			<form class="col-md-12" method="post">
				<div class="site-blocks-table">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th class="product-select">NO</th>
								<th class="product-thumbnail">Images</th>
								<th class="product-name">Name</th>
								<th class="product-price">Price</th>
								<th class="product-quantity">Qty</th>
								<th class="product-total">Total</th>
								<th class="product-status">Status</th>
								<th class="product-remove">Cancel</th>
								<th class="product-review">Review</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<%
								if (payList == null || payList.size() == 0) {
								%>
								<td colspan="5">장바구니에 상품이 없습니다.<td>
								<%
								} else {
									int index = 0;
									for (PayListVO payListVO : payList) {
										index++;
								%>
								<td class="product-select payListRowSpanTd pNum">
									<%=payListVO.getPay_no()%>
								</td>
								<td class="product-thumbnail"><img
									src="<%=request.getContextPath()%>/productView.do?productNo=<%=payListVO.getP_id()%>" alt="Image"
									class="img-fluid"></td>
								<td class="product-name">
									<h2 class="h5 text-black"><%=payListVO.getP_name()%></h2>
								</td>
								<td style="white-space: nowrap;"><%=decFormat.format(payListVO.getP_price())%> 원</td>
								<td>
									<%=decFormat.format(payListVO.getPs_qty()) %>
								</td>
								<td style="white-space: nowrap;"><%=(decFormat.format(payListVO.getP_price() * payListVO.getPs_qty()))%> 원</td>
								<td class="payListRowSpanTd" style="white-space: nowrap;">
								<%
								if(payListVO.getPay_status()==1){
								%>
								결제완료
								<%
								}else if(payListVO.getPay_status()==2){
								%>
								결제실패
								<%	
								}else if(payListVO.getPay_status()==4){
								%>
								취소완료
								<%	
								}
								%>
								<span style="display:none"><%=payListVO.getPay_no() %></span>
								</td>
								<td class="payListRowSpanTd">
								<% if(payListVO.getPay_status()==1){  %>
									<a href="#" class="btn btn-black btn-sm" style="width: max-content;" onclick="cancelPay(<%=payListVO.getPay_no()%>)">주문취소<span style="display:none"><%=payListVO.getPay_no() %></span></a>
								<%	}else { %>
								<span style="display:none"><%=payListVO.getPay_no() %></span>
									-
								<% }  %>	
								</td>
								<td>
								<%
								if(payListVO.getPay_status()==1){
								%>
									<button type="button" class="btn btn-black" style="width: max-content;" data-toggle="modal" data-target="#wrModal<%=index%>" data-whatever="@mdo">리뷰 등록</button>
									<div class="modal fade" id="wrModal<%=index%>" tabindex="-1" aria-labelledby="wrModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									    
									      <div class="modal-header">
									        <h5 class="modal-title" id="wrModalLabel">리뷰 등록</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>      
									      </div>
									      
									      <div class="modal-body">
									        <form id="wrformi<%=index %>" name="wrform">
									        	<input type="hidden" class="pId" value="<%=payListVO.getP_id()%>">
									        	<input type="hidden" class="pNo" value="<%=payListVO.getPay_no()%>">
									        	
									          <label>평점</label>
										         	<div class="star-rating space-x-4 mx-auto">
														<input type="radio" id="5<%=index %>-stars" name="re_rate" value="5" v-model="ratings" /> <label for="5<%=index %>-stars" class="star pr-4">★</label>
														<input type="radio" id="4<%=index %>-stars" name="re_rate" value="4" v-model="ratings" /> <label for="4<%=index %>-stars" class="star">★</label> 
														<input type="radio" id="3<%=index %>-stars" name="re_rate" value="3" v-model="ratings" /> <label for="3<%=index %>-stars" class="star">★</label> 
														<input type="radio" id="2<%=index %>-stars" name="re_rate" value="2" v-model="ratings" /> <label for="2<%=index %>-stars" class="star">★</label> 
														<input type="radio" id="1<%=index %>-star" name="re_rate" value="1" v-model="ratings" /> <label for="1<%=index %>-star"	class="star">★</label>
													</div>
									         	
									         	<label>리뷰 내용</label>
									         	<textarea style="width: 100%;" class="txt" name="re_content" rows="10" cols="60"></textarea><br>
									         	
									         	<input type="button" value="작성완료" class="wrsend">
									        </form>
									      </div>
									      
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									      </div>
									    </div>
									  </div>
									</div>
									<%} %>
								</td>
							</tr>
							<%
									}
								}
							%>

						</tbody>
					</table>
				</div>
			</form>
		</div>

<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-6"> -->
<!-- 				<div class="row mb-5"> -->
<!-- 					<div class="col-md-6 mb-3 mb-md-0"> -->
<!-- 						<button class="btn btn-black btn-sm btn-block">Update -->
<!-- 							Cart</button> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<button class="btn btn-outline-black btn-sm btn-block">Continue -->
<!-- 							Shopping</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<label class="text-black h4" for="coupon">Coupon</label> -->
<!-- 						<p>Enter your coupon code if you have one.</p> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-8 mb-3 mb-md-0"> -->
<!-- 						<input type="text" class="form-control py-3" id="coupon" -->
<!-- 							placeholder="Coupon Code"> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-4"> -->
<!-- 						<button class="btn btn-black">Apply Coupon</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="col-md-6 pl-5"> -->
<!-- 				<div class="row justify-content-end"> -->
<!-- 					<div class="col-md-7"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12 text-right border-bottom mb-5"> -->
<!-- 								<h3 class="text-black h4 text-uppercase">Cart Totals</h3> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="row mb-3"> -->
<!-- 							<div class="col-md-6"> -->
<!-- 								<span class="text-black">Subtotal</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-6 text-right"> -->
<!-- 								<strong class="text-black">$230.00</strong> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="row mb-5"> -->
<!-- 							<div class="col-md-6"> -->
<!-- 								<span class="text-black">Total</span> -->
<!-- 							</div> -->
<!-- 							<div class="col-md-6 text-right"> -->
<!-- 								<strong class="text-black">$230.00</strong> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="row"> -->
<!-- 							<div class="col-md-12"> -->
<!-- 								<button class="btn btn-black btn-lg py-3 btn-block" -->
<!-- 									onclick="orderProductSelected()">Proceed To -->
<!-- 									Checkout</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
</div>
