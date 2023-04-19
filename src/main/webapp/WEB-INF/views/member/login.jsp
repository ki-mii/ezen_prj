<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="/resources/css/member/login.css">
</head>
<body>
	<div class="wrapper">
		
		<div class="wrap">
		<form id="login_form" method="post">
			<div class="logo_wrap" style="margin: 65px;">
				<span>SOUL</span>
			</div>
			
			<div class="login_wrap"> 
				<div class="mb-3 mx-5">
						<div class="id_input_box">
						<input class="form-control" id="formGroupExampleInput" name="memberId" placeholder="ID">
					</div>
				</div>
				<div class="mb-3 mx-5">
						<div class="pw_input_box">
						<input type="password" class="form-control" id="formGroupExampleInput" name="memberPw" placeholder="Password">
					</div>
				</div>
				<c:if test= "${result == 0 }">
					<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
				</c:if>
				
				<div class="login_button_wrap">
					<button type="button" id="login_button" class="btn btn-primary">LOGIN</button>
				</div>	
				<div>
				</div>		
			</div>
		</form>
			
		</div>
	
	</div>
<script>
	/* 로그인 메서드 서버 요청 */
	$('#login_button').click(function(){
		//alert("로그인 버튼 작동");
		
		$('#login_form').attr("action","/member/login.do");
		$('#login_form').submit();
		
	});
</script>	

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>