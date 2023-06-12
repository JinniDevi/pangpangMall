<!— 상품 클릭시 출력하는 페이지(상품 디테일) —>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%
DecimalFormat decFormat = new DecimalFormat("###,###");
%>

<style>
.tablecenter {
	margin-left: auto;
	margin-right: auto;
}

span {
	font-size: 20px;
}

.paging {
	text-align: center;
}
</style>
<%
// 컨트롤러가 보낸 데이터 받기
ProductVO pvo = (ProductVO) request.getAttribute("viewPage");
%>

<!— 위에 건들지 않고 밑에서부터 작성하기 —>
<div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
	<table class="tablecenter">
		<tbody>
			<tr>
				<td>
					<%
					if (pvo == null) {
					%> 저장된 파일 목록이 없습니다. <%} else {%> <img
					src="<%=request.getContextPath()%>/productView.do?productNo=<%=pvo.getP_id()%>"
					width="400px" height="400px" />
				</td>
				<td><pre>
			<span><%=pvo.getP_name()%></span>
			<%
			if (pvo.getP_size() == null) {
			} else {
			%>
			상품 사이즈 : <%=pvo.getP_size()%>
						<%}%>
			상품 가격 : <%=(decFormat.format( pvo.getP_price() ) ) %> 원
			상품 마일리지 : <%=pvo.getP_mileage()%>
			상품 등록일 : <%=pvo.getP_date()%>
			<%
			if (pvo.getP_qty() < 1) {
			} else {
			%>상품 재고 수량 : <%=pvo.getP_qty()%>개
			<%
			}
			%>
            </pre></td>
			</tr>
		</tbody>
		<%}%>
	</table>
	<table class="tablecenter">
		<tbody>
			<tr>
				<td>
					<%
					if (pvo == null) {
					%> 저장된 파일 목록이 없습니다. <%} else {%>
				</td>
				<td><pre>
		<%
		if (pvo.getP_detail() == null) {
		} else {
		%>
		<%=pvo.getP_detail()%>
		<%
		}
		%>
            </pre></td>
			</tr>
		</tbody>
		<%}%>
	</table>
	<table class="tablecenter">
	</table>
	<form action="">

		<div>
			<span style="display: inline-block; position: relative; top: -18px;">수량 : </span>
			<span style="display: inline-block;"><input type="number" id="cart_qty"
				name="cart_qty" value="1" placeholder="수량을 입력하세요."
				style="border: solid 1px #ddd; width: 120px; height: 50px;"></span>
		</div>
		<input type="button" class="btn btn-black"
			onclick="addCart(<%=pvo.getP_id()%>)" style="width: 100%"
			value="장바구니 담기">
		<!--수정		상품 주문하기버튼 action에 경로 넣어주기 -->
	</form>
</div>