<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOUL</title>
 <link href="../resources/css/goodsDetail.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body class="d-flex flex-column min-vh-100">
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid fs-4 mx-5 px-5 py-3">
			<a class="navbar-brand fs-1 fw-bold pe-5" href="/main">SOUL</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">

				<ul class="navbar-nav ms-auto mb-2 mb-lg-0 ps-3">
					<li class="nav-item mx-1 px-3">
						<form class="d-flex" role="search" id="searchForm"
							action="/search" method="get">
							<input class="form-control me-2" type="text" name="keyword"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-secondary" type="submit">Search</button>
						</form>
					</li>
					<c:if test="${member == null }">
						<!-- 로그인x -->
						<li class="nav-item mx-1"><a class="nav-link"
							href="/member/login">LOGIN</a></li>
						<li class="nav-item mx-1"><a class="nav-link fw-bold"
							href="/member/join">SIGN UP</a></li>
					</c:if>
					<c:if test="${member != null }">
						<!-- 로그인o -->
						<c:if test="${member.adminCk == 1 }">
							<!-- 관리자계정 -->
							<li class="nav-item mx-1 px-1"><a class="nav-link"
								href="/admin/main">ADMIN</a></li>
						</c:if>
						<li class="nav-item mx-1 my-2 px-4">
							<p class="text-secondary">CARD</p>
						</li>
						<li class="nav-item mx-1 my-2"><a id="gnb_logout_button"
							class="text-secondary">LOGOUT</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<div class="clearfix"></div>
	<div class="container">
	<div class="content_area py-5">
		<div class="content_top">
			<div class="ct_left_area">
				<div class="image_wrap mx-5 w-100" data-id="${goodsInfo.imageList[0].id}"
					data-path="${goodsInfo.imageList[0].uploadPath}"
					data-uuid="${goodsInfo.imageList[0].uuid}"
					data-filename="${goodsInfo.imageList[0].fileName}">
					<img>
				</div>
			</div>
			<div class="ct_right_area">
				<div class="title">
					<h1>${goodsInfo.name}</h1>
				</div>
				<div class="line"></div>
				<div class="author">
					<label>원산지</label> <span> ${goodsInfo.origin} </span> <span>|</span>
					<label>용량</label> <span> ${goodsInfo.volume} </span> <span>|</span>
					<label>알콜도수</label> <span class="publeyear">
						${goodsInfo.alcohol} </span>
				</div>
				<div class="line"></div>
				<div class="price">
					<div class="sale_price" style="padding-left:3%;">
						금액 :
						<fmt:formatNumber value="${goodsInfo.price}" pattern="#,### 원" />
					</div>

					<div class="line"></div>
					<div class="button">
						<div class="button_quantity">
							주문수량 <input type="text" value="1"> <span>
								<button>+</button>
								<button>-</button>
							</span>
						</div>
						<div class="button_set">
							<a class="btn_cart">장바구니 담기</a> <a class="btn_buy">바로구매</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>

		<!-- Footer -->
		<footer class="mt-auto text-center text-lg-start bg-light text-muted">
			<!-- Section: Social media -->
			<section
				class="d-flex justify-content-center justify-content-lg-between p-0 border-bottom">
			</section>
			<!-- Section: Social media -->

			<!-- Section: Links  -->
			<section class="">
				<div class="container text-center text-md-start mt-5">
					<!-- Grid row -->
					<div class="row mt-3">
						<!-- Grid column -->
						<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
							<!-- Content -->
							<h6 class="text-uppercase fw-bold mb-4">
								<i class="fas fa-gem me-3"></i>SOUL
							</h6>
							<p>Here you can use rows and columns to organize your footer
								content. Lorem ipsum dolor sit amet, consectetur adipisicing
								elit.</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Products</h6>
							<p>
								<a href="#!" class="text-reset">Angular</a>
							</p>
							<p>
								<a href="#!" class="text-reset">React</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Vue</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Laravel</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
							<p>
								<a href="#!" class="text-reset">Pricing</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Settings</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Orders</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Help</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">
								&nbsp;&nbsp;&nbsp;Contact</h6>
							<p>
								<i class="fas fa-home me-3"></i> Seoul, KR
							</p>
							<p>
								<i class="fas fa-envelope me-3"></i> soulshop@gmail.com
							</p>
							<p>
								<i class="fas fa-phone me-3"></i> +82 234 567 88
							</p>
							<p>
								<i class="fas fa-print me-3"></i> +82 234 567 89
							</p>
						</div>
						<!-- Grid column -->
					</div>
					<!-- Grid row -->
				</div>
			</section>
			<!-- Section: Links  -->

			<!-- Copyright -->
			<div class="text-center p-4"
				style="background-color: rgba(0, 0, 0, 0.05);">
				© 2022 Copyright: <a class="text-reset fw-bold"
					href="https://soulshop.com/">soulshop.com</a>
			</div>
			<!-- Copyright -->
		</footer>
		<!-- Footer -->

	<script>
		$(document).ready(
				function() {

					/* 이미지 삽입 */
					const bobj = $(".image_wrap");

					if (bobj.data("id")) {
						const uploadPath = bobj.data("path");
						const uuid = bobj.data("uuid");
						const fileName = bobj.data("filename");

						const fileCallPath = encodeURIComponent(uploadPath
								+ "/s_" + uuid + "_" + fileName);

						bobj.find("img").attr('src',
								'/display?fileName=' + fileCallPath);
					} else {
						bobj.find("img").attr('src',
								'../resources/img/noimage.png');
					}
				});

		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax 

		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
</body>
</html>