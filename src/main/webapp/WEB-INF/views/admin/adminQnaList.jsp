<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.box {
	   margin-top: -30px;
	}   
</style>
<script type="text/javascript">
/* 이전페이지 */
	function prev(){
		var preUrl = document.referrer.split("/")[4];
		location.href=preUrl;
	}
</script>
</head>
<body>
	<h1 class="title">문의내역</h1>
	<div class="searchDIV">
		<form action="adminQnaList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="QA_title,MB_id,QA_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == qna.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != qna.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${qna.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
		</form>
	</div>
	<table class="table">
		<tr>
			<th class="col-md-2 text-center">작성일</th>
			<th class="col-md-2 text-center">작성자</th>
			<th class="col-md-6 text-center">제목</th>
			<th class="col-md-2 text-center">삭제유무</th>
		</tr>
		<c:if test="${empty allQnaList}">
			<tr>
				<td colspan="4" class="text-center">문의내역이 존재하지 않습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty allQnaList }">
			<c:forEach var="qna" items="${allQnaList }">
				<tr>
					<c:if test="${qna.QA_refLevel > 0 }">
						<td class="col-md-2 text-center">${qna.QA_regDate }</td>
						<td class="col-md-2 text-center">${qna.MB_nickName }</td>
						<td class="col-md-6 text-left title_left">
							<a href="adminQnaView.do?num=${qna.QA_num }&pageNum=${pb.currentPage}"
								class="menuTitle">　　${qna.QA_title }</a></td>
						<td class="col-md-2 text-center">${qna.QA_del }</td>
						</c:if>
						<c:if test="${qna.QA_refLevel == 0 }">
						<td class="col-md-2 text-center">${qna.QA_regDate }</td>
						<td class="col-md-2 text-center">${qna.MB_nickName }</td>
						<td class="col-md-6 text-left title_left">
							<a href="adminQnaView.do?num=${qna.QA_num }&pageNum=${pb.currentPage}"
								class="menuTitle">${qna.QA_title }</a></td>
						<td class="col-md-2 text-center">${qna.QA_del }</td>
						</c:if>
				</tr>
			</c:forEach>
		</c:if>
		    <tr>
				<td colspan="5" >
					<div align="right" class="box">
					  <input type="button" value="이전" class="btn_sm_stroke" onclick="prev()"> 
					  <input type="button" value="관리자 메인" class="btn_sm_stroke" 
					  		onclick="location.href='adminMain.do?MB_id=${member.MB_id }&pageNum=${pageNum }' "> 
					 </div>
				</td>
			</tr>
	</table>
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="adminQnaList.do?pageNum=1&search=${qna.search }&keyword=${qna.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminQnaList.do?pageNum=${pb.startPage - 1 }&search=${qna.search }&keyword=${qna.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminQnaList.do?pageNum=${i }&search=${qna.search }&keyword=${qna.keyword }"
							class="page_num page_current_num">　${i}　</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminQnaList.do?pageNum=${i }&search=${qna.search }&keyword=${qna.keyword }"
							class="page_num">　${i }　</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminQnaList.do?pageNum=${pb.endPage + 1 }&search=${qna.search }&keyword=${qna.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminQnaList.do?pageNum=${pb.totalPage }&search=${qna.search }&keyword=${qna.keyword }"
							class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
	</div>
</body>
</html>