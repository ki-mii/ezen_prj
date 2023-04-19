<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script> 
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>
</head>
<body>
	<%@include file="../includes/admin/header.jsp" %>
	<div class="admin_content_wrap">
	    <div class="admin_content_subject"><span>상품 상세</span></div>
	
	    <div class="admin_content_main">
	
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>상품 이름</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="name" value="<c:out value="${goodsInfo.name}"/>" disabled>
	    			</div>
	    		</div>
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>카테고리</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="category" value="<c:out value="${goodsInfo.category}"/>" disabled>
	    			</div>
	    		</div>
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>가격</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="price" value="<c:out value="${goodsInfo.price}"/>" disabled>
	    			</div>
	    		</div>                    		                    		
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>원산지</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="origin" value="${goodsInfo.origin }" disabled>
	    				                    				
	    			</div>
	    		</div>            
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>용량</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="volume" value="<c:out value="${goodsInfo.volume}"/>" disabled>                    				
	    			</div>
	    		</div>            
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>알콜도수</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="alcohol" value="<c:out value="${goodsInfo.alcohol}"/>" disabled>
	    			</div>
	    		</div>             
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>재고</label>
	    			</div>
	    			<div class="form_section_content">
	    				<input name="stock" value="<c:out value="${goodsInfo.stock}"/>" disabled>
	    			</div>
	    		</div>         
	    		<div class="form_section">
	    			<div class="form_section_title">
	    				<label>상품 정보</label>
	    			</div>
	    			<div class="form_section_content bit">
	    				<textarea name="info" id="info_textarea" disabled>${goodsInfo.info}</textarea>
	    			</div>
	    		</div>     
	    		<div class="form_section">
           			<div class="form_section_title">
           				<label>등록 날짜</label>
           			</div>
           			<div class="form_section_content">
           				<input value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
           			</div>
           		</div>
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>최근 수정 날짜</label>
           			</div>
           			<div class="form_section_content">
           				<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
           			</div>
           		</div> 
           		
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>상품 이미지</label>
           			</div>
           			<div class="form_section_content">

						<div id="uploadResult">
															
						</div>
           			</div>
           		</div>              
	            		
     			<div class="btn_section">
     				<button id="cancelBtn" class="btn">상품 목록</button>
       				<button id="modifyBtn" class="btn enroll_btn">수정 </button>
       			</div> 
        </div>      
	
	         	
	         	<form id="moveForm" action="/admin/goodsManage" method="get" >
				<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<input type="hidden" name="amount" value="${cri.amount}">
				<input type="hidden" name="keyword" value="${cri.keyword}">
				</form>
		
	</div>
	<%@include file="../includes/admin/footer.jsp" %>
	
<script>
$(document).ready(function(){
	/* 상품정보 */
	ClassicEditor
		.create(document.querySelector('#info_textarea'))
		.then(editor => {
			console.log(editor);
			editor.isReadOnly = true;
		})
		.catch(error=>{
			console.error(error);
		});
	
	/* 이미지 정보 호출 */
	let id = '<c:out value="${goodsInfo.id}"/>';
	let uploadResult = $("#uploadResult");			
	
	$.getJSON("/getAttachList", {id : id}, function(arr){	
		
		if(arr.length === 0){	
			
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/noimage.png'>";
			str += "</div>";
			
			uploadResult.html(str);
			
			return;
		}
		
		
		let str = "";
		let obj = arr[0];	
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "</div>";			
		
		uploadResult.html(str);	
		
	});	
	
	/* 목록 이동 버튼 */
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();	
	});	
	
	/* 수정 페이지 이동 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		let addInput = '<input type="hidden" name="id" value="${goodsInfo.id}">';
		$("#moveForm").append(addInput);
		$("#moveForm").attr("action", "/admin/goodsModify");
		$("#moveForm").submit();
	});		
	
	
	
});
	
	
</script>	

	</body>
</html>