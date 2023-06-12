<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="untree_co-section pt-3">
    <div class="container">

      <div class="row align-items-center mb-5">
        <div class="col-lg-8">
          <h2 class="mb-3 mb-lg-0">My Page</h2>
        </div>
        <div class="col-lg-4">

        </div>
      </div>

      <div class="row">

        <div class="col-md-3">
          <ul class="list-unstyled categories">
            <li><a href="<%=request.getContextPath()%>/payList.do"">주문조회</a></li>
            <li><a href="<%=request.getContextPath()%>/includes/member/key0.mypageIndex.jsp">회원정보</a></li>
            <li><a href="<%=request.getContextPath()%>/includes/board/key0.mypageboardIndex.jsp">게시물관리</a></li>
            <li><a href="<%=request.getContextPath()%>/review/key0.myreviewIndex.jsp">리뷰관리</a></li>
          </ul>
        </div>
