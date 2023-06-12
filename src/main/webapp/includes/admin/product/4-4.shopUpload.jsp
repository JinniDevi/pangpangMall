<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /*
* Template Name: UntreeStore
* Template Author: Untree.co
* Author URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="" />

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/animate.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <title>Product</title>
<script type="text/javascript">
  $(document).ready(function () {
    var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function () {
      if (window.FileReader) {
        // 파일명 추출
        var filename = $(this)[0].files[0].name;
      } else {
        // Old IE 파일명 추출
        var filename = $(this).val().split('/').pop().split('\\').pop();
      }
      $(this).siblings('.upload-name').val(filename);
    });

    //preview image
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function () {
      var parent = $(this).parent();
      parent.children('.upload-display').remove();

      if (window.FileReader) {
        //image 파일만
        if (!$(this)[0].files[0].type.match(/image\//)) return;

        var reader = new FileReader();
        reader.onload = function (e) {
          var src = e.target.result;
          parent.prepend(
            '<div class="upload-display"><div class="upload-thumb-wrap"><img src="' +
              src +
              '" class="upload-thumb"></div></div>'
          );
        };
        reader.readAsDataURL($(this)[0].files[0]);
      } else {
        $(this)[0].select();
        $(this)[0].blur();
        var imgSrc = document.selection.createRange().text;
        parent.prepend(
          '<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'
        );

        var img = $(this).siblings('.upload-display').find('img');
        img[0].style.filter =
          "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" +
          imgSrc +
          '")';
      }
    });
  });
</script>

<style type="text/css">
html, body {
	min-height: 100%;
}

body, div, form, input, select, p {
	padding: 0;
	margin: 0;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 14px;
	color: #666;
	line-height: 22px;
}

h1 {
	margin: 15px 0;
	font-weight: 400;
}



form {
	width: 100%;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 5px #ccc;
}

input, select, textarea {
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

input:hover, select:hover, textarea:hover {
	outline: none;
	border: 1px solid #095484;
}

input {
	width: calc(100% - 10px);
	padding: 5px;
}

select {
	width: 100%;
	padding: 7px 0;
	background: transparent;
}

textarea {
	width: calc(100% - 6px);
}

.item {
	position: relative;
	margin: 10px 0;
}

input[type='date']::-webkit-inner-spin-button {
	display: none;
}

.item i, input[type='date']::-webkit-calendar-picker-indicator {
	position: absolute;
	font-size: 20px;
	color: #a9a9a9;
}

.item i {
	right: 2%;
	top: 30px;
	z-index: 1;
}

[type='date']::-webkit-calendar-picker-indicator {
	right: 1%;
	z-index: 2;
	opacity: 0;
	cursor: pointer;
}

.btn-block {
	margin-top: 20px;
}

button {
	width: 150px;
	padding: 10px;
	border: none;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	background-color: #095484;
	font-size: 16px;
	color: #fff;
	cursor: pointer;
}

button:hover {
	background-color: #0666a3;
}

body {
	margin: 10px;
}

.where {
	display: block;
	margin: 25px 15px;
	font-size: 11px;
	color: #000;
	text-decoration: none;
	font-family: verdana;
	font-style: italic;
}

.filebox input[type='file'] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: 0.5em 1em;
    margin-bottom: 10px;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: 0.25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: 0.5em 0.75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: 0.25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

.inputSize {
	width: 250px;
}

.selectSize {
	width: 264px;
}

.textareaSize {
	width: 500px;
	height: 100px;
	resize: none;
}
  a {
  	  text-decoration: none;
  	  padding-left: 20px;
  }
</style>

</head>
<body>

<div class="search-form" id="search-form">
	<form action="">
		<input type="search" class="form-control"
			placeholder="Enter keyword to search...">
		<button class="button">
			<svg width="1em" height="1em" viewBox="0 0 16 16"
				class="bi bi-search" fill="currentColor"
				xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd"
					d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z" />
          <path fill-rule="evenodd"
					d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z" />
        </svg>
		</button>
		<button class="button">
			<div class="close-search">
				<span class="icofont-close js-close-search"></span>
			</div>
		</button>

	</form>
</div>

<div class="site-mobile-menu">
	<div class="site-mobile-menu-header">
		<div class="site-mobile-menu-close">
			<span class="icofont-close js-menu-toggle"></span>
		</div>
	</div>
	<div class="site-mobile-menu-body"></div>
</div>



<nav class="site-nav mb-5">
	<div class="sticky-nav js-sticky-header">

		<div class="container position-relative">
			<div class="site-navigation text-center dark">
				<a href="<%=request.getContextPath()%>/includes/admin/adminstart.jsp" class="logo menu-absolute m-0">PangPang Mall<span
					class="text-primary">.</span></a>
				<ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
					<li><a href="<%=request.getContextPath()%>/includes/admin/adminstart.jsp">Home</a></li>
					<!-- 상품관리, 카테고리 링크 -->
					<li><a href="<%=request.getContextPath()%>/productUpload.do">Product</a></li>
					<li><a href="<%=request.getContextPath()%>/includes/admin/board/key0.adminboardIndex.jsp">Board</a></li>
					<li><a href="<%=request.getContextPath()%>/memberList.do">Member</a></li>
				</ul>



					
				
				<div class="menu-icons">
					
					<a><%=session.getAttribute("mem_id") %>님&nbsp;&nbsp;</a>
					
			
					 <!-- 로그아웃 -->
					<a href="<%=request.getContextPath()%>/logout.do" class="user-profile"> 
					<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">
					  <path d="M7.5 1v7h1V1h-1z"/>
					  <path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
<!-- </svg> -->
<!-- 					<svg width="1em" -->
<!-- 							height="1em" viewBox="0 0 16 16" class="bi bi-power" -->
<!-- 							fill="currentColor" xmlns="http://www.w3.org/2000/svg"> -->
<!--                 <path fill-rule="evenodd" -->
<!-- 								d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" /> -->
              </svg>
					</a> 
			

				</div>

				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
				</a>

			</div>
		</div>
	</div>
</nav>


  <div class="page-heading bg-light">
    <div class="container">
      <div class="row align-items-end text-center">
        <div class="col-lg-7 mx-auto">
          <h1>Upload Product</h1>  
          <p class="mb-4"><a href="start.jsp">Home</a> / <strong>Elements</strong></p>        
        </div>
      </div>
    </div>
  </div>
<!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 --><!-- 위쪽 인덱스 -->


	<div class="untree_co-section">
		<div class="container ">
			<div class="row">

				<div class="col-lg-12">
					<div class="custom-block" Formdata-aos="fade-up"
						data-aos-delay="100">
						<h2 class="section-title">Upload</h2>
						<form class="contact-form"
							action="<%=request.getContextPath()%>/productUpload.do"
							method="post" enctype="multipart/form-data">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="" for="fname">등록할 상품의 이름을 입력하시오</label> 
										<input
											type="text" class="form-control" name="productName">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="" for="lname">판매 가격을 입력하시오</label> <input
											type="text" class="form-control" name="prodcutPrice"
											oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="" for="select">상품 카테고리를 선택하시오</label> <select name="categoryNo"
								 class="custom-select">
									<option value="">카테고리</option>
									<option value="1">의류</option>
									<option value="2">화장품</option>
									<option value="3">가전</option>
									<option value="4">식품</option>
									<option value="5">의약</option>
								</select>
							</div>
							<div class="form-group">
								<label class="" for="select">상품의 사이즈를 선택하시오</label> <select name="productSize"
								 class="custom-select">
									<option value="">사이즈 선택</option>
									<option value="S">S</option>
									<option value="M">M</option>
									<option value="L">L</option>
								</select>
								<small id="emailHelp"
									class="form-text text-muted">의류일 경우만 입력하시오</small>
							</div>
							<div class="form-group">
								<label class="" >등록할 상품 수량을 입력하시오</label> <input
									class="form-control" name="productQty"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<small id="emailHelp"
									class="form-text text-muted">숫자로 입력하시오</small>
							</div>
							<div class="form-group">
								<label class="">적용할 상품 마일리지를 입력하시오</label> <input
									class="form-control" name="productMileage"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
									<small
									class="form-text text-muted">숫자로 입력하시오</small>
							</div>
							
							
							<div class="filebox bs3-primary preview-image">
								<input class="upload-name" value="파일선택" disabled="disabled"
									style="width: 200px" /> <label for="input_file">업로드</label>
								<input name="upFile" type="file" id="input_file" class="upload-hidden" />
							</div>

							<div class="form-group">
								<label class="" >등록할 상품의 상세 정보를 입력하시오</label>
								<textarea class="form-control" name="productInfo" cols="30"
									rows="5"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>

					<div class="custom-block" data-aos="fade-up">
						<h2 class="section-title">Social Icons</h2>
						<ul class="list-unstyled social-icons light">
							<li><a href="#"><span class="icon-facebook"></span></a></li>
							<li><a href="#"><span class="icon-twitter"></span></a></li>
							<li><a href="#"><span class="icon-linkedin"></span></a></li>
							<li><a href="#"><span class="icon-google"></span></a></li>
							<li><a href="#"><span class="icon-play"></span></a></li>
						</ul>
					</div>
					<!-- END .custom-block -->

					<div class="custom-block" data-aos="fade-up" data-aos-delay="100">
						<h2 class="section-title text-center">Slider</h2>
						<div class="owl-single owl-carousel no-nav">
							<div class="testimonial mx-auto">
								<figure class="img-wrap">
								</figure>
								<h3 class="name text-black">Adam Aderson</h3>
								<blockquote>
									<p>&ldquo;There live the blind texts. Separated they live
										in Bookmarksgrove right at the coast of the Semantics, a large
										language ocean.&rdquo;</p>
								</blockquote>
							</div>

							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/person_3.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name text-black">Lukas Devlin</h3>
								<blockquote>
									<p>&ldquo;There live the blind texts. Separated they live
										in Bookmarksgrove right at the coast of the Semantics, a large
										language ocean.&rdquo;</p>
								</blockquote>
							</div>

							<div class="testimonial mx-auto">
								<figure class="img-wrap">
									<img src="images/person_4.jpg" alt="Image" class="img-fluid">
								</figure>
								<h3 class="name text-black">Kayla Bryant</h3>
								<blockquote>
									<p>&ldquo;There live the blind texts. Separated they live
										in Bookmarksgrove right at the coast of the Semantics, a large
										language ocean.&rdquo;</p>
								</blockquote>
							</div>

						</div>
					</div>
				</div>
				<!-- /.col-lg-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.untree_co-section -->



	<!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 --><!-- 아래쪽 인덱스 -->




  <div class="site-footer">


    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-5">
          <div class="widget mb-4">
            <h3 class="mb-2">About UntreeStore</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate modi cumque rem recusandae quaerat at asperiores beatae saepe repudiandae quam rerum aspernatur dolores et ipsa obcaecati voluptates libero</p>
          </div>
          <div class="widget">
            <h3>Join our mailing list and receive exclusives</h3>
            <form action="#" class="subscribe">
              <div class="d-flex">
                <input type="email" class="form-control" placeholder="Email address">
                <input type="submit" class="btn btn-black" value="Subscribe">
              </div>
            </form>

            
          </div>
        </div>
        <div class="col-lg-2">
          <div class="widget">
            <h3>Help</h3> 
            <ul class="list-unstyled">
              <li><a href="#">Contact us</a></li>
              <li><a href="#">Account</a></li>
              <li><a href="#">Shipping</a></li>
              <li><a href="#">Returns</a></li>
              <li><a href="#">FAQ</a></li>   
            </ul>
          </div>
        </div>
        <div class="col-lg-2">
          <div class="widget">
            <h3>About</h3>
            <ul class="list-unstyled">
              <li><a href="#">About us</a></li>
              <li><a href="#">Press</a></li>
              <li><a href="#">Careers</a></li>
              <li><a href="#">Team</a></li>
              <li><a href="#">FAQ</a></li>   
            </ul>
          </div>
        </div>
        <div class="col-lg-2">
          <div class="widget">
            <h3>Shop</h3>
            <ul class="list-unstyled">
              <li><a href="#">Store</a></li>
              <li><a href="#">Gift Cards</a></li>
              <li><a href="#">Student Discount</a></li>
            </ul>
          </div>
        </div>
        
      </div>


      <div class="row mt-5">
        <div class="col-12 text-center">
          <ul class="list-unstyled social">
            <li><a href="#"><span class="icon-facebook"></span></a></li>
            <li><a href="#"><span class="icon-instagram"></span></a></li>
            <li><a href="#"><span class="icon-linkedin"></span></a></li>
            <li><a href="#"><span class="icon-twitter"></span></a></li>
          </ul>
        </div>
        <div class="col-12 text-center copyright">
          <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script>. All Rights Reserved. &mdash; Designed with love by <a href="https://untree.co">Untree.co</a> <!-- License information: https://untree.co/license/ -->
          </p>

        </div>
      </div>
    </div> <!-- /.container -->
  </div> <!-- /.site-footer -->

  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>

  <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.animateNumber.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.waypoints.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.fancybox.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
  <script src="<%=request.getContextPath()%>/js/aos.js"></script>
  <script src="<%=request.getContextPath()%>/js/custom.js"></script>
  
</body>

</html>
