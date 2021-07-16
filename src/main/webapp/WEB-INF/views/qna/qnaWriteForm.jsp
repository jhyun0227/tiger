<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
.filebox label {
    display: inline-block;
    width: 80px;
    height: 30px;
    border: none;
    background: #242526;
    color: #eee;
    font-size: 16px;
    text-align: center;
    cursor: pointer;
    line-height: 30px;
} 
/* named upload */
.filebox .upload-name {
	display: inline-block;
	background-color: white;
	cursor: pointer;
	border: none;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
</style>

<script type="text/javascript">
$(document).ready( function(){ 
	var fileTarget = $('.filebox .upload-hidden'); 
	
	fileTarget.on('change', function(){ // 값이 변경되면 
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name;
		} 
		else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
		} 
	// 추출한 파일명 삽입 
	$(this).siblings('.upload-name').val(filename);
	}); 
});
</script>  
</head>
<body>
<div align="center">
	<h2 class="title">1:1 문의하기</h2>
	<form action="qnaWriteResult.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="QA_ref" value="${QA_ref }">
		<input type="hidden" name="QA_refLevel" value="${QA_refLevel }">
		<input type="hidden" name="QA_refStep" value="${QA_refStep }">
		<table class="table narrowWidth">
			<c:if test="${num==0 }">
				<tr>
					<td><input type="text" name="QA_title" required="required" autofocus="autofocus" class="inputLine" placeholder="제목을 입력하세요"></td>
				</tr>
			</c:if>
			<c:if test="${num!=0 }">
				<tr>
					<td><input type="text" name="QA_title" required="required" autofocus="autofocus" value="re:"></td>
				</tr>
			</c:if>
			<tr>
				<td><textarea rows="10" cols="100" name="QA_content" required="required" class="inputLine" placeholder="내용을 입력하세요"></textarea></td>
			</tr>
			<tr>
				<td>
					<div class="filebox"> 
						<label for="ex_filename">업로드</label> 
						<input class="upload-name" disabled="disabled"> 
						<input type="file" id="ex_filename" name="file" class="upload-hidden"> 	
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center"><input type="submit" value="작성하기" class="btn_small"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>