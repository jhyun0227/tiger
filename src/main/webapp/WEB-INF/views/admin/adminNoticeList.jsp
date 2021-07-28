<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.btnDiv{
	margin-top: 50px;
}

#page_btn{
	margin-top: -90px;
}
</style>
</head>
<body>
	<h2 class="title">공지사항</h2>
	<div class="searchDIV">
		<form action="adminNoticeList.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="NT_title,NT_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == notice.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != notice.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${notice.keyword }" class="inputUnderLine">
			<input type="submit" value="검색" class="btn_search">
		</form>
		</div>
		<table class="table">
			<tr>
				<th class="col-md-1 text-center">번호</th>
				<th class="col-md-6 text-center">제목</th>
				<th class="col-md-2 text-center">작성자</th>
				<th class="col-md-2 text-center">작성일</th>
				<th class="col-md-1 text-center">삭제유무</th>
			</tr>
			<c:if test="${empty noticeList }">
				<tr>
					<th colspan="5" class="text-center">공지사항이 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty noticeList }">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td class="col-md-1 text-center">${num }
						<c:set var="num" value="${num -1 }"></c:set></td>
						<td class="col-md-6 text-center">
							<a href="adminNoticeView.do?NT_num=${notice.NT_num}&pageNum=${pb.currentPage}"
								class="menuTitle">${notice.NT_title }</a></td>
						<td class="col-md-2 text-center">관리자</td>
						<td class="col-md-2 text-center">${notice.NT_regDate }</td>
						<td class="col-md-1 text-center">${notice.NT_del }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div class="btnDiv" align="right">
				<a href="adminNoticeWriteForm.do?NT_num=0&pageNum=1" class="btn_sm_stroke">작성</a>
		</div>
		
		<div align="center" id="page_btn">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="adminNoticeList.do?pageNum=1&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span></a></li>
					<li><a href="adminNoticeList.do?pageNum=${pb.startPage - 1 }&search=${notice.search }&keyword=${notice.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li><a href="adminNoticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num page_current_num">ㅤ${i}ㅤ</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminNoticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminNoticeList.do?pageNum=${pb.endPage + 1 }&search=${notice.search }&keyword=${notice.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminNoticeList.do?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword }"
						class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
			<!-- 	</div> -->
</body>
</html>