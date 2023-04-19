<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<style>
*{
	margin: 0;
	padding:0;
}
/* 화면 전체 렙 */
.wrapper{
	width: 100%;	
}
/* content 랩 */
.wrap{
	width : 500px;
	margin: auto;
}
/*유효성 검사 문구*/
.final_id_ck{
	margin-left: 200px;
    color: #0d6efd;
	display: none;
}
.final_pw_ck{
	margin-left: 200px;
    color: #0d6efd;
	display: none;
}
.final_pwck_ck{
	margin-left: 200px;
    color: #0d6efd;
	display: none;
}
.final_name_ck{
	margin-left: 200px;
    color: #0d6efd;
	display: none;
}
.final_tel_ck{
	margin-left: 200px;
    color: #0d6efd;
	display: none;
}
.final_mail_ck{
	margin-left: 280px;
    color: #0d6efd;
	display: none;
}
.final_addr_ck{
	margin-left: 280px;
    color: #0d6efd;
	display: none;
}
/* 중복아이디 존재하지 않는경우 */
.id_input_re_1{
	margin-left: 200px;
	color : green;
	display : none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2{
	margin-left: 200px;
	color : red;
	display : none;
}
/*비밀번호 확인 일치 유효성검사*/
.pwck_input_re_1{
	margin-left: 200px;
	color: green;
	display: none;
}
.pwck_input_re_2{
	margin-left: 200px;
	color: red;
	display: none;
}

#address_button{
    float: right;
}

/* float 속성 해제 */
.clearfix{
	clear: both;
}
/* float 속성 해제 */
.clearfix{
	clear: both;
}
</style>
<body>
<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet" 
			style="text-align: center;
		    margin-top: 30px;
		    font-size: 55px;
		    font-weight: 600;
		    margin-bottom: 20px;">
				<span>SIGN UP</span>
			</div>
			<div class="row mb-3">
		    <label for="inputEmail3" class="col-sm-2 col-form-label">ID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="id_input" name="memberId">
		    </div>
		    	<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
		   </div>
			
			 <div class="row mb-3">
			    <label for="inputEmail3" class="col-sm-2 col-form-label">Password</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control mt-2" id="pw_input"  name="memberPw">
			    </div>
			    <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			  </div>
			
				<div class="row mb-3">
				    <label for="inputEmail3" class="col-sm-2 col-form-label">Password Check</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control mt-2" id="pwck_input">
				    </div>
				    <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
					<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				  </div>			
				
				<div class="row mb-3">
				    <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="user_input" name="memberName">
				    </div>
				    <span class="final_name_ck">이름을 입력해주세요.</span>
				  </div>
				  
				  
				
				<div class="row mb-3">
				    <label for="inputEmail3" class="col-sm-2 col-form-label" style="padding-left:35px;">Tel</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="tel_input" name="memberTel">
				    </div>
				    <span class="final_tel_ck">전화번호를 입력해주세요.</span>
				  </div>
				</div>
			
				<div class="row mb-3" style="padding-left: 305px;">
				    <label for="inputEmail3" class="col-sm-2 col-form-label" style="padding-left:100px;">Email</label>
				    <div class="col-sm-10" style="width: 436px;">
				      <input type="email" class="form-control" id="mail_input" name="memberMail">
				    </div>
				    <span class="final_mail_ck">이메일을 입력해주세요.</span>
				  </div>
			
				<div class="row mb-3" style="padding-left: 305px;">
				    <label for="inputEmail3" class="col-sm-2 col-form-label" style="padding-left:85px;">Address</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" style="width:412px;" id="address_input_1" name="memberAddr1" readonly="readonly">
				    </div>
				  </div>
					<button type="button" style="margin-right:720px;margin-bottom:10px;" class="btn btn-outline-secondary" id="address_button" onclick="execution_daum_adress()">Search</button>
					<div class="clearfix"></div>
				
					<div class="row mb-3" style="padding-left: 310px;">
				    <label for="inputEmail3" class="col-sm-2 col-form-label" style="padding-left: 78px;">Address</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="address_input_2" style="width: 412px;" name="memberAddr2" readonly="readonly">
				    </div>
				  </div>
				  <div class="row mb-3 mx-5" style="padding-left: 260px;">
				    <label for="inputEmail3" class="col-sm-2 col-form-label style=" style="padding-left: 70px;">Address</label>
				    <div class="col-sm-10">
				      <input type="email" class="form-control" id="address_input_3" style="width: 412px;" name="memberAddr3" readonly="readonly">
				    </div>
				    <span class="final_addr_ck">주소를 입력해주세요.</span>
				  </div>
			<div class="join_button_wrap mt-4 mb-5"  style="padding-left: 470px;">
				<button type="button" id="join_button" class="btn btn-primary">SIGN UP</button>
			</div>
			</form>
		</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	var idCheck = false;
	var idckCheck = false;
	var pwCheck = false;          
 	var pwckCheck = false;           
 	var pwckcorCheck = false;        // 비번 확인 일치 확인
 	var nameCheck = false; 
 	var telCheck = false;
 	var mailCheck = false;            
 	var addressCheck = false
	 
	$(document).ready(function(){
		$("#join_button").click(function(){
			/* 입력값 변수 */
			var id = $('#id_input').val();
			var pw = $('#pw_input').val();
			var pwck = $('#pwck_input').val();
			var name = $('#user_input').val();
			var tel = $('#tel_input').val();
			var mail = $('#mail_input').val();
			var addr = $('#address_input_3').val();
			
			/*아이디 유효성 검사*/
			if(id == ""){
				$('.final_id_ck').css('display','block');
				idCheck = false;
			}else{
				$('.final_id_ck').css('display','none');
				idCheck = true; //중복이 없는 경우
			}
			
			/*비밀번호 유효성 검사*/
			if(pw == ""){
				$('.final_pw_ck').css('display','block');
				pwCheck = false;
			}else{
				$('.final_pw_ck').css('display','none');
				pwCheck = true; 
			}
			
			/*비밀번호 확인 유효성 검사*/
			if(pwck == ""){
				$('.final_pwck_ck').css('display','block');
				pwckCheck = false;
			}else{
				$('.final_pwck_ck').css('display','none');
				pwckCheck = true;
			}
			
			/*이름 유효성 검사*/
			if(name == ""){
				$('.final_name_ck').css('display','block');
				nameCheck = false;
			}else{
				$('.final_name_ck').css('display','none');
				nameCheck = true;
			}
			
			/* 전화번호 유효성 검사 */
	        if(tel == ""){
	            $('.final_tel_ck').css('display','block');
	            telCheck = false;
	        }else{
	            $('.final_tel_ck').css('display', 'none');
	            telCheck = true;
	        }
			
			/* 이메일 유효성 검사 */
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
			
	        /* 주소 유효성 검사 */
	        if(addr == ""){
	            $('.final_addr_ck').css('display','block');
	            addressCheck = false;
	        }else{
	            $('.final_addr_ck').css('display', 'none');
	            addressCheck = true;
	        }
	        
	        /* 최종 유효성 검사 */
	        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&telCheck&&mailCheck&&addressCheck){
	 		
	        	$("#join_form").attr("action", "/member/join");
				$("#join_form").submit();
	        }      
	        
	        return false;
			
		});
	});
	
	$('#id_input').on("propertychange change keyup paste input", function(){
		/* console.log("keyup 테스트"); */
		
		var memberId = $('#id_input').val();
		var data = {memberId : memberId}
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				//console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display","none");
					idckCheck = true; //중복이 없는 경우
				}else{
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display","none");
					idckCheck = false;
				}
			}
		});
	});
	
	function execution_daum_adress(){
		
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 주소변수 문자열과 참고항목 문자열 합치기
                   	 addr += extraAddr;
                
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#address_input_1").val(data.zonecode);
	            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
	            $("#address_input_2").val(addr);
	            //$("[name=memberAddr2]").val(addr);    
                // 커서를 상세주소 필드로 이동한다.
	            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	           	$("#address_input_3").attr("readonly",false);
	            $("#address_input_3").focus();
	        }
	    }).open();
	}
	
	/*비밀번호 확인 일치 유효성검사*/
	/*change keyup paste 변화감지(입력하면 변화됨)*/
	$('#pwck_input').on("propertychange change keyup paste input", function(){
		var pw = $('#pw_input').val();
		var pwck = $('#pwck_input').val();
		$('.final_pwck_ck').css('display','none');
		
		if(pw == pwck){
			$('.pwck_input_re_1').css('display','block');
			$('.pwck_input_re_2').css('display','none');
			pwckcorCheck = true;
		}else{
			$('.pwck_input_re_1').css('display','none');
			$('.pwck_input_re_2').css('display','block');
			pwckcorCheck = false;
		}
		
	});
	
</script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>