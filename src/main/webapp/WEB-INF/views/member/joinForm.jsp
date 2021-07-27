<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">

	.err {
		color: red;
		font-weight: bold;
	}
	
	.alert {
		height: 20px;
	    padding: 0px;
	    margin-bottom: 0px;
	    border: none;
	    border-radius: 4px;
	    background-color: none;
	}
	
	.inputline1 {
		border: none;
		outline: 0;
		width: 65%;
	}
 	.inputline2 {
		border: none;
		outline: 0;
		width: 50%;
	} 
	
	#keyShow {
	  position: absolute;
	  display: none;
	  margin-right: 10px;
	  margin-top: 4px;
	  font-size: 15px;
	  cursor: pointer;
	  color: grey;
	}
</style>
<script type="text/javascript">
//안보이게 하기
	$(function() {
		$("#emailChk").hide();
		$("#emailChk_success").hide();
		$("#emailChk_fail").hide();
		
	});
//이메일 유효성 검사 및 중복 체크
	function idChk() {
		// 이메일 유효성 검사
		var reg_id = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(!frm.MB_id.value) { // 이메일 입력창에 아무것도 작성안하고 체크 눌럿을 때
			alert("이메일을 입력하세요")
			frm.MB_id.focus();
			frm.MB_id.value="";
			return false;
		} else { 								// 작성한 후 체크 줄렀을때
			if(!reg_id.test(frm.MB_id.value)){ // 올바른 이메일 형식이 아닐때
				alert("올바른 이메일 형식이 아닙니다.");
				frm.MB_id.focus();
				return false;
			} else { 							// 올바른 이메일 형식이면 중복 체크를 함
				$.post('idChk.do', 'MB_id='+frm.MB_id.value, function(data) { 
					$('#idChk').html(data);
					if (data == '사용가능한 이메일 입니다.') { // 중복 체크했는데 사용 가능한 아이디일때 메일을 보냄
						$("#emailChk").show();
						$.post("mailResult.do", "MB_id="+frm.MB_id.value, function(data2){
							$("#emailChk").keyup(function() {
							if (data2 == frm.emailChk.value) {
								$("#emailChk_success").show();
								$("#emailChk_fail").hide();
								/* $("#submit").attr('disabled', false); */
								$("#nickNameChk").attr('disabled', false);
							} else {
								$("#emailChk_success").hide();
								$("#emailChk_fail").show();
								/* $("#submit").attr('disabled', true); */
							}
							});
						});
					} else {
						$("#submit").attr('disabled', true);
					}
			    });	
		    }
		}
	}
	
// 비밀번호 유효성 검사
 	$(function () {
	// 1. 비밀번호와 비밀번호  일치 확인 ajax
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#pw_confirm").keyup(function() {
			var MB_pw = $("#pw").val();
			var MB_pw_confirm = $("#pw_confirm").val();
			if (MB_pw != "" || MB_pw_confirm != "") {
				if (MB_pw == MB_pw_confirm) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					/* $("#submit").attr('disabled', false); */
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					/* $("#submit").attr('disabled', true); */
				}
		    }
       });
	
 //2. 비밀번호 형태 유효성 검사
		    $("#alert1").hide();  
			$("#alert2").hide();
			$("#alert3").hide();
			$("#alert4").hide();

		$("#pw").keyup(function() {  
		 	var pw = $("#pw").val(); 
	     	var num = pw.search(/[0-9]/g);      //숫자 기입
		 	var eng = pw.search(/[a-zA-Z]/ig);  //영문자 기입
		 	var tab = pw.search(/[/\s/]/ig);    //공백
	
		 	if (tab != -1) {
		    	 $("#alert1").hide();
				 $("#alert2").toggle();
				 $("#alert3").hide();
				 $("#alert4").hide();
				 /* $("#submit").attr('disabled', true); */
			 } else {
			 	 if (pw.length < 4 ) {  
					$("#alert1").toggle();
					$("#alert2").hide();
					$("#alert3").hide();
				    $("#alert4").hide();
				   /*  $("#submit").attr('disabled', true);  */
	   			 } else if (num >= 0 && eng >= 0){
	    			$(".alert").hide(); 
	    			/* $("#submit").attr('disabled', false); */
	 	  		 } else if (num < 0 && eng >= 0   ) {   
				    $("#alert1").hide();
			        $("#alert2").hide();
			  	    $("#alert3").toggle();    
			   	    $("#alert4").hide();
			   	    /* $("#submit").attr('disabled', true); */
		   		 } else if ( num >= 0 && eng < 0  ){  
				    $("#alert1").hide();
					$("#alert2").hide();
					$("#alert3").hide();
					$("#alert4").toggle();
					/* $("#submit").attr('disabled', true); */
			 	 }
	        } 
		  });	
	
// 비밀번호 보이거나 감추는 선택 기능
	
			$("#pw").on("keyup", function(event) {
				if (event.keyCode === 13) {
				    event.preventDefault();
				    $("#submit").triggerHandler("click");
				} else {
					if (this.value) {
						$("#keyShow").css("display", "inline-block");
					} else {
						$("#keyShow").hide();
				}
			  }
		    }).focus();
	 	
		    $("#keyShow").on("click", function() {
		  		if ($("#pw").attr("type") == "password") {
					$("#pw").attr("type", "text");
					$($(this)).text("H I D E");
				} else {
					$("#pw").attr("type", "password");
					$($(this)).text("SHOW");
				}
		 	});	
	  	 	
  });	
 
//미성년자 여부 판단
	$(function () {
			 $("#err_regNum1").hide();
	   		 $("#err_regNum2").hide();
			 $("#err_regNum3").hide();
			 $("#err_regNum4").hide();
  		 
		$("#CheckRegNum"). keyup(function(){
			var today = new Date(); // 시스템 날짜 객체 생성
			var year = parseInt(today.getFullYear()); // 생성된 객체에서 연도 데이터만 가져와 숫자로 변환
			var regNum = $("#regNum").val();
			var gender = $("#gender").val(); 
			var age = 0; // 임시 나이 변수;
		
			var  birthYear  = (gender == 1 || gender == 2) ? 19 : 20;
		  	   birthYear  += regNum.substr(0,2);  
			var  birthMonth =  regNum.substr(2,2)-1;
			var	 birthDate  =  regNum.substr(4,2);
			var	 birth = new Date(birthYear, birthMonth, birthDate);
			
		if(regNum.length == 6 ) {   // regN의 6자리가 채워진 후에 날짜 유효성 체크
			if (birth.getYear() % 100 != regNum.substr(0,2) ||  birth.getMonth()  != birthMonth ||
				       birth.getDate()  != birthDate) {
				$("#err_regNum1").hide();
				$("#err_regNum2").toggle();
				$("#err_regNum3").hide();
				$("#err_regNum4").hide();
				$("#regNum").val('');  
				$("#regNum").focus();
				/* $("#submit").attr('disabled', true); */ 
		     } else {
		    	 if (gender == 1 || gender == 2) { // 주민등록번호 뒷자리 첫번째 값이 1과 2인 경우
					age = year - (1900 + parseInt(regNum.substring(0,2)));  // 유효한 정보
						$("#err_regNum1").hide();
						$("#err_regNum2").hide();
						$("#err_regNum3").toggle();
						$("#err_regNum4").hide();
						/* $("#submit").attr('disabled', false); */
			    } else {
			    	if  (gender == 3 || gender == 4) { // 3과 4인 경우
						age = year - (2000 + parseInt(regNum.substring(0,2)));
						if (age < 20  && age > 0) {          // age의 값이 20 미만인 경우 회원가입을 할 수 없게 함
							$("#err_regNum1").toggle();
							$("#err_regNum2").hide();
							$("#err_regNum3").hide();
							$("#err_regNum4").hide();
							$("#regNum").val('');  
							$("#gender").val('');  
							$("#regNum").focus();
							/* $("#submit").attr('disabled', true); */ 
				      } else if (age < 0) {
				    	    $("#err_regNum1").hide();
							$("#err_regNum2").hide();
							$("#err_regNum3").hide();
							$("#err_regNum4").toggle();
							$("#regNum").val('');  
							$("#gender").val('');  
							$("#regNum").focus();
							/* $("#submit").attr('disabled', true); */
				      }
			        } 	
		          } 
			   }
		    }
	  });	   
	});	   

// 닉네임 중복 체크
	function nickChk() {
		if(!frm.MB_nickName.value) {
			alert("닉네임을 입력하세요")
			frm.MB_nickName.focus();
			frm.MB_nickName.value="";
			return false;
		} else {
		// 닉네임 중복 체크 로직
		$.post('nickChk.do', 'MB_nickName='+frm.MB_nickName.value, function(data) {
			$('#nickChk').html(data);
			if (data == '사용가능한 닉네임입니다.') {
				$("#submit").attr('disabled', false);
			} else {
				$("#submit").attr('disabled', true);
			}
		});
	  }
	}
	
// 비밀번호와 비밀번호 확인 체크	
	function chk() {
	  	if (frm.MB_pw.value != frm.MB_pw_confirm.value) {
			alert("암호와 암호 확인이 일치하지 않습니다.");
			frm.MB_pw.focus(); // 커서
			frm.MB_pw.value=""; // password에 있는 데이터를 지우기
			return false; // action을 실행하지 않음
		} return;
	}	
</script>  
</head>
<body>  
	<div align="center">
		<h2 class="title">회원 가입</h2>
		<form action="join.do" method="post" name="frm"
			onsubmit="return chk()">
			<table class="table narrowWidth1">
				<tr>
					<td class="col md-2 text-center">이메일</td>
					<td class="col md-10">
					 	<input type="email" name="MB_id" required="required" autofocus="autofocus"
								placeholder="이메일을 입력해주세요" class="inputline2">
						<input type="button" onclick="idChk()"  value="이메일 인증" class="btn_ck">
						<div id="idChk" class="err"></div> <br>
						<div id="emailChk">
							<input type="text" name="emailChk" id="emailChk" 
								class="inputline1" placeholder="인증번호 입력"> 
						</div>
						<div id="emailChk_success" class="err">인증번호가 일치합니다.</div>
						<div id="emailChk_fail" class="err">인증번호가 일치하지 않습니다.</div>
						<div id="emailChkFalse" class="err"></div></td>
				</tr>
				<tr>
					<td class="col md-2 text-center">비밀번호</td>
					<td class="col md-10">
						<input type="password" name="MB_pw" id="pw" maxlength="12" autocomplete="false"
								class="inputline2"  placeholder="영문자, 숫자, 4자 이상" 
								required="required">
							<div id="keyShow">show</div>
							<br>
						<div class="alert alert-danger" id="alert1" >
						     "숫자와 영문자를 포함해서 4자리 이상 "</div>
						<div class="alert alert-danger" id="alert2">"공백 없이 입력"</div>
						<div class="alert alert-danger" id="alert3">"숫자 필수 포함"</div>
						<div class="alert alert-danger" id="alert4">"영문자 필수 포함"</div>
				   </td> 
				</tr>  
				<tr>
					<td class="col md-2 text-center">비밀번호 확인</td>
					<td class="col md-10">
					    <input type="password" 	name="MB_pw_confirm" id="pw_confirm" 
					           required="required"	placeholder="비밀번호 확인" class="inputline1"> <br>
						<div class="alert alert-success" id="alert-success">
						      비밀번호가 일치합니다.</div>
						<div class="alert alert-danger" id="alert-danger">
                             비밀번호가 일치하지 않습니다.</div>
                    </td>
				</tr>
				<tr>
					<td class="col md-2 text-center">이름</td>
					<td class="col md-10">
						<input type="text" name="MB_name" required="required" id="name" 
								 placeholder="이름을 입력해주세요" class="inputline1"></td>
				</tr>
				<tr>
					<td class="col md-2 text-center" >주민등록번호</td>
					<td class="col md-10" id="CheckRegNum">
					    <input type="text" name="MB_regNum" id="regNum" required="required" maxlength="6" 
					           style="width: 20%;" placeholder="6자리" class="inputline1" autofocus="autofocus" > 
						<span>―</span> <!-- 1, 3일 경우 남자 / 2, 4일 경우 여자 -->
						<input type="text" name="MB_gender" id="gender" placeholder="1" 
								required="required" maxlength="1" style="width: 15px;" class="inputline1">
					    <span>******</span> 
						<div class="alert alert-danger"  id="err_regNum1">미성년자는 가입할 수 없습니다</div>
						<div class="alert alert-danger" id="err_regNum2">유효하지 않은 정보입니다</div>
						<div class="alert alert-success"  id="err_regNum3">유효한 정보입니다</div> 
						<div class="alert alert-danger"  id="err_regNum4">생년월일을 확인하세요</div> 
					</td>
				</tr>
				<tr>
					<td class="col md-2 text-center">닉네임</td>
					<td class="col md-10">
						<input type="text" name="MB_nickName" id="nickName" required="required" 
						        placeholder="닉네임을 입력해주세요" class="inputline2"> 
						<input type="button" onclick="nickChk()" id="nickNameChk" value="중복체크" class="btn_ck" disabled="disabled">
						<div id="nickChk" class="err"></div></td>
				</tr>
				<tr>
					<td class="col md-2 text-center">연락처</td>
					<td class="col md-10"><input type="tel" name="MB_tel" id="tel" 	required="required"
					     title="전화번호 형식 3-4-4" pattern="\d{3}-\d{4}-\d{4}" placeholder="000-0000-0000"
						class="inputline1">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="text-center">
					    <input type="submit" id="submit" value="회원가입"  disabled="" class="btn_sm_full">
					    <input type="button"  onclick="location.href='loginForm.do'" 
					    	    value="로그인" class="btn_sm_stroke">    
					 </td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>