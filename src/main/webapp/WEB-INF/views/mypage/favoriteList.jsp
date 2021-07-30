<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1 class="title">좋아요</h1>
<div class="searchDIV">
	<form action="favoriteList.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="MB_nickName,MB_id" delims="," varStatus="i">
					<c:if test="${sh == favorite.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != favorite.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${favorite.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
			</form>
		</div>
<table class="table">
	<tr>
		<th class="col-md-2 text-center">번호</th>
		<th class="col-md-2 text-center">닉네임</th>
		<th class="col-md-2 text-center">아이디</th>
		<th class="col-md-2 text-center">성별</th>
		<th class="col-md-2 text-center">가입일</th>
		<th class="col-md-2 text-center">평점</th>
	</tr>
	<c:if test="${empty fvList}">
		<tr>
			<th colspan="6" class="text-center">등록한 회원이 존재하지 않습니다.</th>
		</tr>
	</c:if>
	<c:if test="${not empty fvList }">
		<c:forEach var="fvList" items="${fvList }">
			<tr>
				<td class="col-md-2 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
				<td class="col-md-2 text-center">
					<a onclick="window.open('profileView.do?MB_nickName=${fvList.MB_nickName }', '',
						'width=500,height=560,location=no,status=no,scrollbars=yes');" class="">${fvList.MB_nickName }</a>
				</td>
				
				<td class="col-md-2 text-center">${fvList.MB_id }</td>
				
				<c:if test="${fvList.MB_gender == '1' || fvList.MB_gender == '3'}">
						<td class="col-md-2 text-center">남자</td>	
				</c:if>
				<c:if test="${fvList.MB_gender == '2' || fvList.MB_gender == '4'}">
						<td class="col-md-2 text-center">여자</td>
				</c:if>
				
				<td class="col-md-2 text-center">${fvList.MB_regDate }</td>
				
				<td class="col-md-2 text-center">${fvList.reviewAvg }</td>			
			</tr>
		</c:forEach>
	</c:if>
	<tr>
		<td colspan="6"></td>
	</tr>
</table>
<div align="center">
	<ul class="pagination_bottom">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="favoriteList.do?pageNum=1&search=${favorite.search }&keyword=${favorite.keyword}" class="page_num">
				<span class="glyphicon glyphicon-backward"></span>
				</a>
			</li>
			<li><a href="favoriteList.do?pageNum=${pb.pagePerBlock }&search=${favorite.search }&keyword=${favorite.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-left"></span>
				</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li><a href="favoriteList.do?pageNum=${i}&search=${favorite.search }&keyword=${favorite.keyword}" class="page_num page_current_num">ㅤ${i}ㅤ</a>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="favoriteList.do?pageNum=${i}&search=${favorite.search }&keyword=${favorite.keyword}" class="page_num">ㅤ${i}ㅤ</a>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="favoriteList.do?pageNum=${pb.endPage+1 }&search=${favorite.search }&keyword=${favorite.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-right"></span>
				</a>
			</li>
			<li><a href="favoriteList.do?pageNum=${pb.totalPage }&search=${favorite.search }&keyword=${favorite.keyword}" class="page_num">
				<span class="glyphicon glyphicon-forward"></span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>