<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menuTitle {
	color: #000000;
	margin-left: 30px;
}

.page_num {
	color: #000000;
}

.pagination_bottom {
	display: inline-flex;
	margin-top: 100px;
}

.page_current_num {
	color: orange;
}

.pagination_bottom li a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container" align="center">
<h2 class="title">이용 내역 목록</h2>
		<table class="table">
			<tr>
				<th class="col-md-2 text-center">번호</th>
				<th class="col-md-3 text-center">닉네임</th>
				<th class="col-md-2 text-center">성별</th>
				<th class="col-md-3 text-center">가입일</th>
				<th class="col-md-2 text-center">평점</th>
			</tr>
			<c:if test="${empty fvList }">
				<tr>
					<th colspan="5" class="text-center">등록한 회원이 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty fvList }">
				<c:forEach var="fvList" items="${fvList }">
					<tr>
							<td class="col-md-2 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
							<td class="col-md-3 text-center">
								<a onclick="window.open('profileView.do?MB_nickName=${fvList.MB_nickName }', '',
									'width=500,height=1000,location=no,status=no,scrollbars=yes');">${fvList.MB_nickName }</a>
							</td>
							
							<c:if test="${fvList.MB_gender == '1' || fvList.MB_gender == '3'}">
									<td class="col-md-2 text-center">남자</td>	
							</c:if>
							<c:if test="${fvList.MB_gender == '2' || fvList.MB_gender == '4'}">
									<td class="col-md-2 text-center">여자</td>
							</c:if>
							
							<td class="col-md-3 text-center">${fvList.MB_regDate }</td>
							
							<td class="col-md-2 text-center">${fvList.reviewAvg }</td>				
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="favoriteList.do?pageNum=1&search=${favorite.search }&keyword=${favorite.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span></a></li>
					<li><a href="favoriteList.do?pageNum=${pb.startPage - 1 }&search=${favorite.search }&keyword=${favorite.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li><a href="favoriteList.do?pageNum=${i }&search=${favorite.search }&keyword=${favorite.keyword }"
							class="page_num page_current_num">ㅤ${i}ㅤ</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="favoriteList.do?pageNum=${i }&search=${favorite.search }&keyword=${favorite.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="favoriteList.do?pageNum=${pb.endPage + 1 }&search=${favorite.search }&keyword=${favorite.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="favoriteList.do?pageNum=${pb.totalPage }&search=${favorite.search }&keyword=${favorite.keyword }"
						class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="favoriteList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="NT_title,NT_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == favorite.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != favorite.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${favorite.keyword }">	<!-- model에 추가해줘야한다 -->
			<input type="submit" value="검색" class="btn btn-info">
		</form>
	</div>
</body>
</html>