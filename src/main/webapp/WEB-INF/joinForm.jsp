<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
@import url("../../css/member/join.css");
</style>

<script type="text/javascript">

/* 아이디 중복체크 및 인증메일 전송 */
function chkId(){
	/* 이메일 유효성 검사 */
	var reg_id = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	if(!frm.MB_id.value) {
		alert("이메일을 입력하세요")
		frm.id.focus();
		return false;
	}else{
		if(!reg_id.test(frm.MB_id.value)){
			alert("올바른 이메일 형식이 아닙니다.");
			frm.id.focus();
			return false;
		}else{
			/* 인증메일 전송 */
			$.post("mailResult.na", "id="+frm.MB_id.value, function(data){
				/* 인증메일 전송시 인증번호 입력창 보이기 */
				var str = data.split(";");
				alert(str[0]);
				frm.certify.value=str[1];
				if (str[0]=="send mail success"){
					$('#chkIdDIV').css("display","block")
				}
			});
			/* 아이디 중복확인 */
			$.post("confirmId.na", "id="+frm.id.value, function(data){
				$('#err_id').html(data);
			});
		} 
	}
}

function chkPass(){
	var pw = $("#password").val();
	if(pw.length<8) {
		$('#err_pass').html("8자리 이상 입력해주세요");
		frm.password.focus();
		frm.password.value="";
		return false;
	}else {
		$('#err_pass').html("사용가능한 비밀번호입니다");
	}
}

/* 비밀번호 확인 일치여부 체크 */
function chkPassword() {
	if(frm.password.value!=frm.confirmPassword.value){
		alert("비밀번호가 일치하지 않습니다")
		frm.password.focus();
		frm.password.value="";
		frm.confirmPassword.value="";
		return false;
	}
}

/* 별명 중복체크 */
function chkNick_nm(){
	if(!frm.nick_nm.value) {
		alert("별명을 입력하세요")
		frm.nick_nm.focus();
		return false;
	}else{
		frm.checked_nick.value="y";
	}
	$.post("confirmNick_nm.na", "nick_nm="+frm.nick_nm.value, function(data){
		/* console.log(frm.nick_nm.value); */
		$('#err').html(data);
	});
	
}

/* 이메일 인증번호 체크 */
function chkMail(){
	if(!frm.mail_chk.value){
		alert("이메일 인증을 해주세요");
		return false;
	}else{
		if(frm.mail_chk.value!=frm.certify.value){
			alert("인증번호가 일치하지 않습니다")
			frm.mail_chk.focus();
			frm.mail_chk.value="";
			return false;
		}else{
			alert("메일 인증에 성공했습니다");
			frm.checked_id.value="y";
		}	
	}
}

/* 이메일인증확인버튼 & 별명중복확인 버튼 눌렀는지 체크 */
function chk(){
	if(!frm.checked_id.value){
		alert("인증 확인 버튼을 눌러주세요");
		return false;
	} 
	if(!frm.checked_nick.value){
		alert("별명 중복 확인 버튼을 눌러주세요");
		return false;
	}	
}

</script>
</head>
<body>
	<form action="joinResult.na" method="post" name="frm" onsubmit="return chk();">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false"/>
			<input type="text"/>
		</div>
		
		<div class="container">
			<h1 class="title">회원가입하기</h1>
			
			<!-- 아이디 -->
			<div class="check">
				<input type="text" name="id" class="inputBox-left" required="required" autofocus="autofocus" placeholder="아이디(이메일)"> 
				<a class="chk-btn" onclick="chkId();" >이메일 인증</a>
				<div class="chk-msg" id="err_id"></div>
			</div> 
			
			<!-- 이메일 인증 -->
			<div class="check" id="chkIdDIV">
				<input type="text" name="mail_chk" class="inputBox-left" placeholder="인증번호 입력">
				<a class="chk-btn"  id="mailConfirm_btn" onclick="chkMail();">인증 확인</a> 
				<!-- 인증버튼 눌렀는지 체크 -->
				<input type="hidden" name="checked_id" value="">
				<!-- 인증키 비교값 -->
				<input type="hidden" name="certify">
			</div>
			
			<!-- 비밀번호 -->
			<div class="check">
				<input type="password" name="password" id="password" placeholder="비밀번호" required="required" onChange="chkPass()"> 
				<div class="chk-msg" id="err_pass"></div>
			</div>
				<input type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required" onChange="chkPassword()"> 
			<!-- 이름 -->
			<input type="text" name="name" placeholder="이름" required="required">

			<!-- 별명 -->
			<div class="check">
				<input type="text" name="nick_nm" placeholder="별명" required="required" onchange="chkNick_nm();">
				<input type="hidden" name="checked_nick" value="">
				<div class="chk-msg" id="err"></div>
			</div>
			
			<!-- 연락처 -->
			<input type="tel" name="phone" placeholder="연락처" required="required">
			
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="gender" id="mal" value="m" checked="checked">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="gender" id="fem" value="f">
				<label for="fem" >여자</label>
			</div>

			<!-- 지역 -->
			<div class="loc-age">
				<select class="select-loc" name="loc" required="required">
					<option value="">지역</option>
					<option value="Seoul">서울</option>
					<option value="Sejong">세종</option>
					<option value="Gwangju">광주</option>
					<option value="Daegu">대구</option>
					<option value="Daejeon">대전</option>
					<option value="Busan">부산</option>
					<option value="Ulsan">울산</option>
					<option value="Incheon">인천</option>
					<option value="Gangwon">강원</option>
					<option value="Gyeonggi">경기</option>
					<option value="Gyeongbuk">경북</option>
					<option value="Gyeongnam">경남</option>
					<option value="Jeonbuk">전북</option>
					<option value="Jeonnam">전남</option>
					<option value="Chungbuk">충북</option>
					<option value="Chungnam">충남</option>
					<option value="Jeju">제주</option>
				</select> 
				
			<!-- 나이 -->
				<select class="select-age" name="age" required="required">
					<option value="">나이</option>
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대</option>
					<option value="50">50대</option>
					<option value="60">60대 이상</option>
				</select>
			</div>

			<!-- button -->
			<input type="submit" class="btn submit-btn" value="회원가입">
		</div>
	</form>
</body>
</html>