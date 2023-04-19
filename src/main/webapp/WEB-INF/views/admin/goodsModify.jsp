<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/admin/goodsModify.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
</head>
<body>

				<%@include file="../includes/admin/header.jsp" %>
				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/goodsModify" method="post" id="modifyForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="name" value="${goodsInfo.name}">
                    				<span class="ck_warn name_warn">상품 이름을 입력해주세요.</span>
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<select name="category">
                    					<option value="category" selected>-- 카테고리 --</option>
                    					<option value="soju">소주</option>
                    					<option value="beer">맥주</option>
                    					<option value="makgeolli">막걸리</option>
                    					<option value="whisky">양주</option>
                    				</select>
                    				<span class="ck_warn category_warn">카테고리를 선택해주세요</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="price" value="${goodsInfo.price}">
                    				<span class="ck_warn price_warn">가격을 입력해주세요</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>원산지</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="origin" value="${goodsInfo.origin}">
                    				<span class="ck_warn origin_warn">원산지를 입력해주세요.</span>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>용량</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="volume" value="${goodsInfo.volume}">
                    				<span class="ck_warn volume_warn">용량을 입력해주세요.</span>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>알콜도수</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="alcohol" value="${goodsInfo.alcohol}">
                    				<span class="ck_warn alcohol_warn">알콜도수를 입력해주세요.</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="stock" value="${goodsInfo.stock}">
                    				<span class="ck_warn stock_warn">재고를 입력해주세요.</span>
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 정보</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="info" id="info_textarea">${goodsInfo.info}</textarea>
                    				<span class="ck_warn info_warn">상품정보를 입력해주세요.</span>
                    			</div>
                    		</div>       
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">
									<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;">
									<div id="uploadResult">
																		
									</div>									
                    			</div>
                    		</div> 		
                    		<input type="hidden" name='id' value="${goodsInfo.id}">
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	                    		<button id="deleteBtn" class="btn delete_btn">삭 제</button>
	                    	</div> 
                    </div>  
                	<form id="moveForm" action="/admin/goodsManage" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
						<input type="hidden" name='id' value="${goodsInfo.id}">
                	</form>                     
                </div>
 
 				<%@include file="../includes/admin/footer.jsp" %>
<script>
	$(document).ready(function(){
		
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#info_textarea'))
			.catch(error=>{
				console.error(error);
			});
		
		/* 기존 이미지 출력 */
		let id = '<c:out value="${goodsInfo.id}"/>';
		let uploadResult = $("#uploadResult");
		
		$.getJSON("/getAttachList", {id : id}, function(arr){
			
			console.log(arr);
			
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
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
			str += "</div>";
			
			uploadResult.html(str);			
			
		});// GetJSON
	});
	
	$("#cancelBtn").on("click", function(e){
		e.preventDefault();
		$("#moveForm").submit();
		
	});
	
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		
		/* 체크 변수 */
		let nameCk = false;
		let categoryCk = false;
		let priceCk = false;
		let originCk = false;
		let volumeCk = false;
		let alcoholCk = false;
		let stockCk = false;
		let infoCk = false;

		/* 체크 대상 변수 */
		let name = $("input[name='name']").val();
		let category = $("select[name='category']").val();
		let price = $("input[name='price']").val();
		let origin = $("input[name='origin']").val();
		let volume = $("input[name='volume']").val();
		let alcohol = $("input[name='alcohol']").val();
		let stock = $("input[name='stock']").val();
		let info = $(".bit p").html();
		
		/* 공란 체크 */
		if(name){
			$(".name_warn").css('display','none');
			nameCk = true;
		} else {
			$(".name_warn").css('display','block');
			nameCk = false;
		}
		
		if(category != 'category'){
			$(".category_warn").css('display','none');
			categoryCk = true;
		} else {
			$(".category_warn").css('display','block');
			categoryCk = false;
		}
		
		if(price != 0){
			$(".price_warn").css('display','none');
			priceCk = true;
		} else {
			$(".price_warn").css('display','block');
			priceCk = false;
		}
		
		if(origin){
			$(".origin_warn").css('display','none');
			originCk = true;
		} else {
			$(".origin_warn").css('display','block');
			originCk = false;
		}
		
		if(volume){
			$(".volume_warn").css('display','none');
			volumeCk = true;
		} else {
			$(".volume_warn").css('display','block');
			volumeCk = false;
		}
		
		if(alcohol != 0){
			$(".alcohol_warn").css('display','none');
			alcoholCk = true;
		} else {
			$(".alcohol_warn").css('display','block');
			alcoholCk = false;
		}
		
		if(stock){
			$(".stock_warn").css('display','none');
			stockCk = true;
		} else {
			$(".stock_warn").css('display','block');
			stockCk = false;
		}
		
		if(info != '<br data-cke-filler="true">'){
			$(".info_warn").css('display','none');
			infoCk = true;
		} else {
			$(".info_warn").css('display','block');
			infoCk = false;
		}
		
		if(nameCk && categoryCk && priceCk && originCk && volumeCk && alcoholCk && stockCk && infoCk ){
			$("#modifyForm").submit();
		}else{
			return false;
		}
	});
	
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		$("#result_card").remove();
	}
	
	$("#deleteBtn").on("click", function(e){
		e.preventDefault();
		let moveForm = $("#moveForm");
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="id" value="${goodsInfo.id}">');
		moveForm.attr("action", "/admin/goodsDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
		
	});
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($("#result_card").length > 0){
			deleteFile();
		}
				
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
		});		

		
	});
		
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		//replace 적용 하지 않아도 가능
		//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
		str += "</div>";		
		
   		uploadResult.append(str);     
        
	}
	
</script> 				
</body>
</html>