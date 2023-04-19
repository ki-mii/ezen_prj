<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="../resources/css/admin/goodsEnroll.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script> 
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
<body>
				<%@include file="../includes/admin/header.jsp" %>

                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                    <div class="admin_content_main">
                    	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="name">
                    				<span class="ck_warn name_warn">상품 이름을 입력해주세요</span>
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
                    				<input name="price" value="0">
                    				<span class="ck_warn price_warn">가격을 입력해주세요</span>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>원산지</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="origin">
                    				<span class="ck_warn origin_warn">원산지를 입력해주세요</span>
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>용량</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="volume">
                    				<span class="ck_warn volume_warn">용량을 입력해주세요</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>알콜도수</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="alcohol" value="0">
                    				<span class="ck_warn alcohol_warn">알콜도수를 입력해주세요</span>
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="stock" value="0">
                    				<span class="ck_warn stock_warn">재고를 입력해주세요</span>
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 정보</label>
                    			</div>
                    			<div class="form_section_content bit">
                    				<textarea name="info" id="info_textarea"></textarea>
                    				<span class="ck_warn info_warn">상품정보를 입력해주세요</span>
                    			</div>
                    		</div>   
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이미지</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input type="file" id="fileItem" name="uploadFile" style="height:30px;" multiple>
                    				<div id="uploadResult">
                    					<!-- 
                    					<div id="result_card">
											<div class="imgDeleteBtn">x</div>
											<img src="/resources/image/logo.png">
										</div>
										-->
									</div>		
                    			</div>
                    		</div>       		
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>  
                </div>
                
                 <%@include file="../includes/admin/footer.jsp" %>
<script>
	var enrollForm = $("#enrollForm")
	
$("#cancelBtn").click(function(){
	location.href="/admin/goodsManage"
});
	
$("#enrollBtn").on("click",function(e){
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
		enrollForm.submit();
	}else{
		return false;
	}
});

/* 위지윅 적용 */

/* 상품정보 */
ClassicEditor
	.create(document.querySelector('#info_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		
		/*이미지 존재시 삭제*/
		if($(".imaDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		/*
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}*/
		
		//multiple 파일 여러개 선택할때
		for(let i=0; i<fileList.length; i++){
			formData.append("uploadFile", fileList[i]); 
		}
		
		$.ajax({
			url: '/admin/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result){
				console.log(result);
				showUploadImage(result);
			},
			error : function(result){
				alert("이미지 파일이 아닙니다.");
			}
		});
		
		//formData.append("uploadFile", fileObj); 파일 하나일때
		
		//alert("통과");
		
		//console.log("fileList : " + fileList);
		//console.log("fileObj : " + fileObj);
		//console.log("fileName : " + fileObj.name);
		//console.log("fileSize : " + fileObj.size);
		//console.log("fileType(MimeType) : " + fileObj.type);
	});
	
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576;
	
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
	
	/* 이미지 출력*/
	function showUploadImage(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#uploadResult");
		
		let obj = uploadResultArr[0];
		
		let str = "";
		
		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName="+ fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";
		
		uploadResult.append(str);
	}
	
	/*이미지 삭제 버튼 동작*/
	$('#uploadResult').on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	})
	
	/*파일 삭제 메서드*/
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data: {fileName : targetFile},
			dataType: 'text',
			type: 'POST',
			success: function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
			},
			error: function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.");
			}
			
		});
	}	
	
</script>  
               
</body>
</html>