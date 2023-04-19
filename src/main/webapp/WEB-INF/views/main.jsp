<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link href="/resources/img/wine2.png" rel="icon" type="image/x-icon" />
<link rel="stylesheet" href="${pageContext.request.contextPath}resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<title>SOUL</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid fs-5 mx-4 px-2 py-2">
    <a class="navbar-brand fs-1 fw-bold pe-5" href="/main">SOUL</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 ps-0 mb-lg-0">
        <li class="nav-item mx-3">
          	<a class="nav-link ps-0" href="#">SOJU</a>
        </li>
         <li class="nav-item mx-3">
          <a class="nav-link ps-2" href="#">BEER</a>
        </li>
         <li class="nav-item mx-3">
          <a class="nav-link ps-0" href="#">MAKGEOLLI</a>
        </li>
         <li class="nav-item mx-3">
          <a class="nav-link ps-0" href="#">WHISKY</a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 ps-5">
      		<li class="nav-item mx-1 px-3">
	          	<form class="d-flex" role="search" id="searchForm" action="/search" method="get">
				  <input class="form-control me-2" type="text" name="keyword" placeholder="Search" aria-label="Search">
				  <button class="btn btn-outline-secondary" type="submit">Search</button>
				</form>
	        </li>
      	<c:if test="${member == null }"> <!-- 로그인x -->
	        <li class="nav-item mx-1">
	          <a class="nav-link" href="/member/login">LOGIN</a>
	        </li>
	         <li class="nav-item mx-1">
	          <a class="nav-link fw-bold" href="/member/join">SIGN UP</a>
	        </li>
        </c:if>
        <c:if test="${member != null }"> <!-- 로그인o -->
        	<c:if test="${member.adminCk == 1 }"><!-- 관리자계정 -->
	        	<li class="nav-item mx-1 px-1"> 
	        		<a class="nav-link" href="/admin/main">ADMIN</a>
	        	</li>
		    </c:if>    
		        <li class="nav-item mx-1 my-2 px-4">
					<p class="text-secondary">CARD</p>
				</li>
				<li class="nav-item mx-1 my-2">
					<a id="gnb_logout_button" class="text-secondary">LOGOUT</a>
				</li>
        </c:if>
      </ul>
    </div>
  </div>
</nav>

<!-- 메인 포스터 -->

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/img/main.jpg" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="resources/img/main2.jpg" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="resources/img/main3.jpg" class="d-block w-100">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<!-- 상품 정렬 -->
<div class="row">
	<div class="col">
		<div class="content_area">
			<c:if test="${listcheck != 'empty'}">
				<div class="list_search_result">
					<table class="type_list">
						<colgroup>
							<col width="110">
							<col width="*">
							<col width="120">
							<col width="120">
							<col width="120">
						</colgroup>
						<tbody id="searchList>">
							<c:forEach items="${list}" var="list">
								<tr>
									<td class="image">
										<div class="image_wrap" data-id="${list.imageList[0].id}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
											<img>
										</div>
									</td>
									<td class="detail">
										<div class="title">
											<a href="/goodsDetail/${list.id}">
												${list.name}
											</a>
										</div>
									</td>
									<td class="price">
										<div class="org_price">
											<fmt:formatNumber value="${list.price}" pattern="#,### 원" />
										</div>
									</td>
									<td class="option"></td>
								</tr>
							</c:forEach>
						</tbody>
					
					</table>
				</div>
				<!-- 페이지 이동 인터페이스 -->
				<div class="pageMaker_wrap">
					<ul class="pageMaker">
	                			
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev }">
	               			<li class="pageMaker_btn prev">
	               				<a href="${pageMaker.pageStart -1}">이전</a>
	               			</li>
						</c:if>
	               			
	               		<!-- 페이지 번호 -->
	               		<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
	               			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
	               				<a href="${num}">${num}</a>
	               			</li>	
	               		</c:forEach>
	               		
	                   	<!-- 다음 버튼 -->
	                   	<c:if test="${pageMaker.next}">
	                   		<li class="pageMaker_btn next">
	                   			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                   		</li>
	                   	</c:if>
					</ul>
				</div>
				
				<form id="moveForm" action="/search" method="get" >
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
				</form>
				
			</c:if>
		</div>
	</div>
</div>

<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted">
  <!-- Section: Social media -->
  <section
    class="d-flex justify-content-center justify-content-lg-between p-0 border-bottom"
  >
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
          <p>
            Here you can use rows and columns to organize your footer content. Lorem ipsum
            dolor sit amet, consectetur adipisicing elit.
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Products
          </h6>
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
          <h6 class="text-uppercase fw-bold mb-4">
            Useful links
          </h6>
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
            &nbsp;&nbsp;&nbsp;Contact
          </h6>
          <p><i class="fas fa-home me-3"></i> Seoul, KR</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            soulshop@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> +82 234 567 88</p>
          <p><i class="fas fa-print me-3"></i> +82 234 567 89</p>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2022 Copyright:
    <a class="text-reset fw-bold" href="https://soulshop.com/">soulshop.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->

<script>
$(document).ready(function(){
	/* 이미지 삽입 */
	$("#image_wrap").each(function(i, obj){
		const bobj = $(obj);
		
		if(bobj.data("id")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		}else {
			$(this).find("img").attr('src', '/resources/img/noimage.png');
		}
	
	
	});
	
	
	/* gnb_area 로그아웃 버튼 작동 */
	$("#gnb_logout_button").click(function(){
		//alert("버튼 작동");
		$.ajax({
            type:"POST",
            url:"/member/logout.do",
            success:function(data){
                alert("로그아웃 성공");
                document.location.reload();     
            } 
        }); // ajax 
		
	});
	
	/* 페이지 이동 버튼 */
    const moveForm = $('#moveForm');
    
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
	
});
</script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>
