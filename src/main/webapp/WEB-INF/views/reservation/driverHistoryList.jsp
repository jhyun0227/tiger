<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1 class="title">드라이버 이용내역</h1>
<div class="searchDIV">
	<form action="driverHistoryList.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="CP_startDate,CP_startPoint,CP_endPoint" delims="," varStatus="i">
					<c:if test="${sh == carpool.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != carpool.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${carpool.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
			</form>
		</div>
<table class="table">
	<tr>
		<th class="col-md-2 text-center">번호</th>
		<th class="col-md-2 text-center">상세페이지</th>
		<th class="col-md-2 text-center">출발일</th>
		<th class="col-md-2 text-center">출발지</th>
		<th class="col-md-2 text-center">도착지</th>
		<th class="col-md-2 text-center">후기 작성</th>
	</tr>
	<c:if test="${empty myCarpoolList}">
		<tr>
			<th colspan="6" class="text-center">이용내역이 존재하지 않습니다</th>
		</tr>
	</c:if>
	<c:if test="${not empty myCarpoolList }">
		<c:forEach var="carpool" items="${myCarpoolList }">
			<tr>
				<c:if test="${carpool.CP_del != 'Y' }">
					<td class="col-md-2 text-center">${num }
					<c:set var="num" value="${num -1 }"></c:set></td>
					<td class="col-md-2 text-center">
						<a href="cpView.do?CP_num=${carpool.CP_num }&pageNum=${pageNum}" class="menuTitle">
						이동</a></td>
					<td class="col-md-2 text-center">${carpool.CP_startDate }</td>
					<td class="col-md-2 text-center">${carpool.CP_startPoint }</td>
					<td class="col-md-2 text-center">${carpool.CP_endPoint }</td>
					
					<!-- 날짜 비교해서 후기 작성 버튼 활성화 만들것 -->
					<td class="col-md-2 text-center">
																								<!-- DMB_num에는 후기테이블에 작성자 컬럼에 들어가기 위해 카풀 게시글 등록자의 이름을 보냄 -->
						<a onclick="window.open('driverReservationList.do?CP_num=${carpool.CP_num}', '',
							'width=430,height=400,location=no,status=no,scrollbars=yes');" class="menuTitle">후기 작성</a>
					</td>				
				</c:if>
			</tr>
		</c:forEach>
	</c:if>	
</table>
<div align="center">
	<ul class="pagination_bottom">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="driverHistoryList.do?pageNum=1&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
				<span class="glyphicon glyphicon-backward"></span>
				</a>
			</li>
			<li><a href="driverHistoryList.do?pageNum=${pb.pagePerBlock }&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-left"></span>
				</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li><a href="driverHistoryList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num page_current_num">ㅤ${i}ㅤ</a>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="driverHistoryList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">ㅤ${i}ㅤ</a>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="driverHistoryList.do?pageNum=${pb.endPage+1 }&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-right"></span>
				</a>
			</li>
			<li><a href="driverHistoryList.do?pageNum=${pb.totalPage }&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
				<span class="glyphicon glyphicon-forward"></span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>