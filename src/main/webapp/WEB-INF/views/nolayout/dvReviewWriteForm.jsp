<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
$(function() {
	// input range rate 조절
	$('input[type="range"]').on('change mousemove', function() {
		var val = ($(this).val() - $(this).attr('min')) / ($(this).attr('max') - $(this).attr('min'));
	
	    $(this).css('background-image',
	                '-webkit-gradient(linear, left top, right top, '
	                + 'color-stop(' + val + ', #3243A8), '
	                + 'color-stop(' + val + ', #e4e4e4)'
	                + ')'
       	);
	    // span에 등록한 별점(range value) 넣기
	    $('#input_span').text($(this).val());
	});
});

	function closeMsg() {
		self.close();
	}
	
	function valueChk() {
		if($('input[type="range"]').val() == 0){
			alert('최소 점수는 1점 입니다.');
			return false;
		}	
	}
</script>
<style type="text/css">
.star_avg {
	padding: 8px 0 24px 0;
	font-size: 20px;
	color: #3243A8;
}

.star_avg input[type="range"] {
	display: inline-block;
	border: 0;
	border-bottom: 0;
	width: inherit;
	-webkit-appearance: none;
	height: 5px;
	background-color: rgba(0, 0, 0, 0.1);
	outline: 0;
	border-radius: 18px;
	transition: background .15s ease-in-out;
	margin-bottom: 0;
	margin-right: 6px;
	vertical-align: middle;
}

input[type="range"]::-webkit-slider-thumb {
	-webkit-appearance: none;
	width: 16px;
	height: 16px;
	border-radius: 50%;
	border: none;
	outline: 0;
	background: #3243A8;
	transition: background .15s ease-in-out;
}

.star_avg span.text {
	font-size: 16px;
	font-weight: 600;
	vertical-align: middle;
	
}

.star_avg.rate {
	cursor: pointer;
	padding-top: 0;
}

.btnMsg{
	background: #3243A8;
	color: #eee;
	width: 60px;
	border-radius: 8px;
	text-align: center;
	border: none;
}

.msgTitle {
    font-size: 24px;
    color: #3243A8;
    text-align: left;
    margin-left: 22px;
}
</style>
</head>
<body>
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("이미 리뷰를 등록한 대상입니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 0 }">
<form action="dvReviewWriteResult.do" method="post" onsubmit="return valueChk()"> 
	<input type="hidden" name="RV_writer" value="${review.RV_writer }">
	<input type="hidden" name="RV_reader" value="${review.RV_reader }">
	<input type="hidden" name="RSV_num" value="${review.RSV_num }">
	<h1 class="msgTitle">후기 작성</h1>
	<table class="table tableBG">
		<tr>
			<th class="col-xs-3 text-center">탑승자</th>
			<td class="col-xs-9 text-left">${MB_nickName}</td>
		</tr>	
		<tr>
			<th class="col-xs-3 text-center">평점</th>
			<td class="col-xs-9 text-left">
				<div class="star_avg rate">
					<input type="range" name="RV_star" min="0" max="5" step="1" value="1" required>
					<span class="text" id="input_span">1</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="RV_content" cols="50" rows="10" required="required" placeholder="상대방 후기를 작성해주세요."></textarea>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="후기 작성" class="btnMsg">
				<button class="btnMsg" onclick="closeMsg()">닫기</button>
			</td>
		</tr>
	</table>
</form>
</c:if>
</body>
</html>