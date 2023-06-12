<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 레이아웃 --><%@include file="/includes/1.header.jsp"%>
<title>PangPang Mall.</title>
</head>
<body>
	<!-- 레이아웃 --><%@include file="/includes/2.navbar.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/shop/3.shopMain.jsp"%>
<!-- 레이아웃 --><%@include file="/includes/shop/4-1.detailLeftSideMenu2.jsp"%>	

	<!-- 레이아웃 --><%@include file="/includes/shop/4-5.shopDetail.jsp"%>
	<!-- 레이아웃 --><%@include file="/includes/shop/key4-6.prodReview.jsp"%>	
	<!-- 레이아웃 --><%@include file="/includes/5.footer.jsp"%>
</body>
<script type="text/javascript">
function addCart(pid) {

	var cqty = $('#cart_qty').val().trim();
	//var pid = $('#p_id').val().trim();

	$.ajax({ 
		url : '<%=request.getContextPath()%>/cartInsert.do',
		type : 'post',
		data : {"cart_qty" : cqty,
				"p_id" : pid
			},
		dataType : 'json',
		success : function(res) {
			swal("장바구니 담기 성공!","","success");
		},
		error : function(xhr) {
			alert('상태 : ' + xhr.status)
		}

	})

}
</script>
</html>