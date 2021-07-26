<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/common.css">
<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/msgList.css">
<script type="text/javascript">
/* 체크박스 */
$(function(){
	var chkObj = document.getElementsByName("rowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='rowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='rowCheck']").click(function(){
		if($("input[name='rowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked=true;
		}else {
			$("input[name='allCheck']")[0].checked=false;
		}
	});	
});

/* 선택 삭제 */
function deleteValue(){
	var conUrl = document.location.href.split("/")[4]; //현재페이지
	var url="msgDeleteS.do?";
	var valueArr = new Array();
	var list = $("input[name='rowCheck']");
	for(var i = 0;i<list.length;i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length==0) {
		alert("삭제할 쪽지를 선택하세요");
	}else {
		if (confirm("선택한 쪽지를 삭제하시겠습니까?") == true){
			$.ajax({
				url: url,
				type:'POST',
				traditional : true,
				data:{
					valueArr : valueArr
				},
				success: function(jdata){
					if(jdata=1){
						location.href=conUrl; //삭제 후 기존 페이지로 이동
					}
					else{
						alert("쪽지 삭제에 실패했습니다. 다시 시도해주세요");
						history.back();
					}
				}
			});	
		}else {
			return false;
		}
	}
}
</script>
</head>
<body>
<h2 class="title">보낸 쪽지함</h2>
<form method="post" name="frm">
	<table class="table" style="table-layout:fixed">
		<tr>
			<th class="col-md-1 text-center"><input type="checkbox" id="allCheck" name="allCheck"></th>
			<th class="col-md-2 text-center">받은 사람</th>
			<th class="col-md-7 text-center">내용</th>
			<th class="col-md-2 text-center">보낸 날짜</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="4" class="text-center">쪽지가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="message" items="${list}">
				<tr>
				<c:if test="${message.MSG_delS != 'Y'}">
					<td class="text-center"><input type="checkbox" name="rowCheck" value="${message.MSG_num }" ></td>
					<td class="text-center">${message.nicknameR }</td>
					<td class="ellip">
						<a href="msgView.do?MSG_num=${message.MSG_num }&pageNum=${pb.currentPage}">${message.MSG_content }</a>
					</td>
					<td class="text-center">${message.MSG_regDate }</td>
				</c:if>
				</tr>
			</c:forEach>
		</c:if>
		<!-- 삭제버튼  -->
		<tr>
			<td class="text-center"><input type="button" class="btn_sm_stroke" value="삭제" onclick="deleteValue();"></td>
			<td colspan="3"></td>
		</tr>
	</table>
</form>

<!-- 페이지네이션 -->
<div align="center">
	<ul class="pagination_bottom">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="msgSendList.do?pageNum=1" class="page_num">
				<span class="glyphicon glyphicon-backward"></span>
				</a>
			</li>
			<li><a href="msgSendList.do?pageNum=${pb.pagePerBlock }" class="page_num">
				<span class="glyphicon glyphicon-triangle-left"></span>
				</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li><a href="msgSendList.do?pageNum=${i}" class="page_num page_current_num">ㅤ${i}ㅤ</a>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="msgSendList.do?pageNum=${i}" class="page_num">ㅤ${i}ㅤ</a>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="msgSendList.do?pageNum=${pb.endPage+1 }" class="page_num">
				<span class="glyphicon glyphicon-triangle-right"></span>
				</a>
			</li>
			<li><a href="msgSendList.do?pageNum=${pb.totalPage}" class="page_num">
				<span class="glyphicon glyphicon-forward"></span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>